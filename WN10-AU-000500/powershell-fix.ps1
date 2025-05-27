<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/edit/main/WN10-AU-000500/powershell-fix.ps1
    Date Created    : 2025-05-26
    Last Modified   : 2025-05-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# Set variables
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$regName = "MaxSize"
$minSizeKB = 32768

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Check current value
$currentValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $regName -ErrorAction SilentlyContinue

# Set or update the value
if ($null -eq $currentValue -or $currentValue -lt $minSizeKB) {
    Write-Host "Setting $regName to $minSizeKB KB..."
    Set-ItemProperty -Path $regPath -Name $regName -Value $minSizeKB -Type DWord
} else {
    Write-Host "$regName is already set to a compliant value ($currentValue KB)."
}

# Verify the setting
$verified = Get-ItemProperty -Path $regPath -Name $regName | Select-Object -ExpandProperty $regName
Write-Host "`nVerification: MaxSize is set to $verified KB"
 
