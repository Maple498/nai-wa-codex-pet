#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_manifest="$script_dir/pet.json"
source_atlas="$script_dir/spritesheet.webp"

if [[ ! -f "$source_manifest" || ! -f "$source_atlas" ]]; then
  echo "安装失败：仓库根目录缺少 pet.json 或 spritesheet.webp。" >&2
  exit 1
fi

if ! grep -q '"id": "nai-wa"' "$source_manifest"; then
  echo "安装失败：pet.json 中的 id 不是 nai-wa。" >&2
  exit 1
fi

if ! grep -q '"spriteVersionNumber": 2' "$source_manifest"; then
  echo "安装失败：pet.json 不是 v2 宠物清单。" >&2
  exit 1
fi

codex_data_dir="${CODEX_HOME:-$HOME/.codex}"
pet_parent="$codex_data_dir/pets"
pet_target="$pet_parent/nai-wa"

mkdir -p "$pet_parent"

if [[ -e "$pet_target" ]]; then
  backup_target="$pet_parent/nai-wa.backup-$(date +%Y%m%d-%H%M%S)"
  cp -R "$pet_target" "$backup_target"
  echo "已备份原版本：$backup_target"
fi

mkdir -p "$pet_target"
cp "$source_manifest" "$pet_target/pet.json"
cp "$source_atlas" "$pet_target/spritesheet.webp"

cmp -s "$source_manifest" "$pet_target/pet.json"
cmp -s "$source_atlas" "$pet_target/spritesheet.webp"

echo "奶蛙安装完成：$pet_target"
echo "请在 Codex 中打开“设置 → Pets”，点击刷新，选择“奶蛙”，再点击“Wake Pet”。"
echo "如果仍未出现，请完全退出并重新打开 Codex。"

