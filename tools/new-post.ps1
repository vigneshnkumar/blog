# Creates a new draft article from _templates/post.md.
#
# Usage (from the repo root):
#   .\tools\new-post.ps1 "Understanding Jenkins Pipelines"
#
# Result: _drafts/understanding-jenkins-pipelines.md with the title and today's date filled in.

param(
    [Parameter(Mandatory = $true)]
    [string]$Title
)

$root = Split-Path -Parent $PSScriptRoot
$slug = ($Title.ToLower() -replace '[^a-z0-9]+', '-').Trim('-')
$target = Join-Path $root "_drafts\$slug.md"

if (Test-Path $target) {
    Write-Error "Draft already exists: $target"
    exit 1
}

$now = Get-Date
$offset = $now.ToString('zzz') -replace ':', ''
$date = $now.ToString('yyyy-MM-dd HH:mm:ss') + " $offset"
$safeTitle = $Title -replace '"', '\"'

$content = Get-Content (Join-Path $root '_templates\post.md') -Raw
$content = $content -replace '(?m)^# Copy this file.*\r?\n# When it.*\r?\n', ''
$content = $content -replace '(?m)^title: .*$', "title: `"$safeTitle`""
$content = $content -replace '(?m)^date: [^#\r\n]*', "date: $date     "

New-Item -ItemType Directory -Force (Join-Path $root '_drafts') | Out-Null
[System.IO.File]::WriteAllText($target, $content, (New-Object System.Text.UTF8Encoding $false))

Write-Host "Created $target"
Write-Host "Open it with:  code `"$target`""
