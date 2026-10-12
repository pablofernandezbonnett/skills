#!/bin/zsh
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
SYSTEM_TARGET_DIR="$TARGET_DIR/.system"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh [--dry-run] [--system] [skill ...]
  ./install.sh --list
  ./install.sh --help

By default, install into $CODEX_HOME/skills (or ~/.codex/skills).
Existing files with the same names are overwritten; other files are kept.
--system also installs signal-first and cv-positioning-copy into .system.
EOF
}

is_skill_dir() {
  [[ -d "$1" && -f "$1/SKILL.md" ]]
}

list_skills() {
  local skill_dir
  for skill_dir in "$SOURCE_DIR"/*; do
    is_skill_dir "$skill_dir" || continue
    basename "$skill_dir"
  done
}

if [[ "$#" -eq 1 ]]; then
  case "$1" in
    --help|-h) usage; exit 0 ;;
    --list) list_skills; exit 0 ;;
  esac
fi

dry_run=false
include_system=false
typeset -a skill_names
skill_names=()

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --dry-run) dry_run=true ;;
    --system) include_system=true ;;
    -*) echo "Unknown option: $1" >&2; usage >&2; exit 1 ;;
    *) skill_names+=("$1") ;;
  esac
  shift
done

if [[ "${#skill_names[@]}" -eq 0 ]]; then
  for skill_dir in "$SOURCE_DIR"/*; do
    is_skill_dir "$skill_dir" || continue
    skill_names+=("$(basename "$skill_dir")")
  done
fi

for skill_name in "${skill_names[@]}"; do
  if [[ ! "$skill_name" =~ '^[a-z0-9][a-z0-9-]*$' ]]; then
    echo "Invalid skill name: $skill_name" >&2
    exit 1
  fi
  if ! is_skill_dir "$SOURCE_DIR/$skill_name"; then
    echo "Skill not found: $skill_name" >&2
    exit 1
  fi
done

if [[ "$dry_run" == false ]]; then
  if ! command -v rsync >/dev/null 2>&1; then
    echo "Missing required command: rsync" >&2
    exit 1
  fi
  mkdir -p "$TARGET_DIR"
  if [[ "$include_system" == true ]]; then
    mkdir -p "$SYSTEM_TARGET_DIR"
  fi
fi

copy_skill() {
  local skill_name="$1"
  local destination="$2"
  if [[ "$dry_run" == true ]]; then
    echo "Would install: $skill_name -> $destination"
  else
    rsync -a "$SOURCE_DIR/$skill_name/" "$destination/"
    echo "Installed: $skill_name -> $destination"
  fi
}

for skill_name in "${skill_names[@]}"; do
  copy_skill "$skill_name" "$TARGET_DIR/$skill_name"

  if [[ "$include_system" == true &&
        ( "$skill_name" == signal-first || "$skill_name" == cv-positioning-copy ) ]]; then
    copy_skill "$skill_name" "$SYSTEM_TARGET_DIR/$skill_name"
  fi
done
