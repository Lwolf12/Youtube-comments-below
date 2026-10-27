# Builds the Chrome Web Store upload ZIP: manifest.json at the ZIP root, the
# extension files and icons, nothing else (no docs, workflow or store
# material). Output: dist/youtube-comments-below-v<version>-webstore.zip
#
# Uses git archive so entry names always use forward slashes; Compress-Archive
# on Windows PowerShell 5.1 writes icons\icon128.png and the store then cannot
# find the icons.
$ErrorActionPreference = 'Stop'
$src = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$ver = (Get-Content (Join-Path $src 'manifest.json') -Raw | ConvertFrom-Json).version
New-Item -ItemType Directory -Force (Join-Path $src 'dist') | Out-Null
$out = Join-Path $src "dist\youtube-comments-below-v$ver-webstore.zip"
git -C $src archive --format=zip -o $out HEAD -- . ':!.github' ':!.gitignore' ':!README.md' ':!RELEASING.md' ':!LICENSE' ':!store'
if ($LASTEXITCODE -ne 0) { throw 'git archive failed (commit your changes first: it packages HEAD)' }
Write-Host "Wrote $out"
