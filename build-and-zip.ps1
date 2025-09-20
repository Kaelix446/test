# build-and-zip.ps1
# Usage: run in project root on Windows PowerShell
# This script installs deps, builds the Vite production bundle and creates car-dist.zip

Param()

Write-Host "Checking for npm..."
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
  Write-Error "npm not found in PATH. Install Node.js and npm, then re-run this script."
  exit 1
}

Write-Host "Installing dependencies (npm ci)..."
npm ci
if ($LASTEXITCODE -ne 0) { Write-Error "npm ci failed"; exit $LASTEXITCODE }

Write-Host "Building production bundle (npm run build)..."
npm run build
if ($LASTEXITCODE -ne 0) { Write-Error "npm run build failed"; exit $LASTEXITCODE }

$dist = Join-Path $PSScriptRoot 'dist'
if (-not (Test-Path $dist)) { Write-Error "Build did not produce dist/ folder"; exit 1 }

$zip = Join-Path $PSScriptRoot 'car-dist.zip'
if (Test-Path $zip) { Remove-Item $zip -Force }

Write-Host "Creating zip: $zip"
Compress-Archive -Path (Join-Path $dist '*') -DestinationPath $zip

Write-Host "Done. Upload 'car-dist.zip' to your hosting control panel and extract into public_html/car/ (overwrite existing files)."
Write-Host "Alternatively, use the included GitHub Actions workflow to deploy automatically via FTP when you push to 'main'."
