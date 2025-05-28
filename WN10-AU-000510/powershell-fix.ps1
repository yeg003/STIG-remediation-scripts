<#
.SYNOPSIS
    Remediates STIG ID: WN10-AU-000510 by configuring the System event log maximum size to 32768 KB.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-AU-000510/powershell-fix.ps1
    Date Created    : 2025-05-28
    Last Modified   : 2025-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000510

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000510.ps1 
#>

# Define registry path and desired value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"
$regName = "MaxSize"
$desiredValue = 32768  # 32 MB in KB

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

# Confirm the change
$currentValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName
if ($currentValue -ge $desiredValue) {
    Write-Host "✅ System event log size set to $currentValue KB (>= 32768 KB)." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to apply the log size policy. Current value: $currentValue KB." -ForegroundColor Red
}
