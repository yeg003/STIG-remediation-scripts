<#
.SYNOPSIS
    Remediates STIG ID: WN10-CC-000025 by configuring IPv4 source routing protection to the highest level.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-CC-000025/powershell-fix.ps1
    Date Created    : 2025-05-28
    Last Modified   : 2025-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    PS C:\> .\WN10-CC-000025.ps1
#>

$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "DisableIPSourceRouting"
$desiredValue = 2

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Apply the configuration
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

# Confirm the update
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName
if ($currentValue -eq $desiredValue) {
    Write-Host "✅ IP source routing protection (IPv4) set to highest (value: $currentValue)." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to apply source routing setting. Current value: $currentValue." -ForegroundColor Red
}
