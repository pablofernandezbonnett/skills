#!/bin/zsh
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
SYSTEM_TARGET_DIR="$TARGET_DIR/.system"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh             Install or refresh every skill in this repo
  ./install.sh <skill>...  Install or refresh one or more named skills
  ./install.sh --list      List installable skills
EOF
}

require_command() {
  local command_name="$1"
  if ! command -v "$command_name" >/dev/null 2>&1; then
    echo "Missing required command: $command_name" >&2
    exit 1
  fi
}

is_skill_dir() {
  local dir_path="$1"
  [[ -d "$dir_path" && -f "$dir_path/SKILL.md" ]]
}

list_skills() {
  local skill_dir
  for skill_dir in "$SOURCE_DIR"/*; do
    is_skill_dir "$skill_dir" || continue
    basename "$skill_dir"
  done
}

mkdir -p "$TARGET_DIR"
mkdir -p "$SYSTEM_TARGET_DIR"

should_install_as_system_skill() {
  local skill_name="$1"
  [[ "$skill_name" == "signal-first" || "$skill_name" == "cv-positioning-copy" ]]
}

copy_skill() {
  local skill_name="$1"
  if ! is_skill_dir "$SOURCE_DIR/$skill_name"; then
    echo "Skill not found: $skill_name" >&2
    exit 1
  fi
  rsync -a --delete "$SOURCE_DIR/$skill_name/" "$TARGET_DIR/$skill_name/"
  echo "Installed: $skill_name -> $TARGET_DIR/$skill_name"

  if should_install_as_system_skill "$skill_name"; then
    rsync -a --delete "$SOURCE_DIR/$skill_name/" "$SYSTEM_TARGET_DIR/$skill_name/"
    echo "Installed system skill: $skill_name -> $SYSTEM_TARGET_DIR/$skill_name"
  fi
}

require_command rsync

if [[ "$#" -gt 0 && ( "$1" == "--help" || "$1" == "-h" ) ]]; then
  usage
  exit 0
fi

if [[ "$#" -gt 0 && "$1" == "--list" ]]; then
  list_skills
  exit 0
fi

if [[ "$#" -eq 0 ]]; then
  local skill_dir skill_name
  for skill_dir in "$SOURCE_DIR"/*; do
    is_skill_dir "$skill_dir" || continue
    skill_name="$(basename "$skill_dir")"
    copy_skill "$skill_name"
  done
else
  local skill_name
  for skill_name in "$@"; do
    copy_skill "$skill_name"
  done
fi
