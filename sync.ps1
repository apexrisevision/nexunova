# ═══════════════════════════════════════════════════════════
#  Nexunova.com — one-click sync to GitHub (auto-deploys via Pages)
# ═══════════════════════════════════════════════════════════
#  Usage: right-click → "Run with PowerShell"  (or just double-click .bat wrapper)
# ═══════════════════════════════════════════════════════════

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

Write-Host ""
Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  Nexunova.com  →  GitHub Pages  auto-sync      ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. Show what changed
$status = git status --porcelain
if (-not $status) {
    Write-Host "[i] No changes to sync. Site is already up to date." -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to close"
    exit 0
}

Write-Host "Changes detected:" -ForegroundColor Green
git status --short
Write-Host ""

# 2. Stage everything
git add -A

# 3. Commit with timestamp
$stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$msg = "Site update — $stamp"
git commit -m $msg | Out-Null
Write-Host "[✓] Committed: $msg" -ForegroundColor Green

# 4. Push to GitHub
Write-Host "[→] Pushing to GitHub…" -ForegroundColor Cyan
git push 2>&1 | ForEach-Object { Write-Host "    $_" }

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "[✓] DONE — site will be live on nexunova.com in 1–2 minutes." -ForegroundColor Green
    Write-Host "    (GitHub Pages rebuilds automatically)" -ForegroundColor DarkGray
} else {
    Write-Host ""
    Write-Host "[!] Push failed. See messages above." -ForegroundColor Red
}

Write-Host ""
Read-Host "Press Enter to close"
