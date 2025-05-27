<#
.SYNOPSIS
    Remediates STIG ID: WN10-AC-000005 by configuring the account lockout duration to 15 minutes.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-AC-000005/powershell-fix.ps1
    Date Created    : 2025-05-27
    Last Modified   : 2025-05-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AC-000005.ps1 
#>

Write-Host "Setting account lockout duration to 15 minutes..." -ForegroundColor Cyan
net accounts /lockoutduration:15

# Confirm setting
secedit /export /cfg "$env:TEMP\\lockoutpolicy.cfg" | Out-Null
Get-Content "$env:TEMP\\lockoutpolicy.cfg" | Where-Object { $_ -match "LockoutDuration" }
Remove-Item "$env:TEMP\\lockoutpolicy.cfg" -Force
