# 🟦 INSTALLATION SCRIPT
# FILE: scripts/dev_env_install.ps1
# PURPOSE: Install developer environment via WinGet
# MODE: Clean reproducible environment

Write-Host "====================================="
Write-Host "AI DEV ENVIRONMENT INSTALL START"
Write-Host "====================================="

# ----------------------------------------------------
# INSTALL REQUIRED TOOLS
# ----------------------------------------------------

$apps = @(
"Git.Git",
"Docker.DockerDesktop",
"Canonical.Ubuntu",
"OpenJS.NodeJS.LTS",
"Python.Python.3.11",
"GoLang.Go",
"Rustlang.Rustup",
"Hashicorp.Terraform",
"Kubernetes.kubectl"
)

foreach ($app in $apps) {

    Write-Host "Installing $app"

    winget install `
        --id $app `
        -e `
        --source winget `
        --accept-package-agreements `
        --accept-source-agreements
}

# ----------------------------------------------------
# ENABLE WSL
# ----------------------------------------------------

Enable-WindowsOptionalFeature `
-Online `
-FeatureName Microsoft-Windows-Subsystem-Linux `
-All `
-NoRestart

Enable-WindowsOptionalFeature `
-Online `
-FeatureName VirtualMachinePlatform `
-All `
-NoRestart

wsl --set-default-version 2

# ----------------------------------------------------
# VERIFY INSTALLATIONS
# ----------------------------------------------------

Write-Host "====================================="
Write-Host "VERIFYING TOOLS"
Write-Host "====================================="

git --version
docker --version
node -v
python --version
go version
rustc --version
cargo --version
terraform version
kubectl version --client
wsl --status

Write-Host "====================================="
Write-Host "ENVIRONMENT READY"
Write-Host "====================================="