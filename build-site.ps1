#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Builds docs/index.html from the .ai/ folder markdown files.
  Run from the repo root:  pwsh build-site.ps1
#>

$ErrorActionPreference = 'Stop'

$repoRoot  = $PSScriptRoot
$docsDir   = Join-Path $repoRoot 'docs'
$assetsDir = Join-Path $docsDir  'assets'
$repoUrl   = 'https://github.com/entelect-incubator/AI-Toolbox' # update if needed

if (-not (Test-Path $docsDir))   { New-Item -ItemType Directory -Path $docsDir   | Out-Null }
if (-not (Test-Path $assetsDir)) { New-Item -ItemType Directory -Path $assetsDir | Out-Null }

# ── Helpers ──────────────────────────────────────────────────────────────────

function Get-MarkdownMeta ([string]$path) {
  $lines = Get-Content $path -Encoding utf8 -ErrorAction SilentlyContinue
  if (-not $lines) { return @{ Title = [System.IO.Path]::GetFileNameWithoutExtension($path); Desc = '' } }

  # Strip YAML frontmatter
  $start = 0
  if ($lines[0] -eq '---') {
    $end = ($lines | Select-Object -Skip 1 | ForEach-Object { $_ } | 
            Where-Object { $_ -eq '---' } | Select-Object -First 1)
    $closeIdx = [array]::IndexOf($lines, '---', 1)
    if ($closeIdx -gt 0) { $start = $closeIdx + 1 }
  }
  $body = $lines[$start..($lines.Count - 1)]

  # First H1
  $title = ''
  foreach ($l in $body) {
    if ($l -match '^#\s+(.+)') { $title = $Matches[1].Trim(); break }
  }
  if (-not $title) { $title = [System.IO.Path]::GetFileNameWithoutExtension($path) -replace '-', ' ' }

  # First non-empty, non-heading paragraph
  $desc  = ''
  $inParagraph = $false
  foreach ($l in $body) {
    $trimmed = $l.Trim()
    if ($trimmed -match '^#+\s' -or $trimmed -match '^[-*]\s' -or $trimmed -match '^`') { continue }
    if ($trimmed.Length -eq 0) { if ($inParagraph) { break }; continue }
    $desc += ($trimmed -replace '\*\*|__|\*|_|`', '') + ' '
    $inParagraph = $true
    if ($desc.Length -gt 160) { break }
  }
  $desc = $desc.Trim()
  if ($desc.Length -gt 160) { $desc = $desc.Substring(0,160).TrimEnd() + '…' }

  return @{ Title = $title; Desc = $desc }
}

function Escape-Html ([string]$s) {
  $s -replace '&','&amp;' -replace '<','&lt;' -replace '>','&gt;' -replace '"','&quot;'
}

function Get-FileUrl ([string]$absPath) {
  $rel = $absPath.Replace($repoRoot, '').Replace('\','/').TrimStart('/')
  "$repoUrl/blob/main/$rel"
}

function Render-Card ([string]$absPath, [string]$categoryId) {
  $meta    = Get-MarkdownMeta $absPath
  $title   = Escape-Html $meta.Title
  $desc    = Escape-Html $meta.Desc
  $url     = Get-FileUrl $absPath
  $ext     = [System.IO.Path]::GetExtension($absPath).TrimStart('.')
  $fname   = [System.IO.Path]::GetFileName($absPath)
  $search  = Escape-Html ("$($meta.Title) $($meta.Desc) $fname $categoryId")
  @"
      <a class="card" href="$url" target="_blank" rel="noopener" data-search="$search">
        <span class="card-title">$title</span>
        <span class="card-desc">$desc</span>
        <span class="card-ext">$ext</span>
      </a>
"@
}

function Render-Section ([string]$id, [string]$title, [string]$desc, [string[]]$files) {
  $count = $files.Count
  $cards = $files | ForEach-Object { Render-Card $_ $id }
  $cardsHtml = $cards -join "`n"
  @"
    <section class="category" id="$id">
      <div class="category-header">
        <h2>$title</h2>
        <span class="category-count">$count</span>
      </div>
      <p class="category-desc">$desc</p>
      <div class="card-grid">
$cardsHtml
      </div>
    </section>
"@
}

# ── Gather sections ───────────────────────────────────────────────────────────

$sections = [ordered]@{
  guides    = @{
    title = 'Guides'
    desc  = 'How-to guides for BA, Dev, and QA roles covering quality baselines, workflows, security, prompting, and more.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/guides')    -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  agents    = @{
    title = 'Agents'
    desc  = 'Specialised AI agent instruction files. Drop these into your IDE or orchestration layer.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/agents')    -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  roles     = @{
    title = 'Role Playbooks'
    desc  = 'Mission, checklist, and handoff contract for BA, Dev, and QA roles in an AI-assisted delivery team.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/roles')     -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  hooks     = @{
    title = 'Hooks'
    desc  = 'Pre-commit, CI validation, and lint automation scripts for quality gates.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/hooks')     -Include '*.ps1','*.sh' -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  plugins   = @{
    title = 'Plugins and Prompts'
    desc  = 'Copilot prompt files and BEADS templates for repeatable AI interactions.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/plugins')   -Filter '*.md'  -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  examples  = @{
    title = 'Examples'
    desc  = 'End-to-end worked examples showing how a feature moves from spec to delivery.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/examples')  -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  templates = @{
    title = 'Spec Templates'
    desc  = 'Starter templates for feature specs and design system files.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/specs/templates') -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
  references = @{
    title = 'References'
    desc  = 'Design tokens, SDD articles, and external tooling references.'
    files = @(Get-ChildItem (Join-Path $repoRoot '.ai/references') -Filter '*.md' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName)
  }
}

# Total resource count for the hero chips
$totalCount = ($sections.Values | ForEach-Object { $_.files.Count } | Measure-Object -Sum).Sum
$totalChip = "<button class=`"chip filter-chip is-active`" type=`"button`" data-filter=`"all`" aria-pressed=`"true`">Total resources <strong>$totalCount</strong></button>"
$sectionChips = ($sections.GetEnumerator() | ForEach-Object {
  $c = $_.Value.files.Count
  "<button class=`"chip filter-chip`" type=`"button`" data-filter=`"$($_.Key)`" aria-pressed=`"false`">$($_.Value.title) <strong>$c</strong></button>"
}) -join "`n        "

