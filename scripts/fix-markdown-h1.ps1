param(
    [string]$Path = ".",
    [switch]$Recurse = $true
)

function Get-DefaultTitle {
    param(
        [string]$FileName
    )

    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($FileName)
    $words = ($baseName -replace '[_\-]+', ' ' -split '\s+') | Where-Object { $_ }
    $textInfo = [System.Globalization.CultureInfo]::CurrentCulture.TextInfo

    return ($words | ForEach-Object {
        if ($_.Length -eq 0) {
            return $_
        }

        $textInfo.ToTitleCase($_.ToLowerInvariant())
    }) -join ' '
}

$repoRoot = $null

try {
    $repoRoot = (git rev-parse --show-toplevel 2>$null).Trim()
}
catch {
    $repoRoot = $null
}

if (-not $repoRoot) {
    $repoRoot = Split-Path -Parent $PSScriptRoot
}

$targetPath = $Path

if (-not [System.IO.Path]::IsPathRooted($Path)) {
    if (Test-Path -LiteralPath $Path) {
        $targetPath = $Path
    }
    else {
        $targetPath = Join-Path $repoRoot $Path
    }
}

$resolvedPath = Resolve-Path -LiteralPath $targetPath -ErrorAction Stop
$resolvedItem = Get-Item -LiteralPath $resolvedPath

if ($resolvedItem.PSIsContainer) {
    $searchOptions = @{
        LiteralPath = $resolvedPath
        Filter      = "*.md"
        File        = $true
    }

    if ($Recurse) {
        $searchOptions.Recurse = $true
    }

    $files = Get-ChildItem @searchOptions
}
else {
    $files = @($resolvedItem)
}

foreach ($file in $files) {
    $lines = Get-Content -LiteralPath $file.FullName
    $updatedLines = New-Object System.Collections.Generic.List[string]
    $insideFence = $false
    $seenTopLevelHeading = $false
    $changed = $false
    $firstContentIndex = -1

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if (-not [string]::IsNullOrWhiteSpace($lines[$i])) {
            $firstContentIndex = $i
            break
        }
    }

    if ($firstContentIndex -eq -1 -or $lines[$firstContentIndex] -notmatch '^# .+$') {
        $updatedLines.Add("# $(Get-DefaultTitle -FileName $file.Name)")
        $updatedLines.Add("")
        $changed = $true
        $seenTopLevelHeading = $true
    }

    foreach ($line in $lines) {
        if ($line -match '^\s*(```|~~~)') {
            $insideFence = -not $insideFence
            $updatedLines.Add($line)
            continue
        }

        if (-not $insideFence -and $line -match '^# (.+)$') {
            if ($seenTopLevelHeading) {
                $updatedLines.Add("## $($Matches[1])")
                $changed = $true
                continue
            }

            $seenTopLevelHeading = $true
        }

        $updatedLines.Add($line)
    }

    if ($changed) {
        Set-Content -LiteralPath $file.FullName -Value $updatedLines
        Write-Output "Updated $($file.FullName)"
    }
}
