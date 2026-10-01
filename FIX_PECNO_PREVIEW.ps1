# Run this from the root of the Quarto website repository.
# It removes stale generated PeCNO output and stops orphaned Quarto renderer processes.

$ErrorActionPreference = "Continue"

Write-Host "Stopping stale Quarto/Pandoc/Deno processes..."
Get-Process quarto, pandoc, deno -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

Write-Host "Removing stale PeCNO render products..."
Remove-Item ".\projects\pecno\index.html" -Force -ErrorAction SilentlyContinue
Remove-Item ".\_site\projects\pecno" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item ".\.quarto" -Recurse -Force -ErrorAction SilentlyContinue

# The original patch contained this instructions file as Markdown.  If present,
# remove it from the website tree because Quarto treats root .md files as pages.
if (Test-Path ".\PECNO_SITE_CHANGES.md") {
    Move-Item ".\PECNO_SITE_CHANGES.md" ".\PECNO_SITE_CHANGES.txt" -Force
}

Write-Host "Running a clean render..."
quarto render

if ($LASTEXITCODE -eq 0) {
    Write-Host "Render succeeded. Starting preview..."
    quarto preview
} else {
    Write-Host "Render failed. If the error is still OS error 32, a Windows process is still holding projects\pecno\index.html open."
    Write-Host "Close Explorer preview panes/editors touching that file. If the repository is on a mapped/network Z: drive, copy it to a local C: path and retry."
}
