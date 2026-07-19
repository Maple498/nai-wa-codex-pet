$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceManifest = Join-Path $scriptDir "pet.json"
$sourceAtlas = Join-Path $scriptDir "spritesheet.webp"

if (-not (Test-Path -LiteralPath $sourceManifest -PathType Leaf) -or
    -not (Test-Path -LiteralPath $sourceAtlas -PathType Leaf)) {
    throw "安装失败：仓库根目录缺少 pet.json 或 spritesheet.webp。"
}

$manifest = Get-Content -LiteralPath $sourceManifest -Raw | ConvertFrom-Json
if ($manifest.id -ne "nai-wa") {
    throw "安装失败：pet.json 中的 id 不是 nai-wa。"
}
if ($manifest.spriteVersionNumber -ne 2) {
    throw "安装失败：pet.json 不是 v2 宠物清单。"
}

$codexDataDir = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }
$petParent = Join-Path $codexDataDir "pets"
$petTarget = Join-Path $petParent "nai-wa"

New-Item -ItemType Directory -Force -Path $petParent | Out-Null

if (Test-Path -LiteralPath $petTarget) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backupTarget = Join-Path $petParent "nai-wa.backup-$timestamp"
    Copy-Item -LiteralPath $petTarget -Destination $backupTarget -Recurse
    Write-Host "已备份原版本：$backupTarget"
}

New-Item -ItemType Directory -Force -Path $petTarget | Out-Null
Copy-Item -LiteralPath $sourceManifest -Destination (Join-Path $petTarget "pet.json") -Force
Copy-Item -LiteralPath $sourceAtlas -Destination (Join-Path $petTarget "spritesheet.webp") -Force

$sourceManifestHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourceManifest).Hash
$targetManifestHash = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $petTarget "pet.json")).Hash
$sourceAtlasHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $sourceAtlas).Hash
$targetAtlasHash = (Get-FileHash -Algorithm SHA256 -LiteralPath (Join-Path $petTarget "spritesheet.webp")).Hash

if ($sourceManifestHash -ne $targetManifestHash -or $sourceAtlasHash -ne $targetAtlasHash) {
    throw "安装失败：复制后的文件校验不一致。"
}

Write-Host "奶蛙安装完成：$petTarget"
Write-Host "请在 Codex 中打开“设置 → Pets”，点击刷新，选择“奶蛙”，再点击“Wake Pet”。"
Write-Host "如果仍未出现，请完全退出并重新打开 Codex。"

