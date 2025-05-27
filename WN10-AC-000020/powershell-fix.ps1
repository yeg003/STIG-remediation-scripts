<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/edit/main/WN10-AU-000500/powershell-fix.ps1
    Date Created    : 2025-05-27
    Last Modified   : 2025-05-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AC-000020.ps1 
#>

Write-Host "Enforcing password history of 24 passwords..." -ForegroundColor Cyan
net accounts /uniquepw:24

# Confirm setting (uses export method for viewing effective policy)
secedit /export /cfg "$env:TEMP\pwdpolicy.cfg" | Out-Null
Get-Content "$env:TEMP\pwdpolicy.cfg" | Where-Object { $_ -match "PasswordHistorySize" }
Remove-Item "$env:TEMP\pwdpolicy.cfg" -Force
