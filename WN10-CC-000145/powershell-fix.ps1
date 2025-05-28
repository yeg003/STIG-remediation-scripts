<#
.SYNOPSIS
    Remediates STIG ID: WN10-CC-000185 by configuring the default AutoRun behavior to prevent autorun commands.

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/blob/main/WN10-CC-000185%20/powershell-fix.ps1
    Date Created    : 2025-05-27
    Last Modified   : 2025-05-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000145.ps1 
#>

# Set variables
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$regName = "DCSettingIndex"
$desiredValue = 1

# Ensure the path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

# Verify
$currentValue = Get-ItemProperty -Path $regPath -Name $regName | Select-Object -ExpandProperty $regName
if ($currentValue -eq $desiredValue) {
    Write-Host "✅ Password prompt on resume (on battery) is enabled." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to enforce password prompt policy." -ForegroundColor Red
}
