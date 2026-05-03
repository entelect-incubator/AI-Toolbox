$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$packageJson = Join-Path $root "package.json"

if (Test-Path $packageJson) {
    npm --prefix $root run lint
    Write-Host "Lint completed."
    exit 0
}

Write-Host "No lint command configured. Skipping lint-generated step."
