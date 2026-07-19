# 发给 Codex 的自动安装提示词

先把下面的 `<仓库地址>` 替换为实际 GitHub 地址，再把整段提示词发给需要安装奶蛙的 Codex。

## 完整版

```text
请帮我从下面的 GitHub 仓库安装 Codex 自定义宠物“奶蛙”：

仓库地址：<仓库地址>

请直接完成安装，并遵守这些要求：

1. 先阅读仓库中的 README.md、pet.json、SHA256SUMS 和本提示文件，确认项目确实是 Codex 自定义宠物。
2. 把仓库下载或克隆到临时目录。不要修改 Codex 应用程序包，不要注入应用代码，也不要改动其他宠物。
3. 检查 pet.json：id 必须是 nai-wa，spriteVersionNumber 必须是 2，spritesheetPath 必须指向 spritesheet.webp。
4. 如果当前环境支持 shasum 或 sha256sum，使用 SHA256SUMS 验证 pet.json 与 spritesheet.webp。
5. 将 Codex 数据目录解析为：若 CODEX_HOME 已设置则使用 CODEX_HOME，否则使用当前用户主目录下的 .codex。
6. 目标目录必须精确为该数据目录下的 pets/nai-wa。若目标目录已存在，先在同级目录创建一个带时间戳的完整备份，不要覆盖或删除备份。
7. 只把仓库根目录的 pet.json 与 spritesheet.webp 复制到目标目录。不要把 README、预览图、.git 或临时文件装进宠物目录。
8. 复制完成后再次核对目标文件，并确认源文件与目标文件一致。
9. 告诉我安装位置、是否创建了备份、校验结果，以及如何在 Codex 的“设置 → Pets”中点击刷新、选择“奶蛙”并点击“Wake Pet”。如果刷新后仍未出现，提醒我完全退出并重新打开 Codex。

如果仓库无法访问、校验失败、清单字段不匹配或目标路径无法安全确定，请停止安装并明确报告问题，不要猜测路径。
```

## 简短版

```text
请安装这个 GitHub 仓库里的 Codex 自定义宠物“奶蛙”：<仓库地址>。先阅读 README 和 pet.json；验证 SHA256SUMS；若已安装旧版则先备份；然后只把 pet.json 和 spritesheet.webp 复制到自定义宠物目录：若设置了 CODEX_HOME 就使用 $CODEX_HOME/pets/nai-wa，否则使用 ~/.codex/pets/nai-wa。不要修改 Codex 应用程序包。安装后核对 id=nai-wa、spriteVersionNumber=2，并告诉我如何在“设置 → Pets”中刷新、选择和唤醒它。
```
