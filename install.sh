#!/bin/zsh
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
SYSTEM_TARGET_DIR="$TARGET_DIR/.system"

mkdir -p "$TARGET_DIR"
mkdir -p "$SYSTEM_TARGET_DIR"

should_install_as_system_skill() {
  local skill_name="$1"
  [[ "$skill_name" == "signal-first" || "$skill_name" == "cv-positioning-copy" ]]
}

copy_skill() {
  local skill_name="$1"
  if [[ ! -d "$SOURCE_DIR/$skill_name" ]]; then
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

if [[ "$#" -eq 0 ]]; then
  for skill_dir in "$SOURCE_DIR"/*; do
    [[ -d "$skill_dir" ]] || continue
    skill_name="$(basename "$skill_dir")"
    [[ "$skill_name" == .* ]] && continue
    copy_skill "$skill_name"
  done
else
  for skill_name in "$@"; do
    copy_skill "$skill_name"
  done
fi
