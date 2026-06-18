# Installs this personal Claude Code config into ~/.claude (Windows).
$ErrorActionPreference = 'Stop'

$src  = $PSScriptRoot
$dest = Join-Path $HOME '.claude'

New-Item -ItemType Directory -Force -Path (Join-Path $dest 'skills') | Out-Null

$claudeMd = Join-Path $dest 'CLAUDE.md'
if (Test-Path $claudeMd) {
    $backup = "$claudeMd.$(Get-Date -Format 'yyyyMMddHHmmss').bak"
    Copy-Item $claudeMd $backup
    Write-Host "Backed up existing CLAUDE.md -> $backup"
}

Copy-Item (Join-Path $src 'CLAUDE.md') $claudeMd -Force
Copy-Item (Join-Path $src '.claude\skills\*') (Join-Path $dest 'skills') -Recurse -Force

Write-Host "Installed to $dest"
