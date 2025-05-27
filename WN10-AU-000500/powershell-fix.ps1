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
