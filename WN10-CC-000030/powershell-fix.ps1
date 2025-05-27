<#
.SYNOPSIS
    This PowerShell script remediates STIG ID: WN10-CC-000030 by disabling ICMP redirects that can override OSPF routes.
    

.NOTES
    Author          : Yancarlos Espinosa
    LinkedIn        : https://www.linkedin.com/in/yancarlos-espinosa/
    GitHub          : https://github.com/yeg003/STIG-remediation-scripts/edit/main/WN10-AU-000500/powershell-fix.ps1
    Date Created    : 2025-05-26
    Last Modified   : 2025-05-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000030.ps1 
#>

# Define path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$regName = "EnableICMPRedirect"
$expectedValue = 0

# Create the key if it doesn't exist (should already exist on most systems)
if (-not (Test-Path $regPath)) {
    Write-Host "Registry path not found: $regPath" -ForegroundColor Red
    exit
}

# Set the value
Set-ItemProperty -Path $regPath -Name $regName -Value $expectedValue -Type DWord

# Verify the result
$currentValue = Get-ItemProperty -Path $regPath -Name $regName | Select-Object -ExpandProperty $regName

if ($currentValue -eq $expectedValue) {
    Write-Host "✅ STIG WN10-CC-000030 successfully applied. EnableICMPRedirect is set to $currentValue." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to apply STIG. Current value: $currentValue" -ForegroundColor Red
}
