# 发布到 GitHub

## 网页方式

1. 登录 GitHub，点击右上角的“+”，选择“New repository”。
2. 仓库名建议填写 `nai-wa-codex-pet`。
3. 简介建议填写：`符合 Codex 原版像素风的奶蛙 v2 桌面宠物，含中文安装说明与自动安装提示词。`
4. 选择 `Public`。
5. 因为本地文件夹已经包含 README、`.gitignore` 和许可证，不要再让 GitHub 初始化这些文件。
6. 创建空仓库后，按页面给出的远程地址执行下面的命令。

## 命令行方式

在本目录中执行：

```bash
git init
git add .
git commit -m "发布奶蛙 Codex Pet v1.0.0"
git branch -M main
git remote add origin https://github.com/<你的用户名>/nai-wa-codex-pet.git
git push -u origin main
```

如果使用 SSH，把远程地址改为：

```text
git@github.com:<你的用户名>/nai-wa-codex-pet.git
```

## 发布后建议

1. 在仓库右侧 About 中添加主题：`codex`、`codex-pet`、`pixel-art`、`desktop-pet`、`nai-wa`。
2. 创建 `v1.0.0` Release，并在说明中列出四个招牌动作和安装方法。
3. 把仓库真实地址填入 [INSTALL-PROMPT.md](INSTALL-PROMPT.md) 后再分享提示词。
4. 在另一台机器或临时 Codex 环境中测试一次脚本安装和手动安装。
5. 发布新图集时更新版本说明、预览文件与 `SHA256SUMS`。

GitHub 官方仓库入门：<https://docs.github.com/zh/repositories/creating-and-managing-repositories/quickstart-for-repositories>
