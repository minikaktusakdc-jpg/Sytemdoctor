Clear-Host

Write-Host "===== QUICK INFO ====="
Write-Host ""

Get-CimInstance Win32_Processor |
Select-Object Name

Get-CimInstance Win32_BaseBoard |
Select-Object Manufacturer,Product

Get-CimInstance Win32_BIOS |
Select-Object SMBIOSBIOSVersion

Write-Host ""
Read-Host "Press Enter"