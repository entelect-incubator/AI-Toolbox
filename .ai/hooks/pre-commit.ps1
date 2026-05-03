$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..")

Write-Host "Running AI toolbox pre-commit checks..."
& (Join-Path $root ".ai\hooks\validate-specs.ps1")
& (Join-Path $root ".ai\hooks\lint-generated.ps1")
Write-Host "Pre-commit checks passed."
