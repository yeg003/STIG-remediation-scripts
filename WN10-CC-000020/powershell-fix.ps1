<#
.SYNOPSIS
    Remediates STIG ID: WN10-CC-000020 by configuring IPv6 source routing to highest protection.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-CC-000020/powershell-fix.ps1
    Date Created    : 2025-05-28
    Last Modified   : 2025-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000020.ps1
#>

# Registry config
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
$regName = "DisableIpSourceRouting"
$desiredValue = 2

# Create path if needed
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Apply setting
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

# Verify change
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName
if ($currentValue -eq $desiredValue) {
    Write-Host "✅ IPv6 source routing protection set to highest (value: $currentValue)." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to apply IPv6 source routing setting. Current value: $currentValue." -ForegroundColor Red
}
