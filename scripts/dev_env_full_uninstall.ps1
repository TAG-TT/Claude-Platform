# 🟥 SYSTEM CLEANUP SCRIPT
# FILE: scripts/dev_env_full_uninstall.ps1
# PURPOSE: Remove all development tools + leftovers completely
# MODE: Deep system cleanup
# WARNING: Run as Administrator

Write-Host "====================================="
Write-Host "FULL DEV ENVIRONMENT CLEANUP START"
Write-Host "====================================="

# ----------------------------------------------------
# STOP RELATED SERVICES
# ----------------------------------------------------

Write-Host "Stopping services..."

$services = @(
"com.docker.service",
"docker",
"kubectl"
)

foreach ($s in $services) {
    Stop-Service $s -ErrorAction SilentlyContinue
}

# ----------------------------------------------------
# REMOVE WSL DISTROS
# ----------------------------------------------------

Write-Host "Removing WSL distros..."

wsl --shutdown

$distros = wsl -l -q
foreach ($d in $distros) {
    wsl --unregister $d
}

Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# ----------------------------------------------------
# UNINSTALL VIA WINGET
# ----------------------------------------------------

Write-Host "Uninstalling applications via WinGet..."

$apps = @(
"Git.Git",
"Docker.DockerDesktop",
"OpenJS.NodeJS",
"Python.Python.3.11",
"Python.Python.3.12",
"GoLang.Go",
"Rustlang.Rustup",
"Hashicorp.Terraform",
"Kubernetes.kubectl"
)

foreach ($app in $apps) {
    winget uninstall --id $app -e --silent
}

# ----------------------------------------------------
# REMOVE LEFTOVER DIRECTORIES
# ----------------------------------------------------

Write-Host "Cleaning folders..."

$paths = @(
"C:\Program Files\Git",
"C:\Program Files\Docker",
"C:\Program Files\nodejs",
"C:\Program Files\Go",
"C:\Program Files\Terraform",
"C:\Program Files\Rust",
"$env:USERPROFILE\.cargo",
"$env:USERPROFILE\.rustup",
"$env:USERPROFILE\.kube",
"$env:USERPROFILE\.docker",
"$env:LOCALAPPDATA\Docker",
"$env:LOCALAPPDATA\Programs\Python",
"$env:LOCALAPPDATA\Programs\Git",
"$env:LOCALAPPDATA\Programs\nodejs"
)

foreach ($p in $paths) {
    Remove-Item $p -Recurse -Force -ErrorAction SilentlyContinue
}

# ----------------------------------------------------
# CLEAN REGISTRY
# ----------------------------------------------------

Write-Host "Cleaning registry entries..."

$regPaths = @(
"HKCU:\Software\Docker Desktop",
"HKCU:\Software\Git",
"HKCU:\Software\Python",
"HKCU:\Software\Node.js",
"HKCU:\Software\Rust",
"HKCU:\Software\Go",
"HKCU:\Software\Terraform"
)

foreach ($r in $regPaths) {
    Remove-Item $r -Recurse -Force -ErrorAction SilentlyContinue
}

# ----------------------------------------------------
# CLEAN ENVIRONMENT PATH
# ----------------------------------------------------

Write-Host "Cleaning PATH..."

$machinePath = [Environment]::GetEnvironmentVariable("Path","Machine")

$patterns = @(
"Git",
"Docker",
"nodejs",
"Python",
"Go",
"Rust",
"kubectl",
"Terraform"
)

foreach ($pattern in $patterns) {
    $machinePath = ($machinePath -split ";") | Where-Object {$_ -notmatch $pattern}
}

$newPath = ($machinePath -join ";")
[Environment]::SetEnvironmentVariable("Path",$newPath,"Machine")

Write-Host "Cleanup complete."

Write-Host "RESTART YOUR COMPUTER BEFORE INSTALLATION."