# 奶蛙：符合 Codex 原版像素风的桌面宠物

一只黄色、圆润、专门按照 Codex 原版像素宠物视觉语言制作的 v2 桌面宠物。奶蛙会在任务进行、等待审批、完成或失败时播放不同动作；鼠标悬停时，它会站在原地捧腹大笑、前仰后合。

> **项目定位：Codex 原生像素风桌宠。** 按照 Codex 原版宠物的小尺寸像素表现、紧凑轮廓、状态动画和透明图集规范重新制作，放在 Codex 界面中更协调。

> 本项目为社区制作的非官方 Codex 宠物。

![奶蛙悬停捧腹大笑](assets/hover-belly-laugh.gif)

## 特点

- 视觉上遵循 Codex 原版像素宠物的简洁轮廓、有限细节和邻近像素质感。
- Codex 自定义宠物 v2 格式，`8 × 11` 图集。
- 单帧尺寸为 `192 × 208`，缩小后轮廓仍然清晰。
- 透明背景，无文字、场景、阴影或额外漂浮特效。
- 包含待机、移动、工作、等待、完成、失败和 16 个注视方向。
- 安装只需要两个运行文件：`pet.json` 和 `spritesheet.webp`。

## 为什么不是写实风

写实风奶蛙适合作为独立桌宠或大尺寸展示；这个版本的目标则是融入 Codex 原有宠物体系。因此它优先保留：

- 与 Codex 原版宠物相近的像素颗粒感和硬边轮廓。
- 在 `192 × 208` 单帧内仍可一眼识别的身体比例与表情。
- 缩小显示时不会糊成一团的手、脚、眼睛和嘴型。
- 与 Codex 状态直接对应的短循环动作，而不是长时间写实视频动画。

## 动作与触发方式

行号从 `0` 开始：

| 行 | 状态 | 当前动作与触发方式 |
| --- | --- | --- |
| 0 | `idle` | 待机、呼吸与眨眼 |
| 1 | `running-right` | 向右移动 |
| 2 | `running-left` | 向左移动 |
| 3 | `waving` | 首次唤醒或首次展示时，正脸伸手 |
| 4 | `jumping` | 鼠标悬停时，站地捧腹大笑、前仰后合 |
| 5 | `failed` | 任务失败时晕倒 |
| 6 | `waiting` | 需要输入、审批或权限确认时左顾右盼 |
| 7 | `running` | 任务执行中敲键盘 |
| 8 | `review` | 任务完成且结果尚未查看时鼓腮憋笑 |
| 9–10 | `look` | 16 个方向注视帧 |

更多动作可以在[完整动作表](assets/contact-sheet.png)中查看。

## 安装

### 方法一：macOS 或 Linux 安装脚本

下载或克隆本仓库，进入仓库目录后执行：

```bash
chmod +x install.sh
./install.sh
```

脚本只会把 `pet.json` 和 `spritesheet.webp` 复制到 Codex 自定义宠物目录。如果已安装旧版奶蛙，脚本会先在同级目录创建带时间戳的备份。

### 方法二：Windows PowerShell 安装脚本

在仓库目录打开 PowerShell，执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

如果已安装旧版，脚本同样会先创建备份。

### 方法三：手动安装

Codex 的自定义宠物目录为：

- 若设置了 `CODEX_HOME`：`$CODEX_HOME/pets/`
- 默认位置：`~/.codex/pets/`

在其中创建 `nai-wa` 文件夹，然后把这两个文件放进去：

```text
nai-wa/
├── pet.json
└── spritesheet.webp
```

macOS 或 Linux 可执行：

```bash
pet_target="${CODEX_HOME:-$HOME/.codex}/pets/nai-wa"
mkdir -p "$pet_target"
cp pet.json spritesheet.webp "$pet_target/"
```

### 在 Codex 中启用

1. 完全退出并重新打开 Codex；或者进入“设置 → Pets”后点击刷新按钮。
2. 在“Pick a pet”中找到“奶蛙”。
3. 点击“Select”。
4. 若宠物还没有出现，点击“Wake Pet”。

如果找不到奶蛙，请检查 `pet.json` 与 `spritesheet.webp` 是否位于同一个 `nai-wa` 文件夹内，并确认 `pet.json` 中的 `spriteVersionNumber` 为 `2`。

## 让 Codex 自动安装

把 [INSTALL-PROMPT.md](INSTALL-PROMPT.md) 中的提示词连同仓库地址发给对方的 Codex，它会先检查文件、备份旧版本，再完成本地安装。

简短版提示词：

```text
请帮我安装这个 GitHub 仓库中的 Codex 自定义宠物“奶蛙”：<仓库地址>。请先阅读仓库 README 和 INSTALL-PROMPT.md，只把 pet.json 与 spritesheet.webp 安装到当前用户的 Codex 自定义宠物目录；如果目标目录已存在，先创建备份。不要修改 Codex 应用程序包。安装后验证 pet.json 的 id 为 nai-wa、spriteVersionNumber 为 2，并告诉我如何在“设置 → Pets”里刷新、选择并唤醒它。
```

## 仓库内容

```text
.
├── pet.json                 # 宠物清单，安装必需
├── spritesheet.webp         # 8×11 动画图集，安装必需
├── install.sh               # macOS/Linux 安装脚本
├── install.ps1              # Windows 安装脚本
├── INSTALL-PROMPT.md        # 发给 Codex 的自动安装提示词
├── assets/                  # README 预览素材
├── SHA256SUMS               # 两个安装文件的校验值
├── ASSET-LICENSE.md         # 图像资产授权与说明
├── LICENSE                  # MIT 英文法律文本
├── LICENSE.zh-CN.md         # MIT 中文参考译文
├── CONTRIBUTING.md          # 中文贡献指南
├── PUBLISHING.md            # 发布到 GitHub 的中文步骤
├── CHANGELOG.md             # 中文更新日志
└── .github/                 # 中文 Issue 与 PR 模板
```

真正运行时只有 `pet.json` 和 `spritesheet.webp` 必需。README、预览图、许可证和安装脚本用于介绍、分发与协作。

## 校验文件

macOS：

```bash
shasum -a 256 -c SHA256SUMS
```

Linux：

```bash
sha256sum -c SHA256SUMS
```


## 贡献

欢迎提交 Issue 和 Pull Request。修改图集时请保持 v2 的 `1536 × 2288` 尺寸、透明背景、单帧 `192 × 208` 规格与既有状态顺序。详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

请不要把从网络收集的原始参考图直接提交到仓库；公开仓库仅保留最终制作的宠物图集与预览文件。

## 授权与权利说明

- 安装脚本、说明文档及仓库组织文件采用 [MIT License](LICENSE)。
- `spritesheet.webp` 与 `assets/` 中由本项目制作的像素动画和预览资产采用 [CC BY 4.0](ASSET-LICENSE.md)。

这段说明不是法律意见。如有明确权利主张，请通过 Issue 联系维护者处理。
