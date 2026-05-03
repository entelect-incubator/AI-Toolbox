$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..")

function Assert-FileExists {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        throw "Missing required file: $Path"
    }
}

function Assert-Contains {
    param(
        [string]$Path,
        [string]$Needle,
        [string]$Message
    )
    $content = Get-Content -Path $Path -Raw
    if ($content -notmatch [regex]::Escape($Needle)) {
        throw "$Message ($Path)"
    }
}

$requiredFiles = @(
    "README.md",
    "instruction.md",
    ".github\pull_request_template.md",
    ".ai\guides\AI-INSTRUCTIONS.md",
    ".ai\guides\AI-WORKFLOWS.md",
    ".ai\guides\SECURITY-OWASP-TOP10.md",
    ".ai\guides\QUALITY-AUDIT.md",
    ".ai\agents\dev-agent.md"
)

foreach ($relative in $requiredFiles) {
    Assert-FileExists (Join-Path $root $relative)
}

$guideDir = Join-Path $root ".ai\guides"
$guides = Get-ChildItem -Path $guideDir -Filter *.md -File
if ($guides.Count -eq 0) {
    throw "No guide files found in .ai/guides"
}

foreach ($guide in $guides) {
    Assert-Contains -Path $guide.FullName -Needle "## Practical Examples" -Message "Guide missing practical examples section"
}

$forbidden = "chatgpt.com/share"
$allMarkdown = Get-ChildItem -Path $root -Recurse -Include *.md -File
foreach ($md in $allMarkdown) {
    $content = Get-Content -Path $md.FullName -Raw
    if ($content -match [regex]::Escape($forbidden)) {
        throw "Forbidden shared-chat link found in $($md.FullName)"
    }
}

$featureDir = Join-Path $root ".ai\specs\features"
if (Test-Path $featureDir) {
    $featureSpecs = Get-ChildItem -Path $featureDir -Filter *.md -File -Recurse
    if ($featureSpecs.Count -gt 0) {
        & (Join-Path $root ".ai\hooks\validate-specs.ps1")
    }
    else {
        Write-Host "No feature specs found in .ai/specs/features. Skipping spec validation."
    }
}
else {
    Write-Host "Spec feature directory not present yet. Skipping spec validation."
}

Write-Host "CI validation passed."