# Navbar links
$navLinks = ($sections.GetEnumerator() | ForEach-Object {
  "<li><a href=`"#$($_.Key)`">$($_.Value.title)</a></li>"
}) -join "`n          "

# Section HTML
$sectionsHtml = ($sections.GetEnumerator() | ForEach-Object {
  Render-Section $_.Key $_.Value.title $_.Value.desc $_.Value.files
}) -join "`n"

# ── Build HTML ────────────────────────────────────────────────────────────────

$now = (Get-Date).ToString('yyyy-MM-dd')

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Entelect AI Toolbox — agents, guides, hooks, and prompts for AI-assisted delivery." />
  <title>Entelect AI Toolbox</title>
  <link rel="stylesheet" href="assets/style.css" />
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar" aria-label="Main navigation">
    <a class="navbar-brand" href="https://entelect-incubator.github.io/AI-Toolbox/" aria-label="AI Toolbox Home">
      <img
        class="navbar-logo"
        src="https://culture.entelect.co.za/wp-content/uploads/2025/04/logo_icon_white.png"
        alt="Entelect logo"
        width="28"
        height="28"
      />
      AI Toolbox
    </a>
    <ul class="navbar-links">
          $navLinks
    </ul>
    <a class="navbar-github" href="$repoUrl" target="_blank" rel="noopener">
      <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
        <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38
                 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13
                 -.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66
                 .07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15
                 -.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27
                 .68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12
                 .51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48
                 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"/>
      </svg>
      View on GitHub
    </a>
  </nav>

  <!-- Hero -->
  <header class="hero">
    <div class="hero-inner">
      <span class="hero-eyebrow">Entelect Delivery</span>
      <h1>AI Toolbox</h1>
      <p class="hero-sub">
        Agents, guides, hooks, and prompts for AI-assisted BA, Dev, and QA delivery.
        Community-maintained. Spec-driven.
      </p>

      <!-- Search -->
      <div class="search-wrap">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
             stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
        <input id="search" type="search" placeholder="Search all resources… (Ctrl+K)" autocomplete="off" />
      </div>

      <!-- Stats chips -->
      <div class="hero-stats">
        $totalChip
        $sectionChips
      </div>
    </div>
  </header>

  <!-- Resource sections -->
  <main class="main" id="main">
$sectionsHtml
    <p class="search-empty" role="status">No resources match your search.</p>
  </main>

  <!-- Footer -->
  <footer class="footer">
    <p>Built with the <a href="$repoUrl" target="_blank" rel="noopener">Entelect AI Toolbox</a>
       &nbsp;·&nbsp; Last generated: $now
       &nbsp;·&nbsp; Styled with <a href=".ai/references/entelect.co.za-design.md" target="_blank">Entelect Dark Orbit</a>
    </p>
  </footer>

  <script src="assets/main.js"></script>
</body>
</html>
"@

$outPath = Join-Path $docsDir 'index.html'
$html | Set-Content $outPath -Encoding utf8
$sectionCount = $sections.Count
Write-Host "Generated: $outPath - $totalCount resources across $sectionCount sections"
