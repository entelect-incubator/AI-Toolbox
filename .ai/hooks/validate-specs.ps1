$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$specDir = Join-Path $root ".ai\specs\features"

if (-not (Test-Path $specDir)) {
    Write-Error "Spec directory not found: $specDir"
}

$specs = Get-ChildItem -Path $specDir -Filter *.md -File -Recurse
if ($specs.Count -eq 0) {
    Write-Error "No feature specs found in .ai/specs/features"
}

$requiredHeaders = @(
    "## Context",
    "## Inputs",
    "## Outputs",
    "## Rules",
    "## Acceptance Criteria"
)

foreach ($spec in $specs) {
    $content = Get-Content -Path $spec.FullName -Raw
    foreach ($header in $requiredHeaders) {
        if ($content -notmatch [regex]::Escape($header)) {
            Write-Error "Missing header '$header' in $($spec.FullName)"
        }
    }
}

Write-Host "Spec validation passed ($($specs.Count) file(s))."
