<#
.SYNOPSIS
    Remediates STIG ID: WN10-AU-000505 The Security Event Log Size Must Be Configured to 1024000 KB or Greater.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-AU-000505/powershell-fix.ps1
    Date Created    : 2025-05-28
    Last Modified   : 2025-05-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000505.ps1 
#>

# Set variables
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"
$regName = "MaxSize"
$desiredValue = 1024000  # 1 GB in KB

# Create the path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

# Confirm the setting
$currentValue = Get-ItemProperty -Path $regPath -Name $regName | Select-Object -ExpandProperty $regName

if ($currentValue -ge $desiredValue) {
    Write-Host "✅ Security event log size is set to $currentValue KB (>= 1024000 KB)." -ForegroundColor Green
} else {
    Write-Host "❌ Security event log size is too small: $currentValue KB. STIG NOT compliant." -ForegroundColor Red
}
