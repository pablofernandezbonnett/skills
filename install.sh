#!/bin/zsh
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$TARGET_DIR"

copy_skill() {
  local skill_name="$1"
  if [[ ! -d "$SOURCE_DIR/$skill_name" ]]; then
    echo "Skill not found: $skill_name" >&2
    exit 1
  fi
  rsync -a --delete "$SOURCE_DIR/$skill_name/" "$TARGET_DIR/$skill_name/"
  echo "Installed: $skill_name -> $TARGET_DIR/$skill_name"
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
