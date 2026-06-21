Clear-Host

Write-Host "================================="
Write-Host "      SYSTEMDOCTOR SCAN"
Write-Host "================================="
Write-Host ""

$cpu = Get-CimInstance Win32_Processor
$ram = Get-CimInstance Win32_ComputerSystem
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$os = Get-CimInstance Win32_OperatingSystem
$board = Get-CimInstance Win32_BaseBoard
$bios = Get-CimInstance Win32_BIOS

$ramGB = [math]::Round($ram.TotalPhysicalMemory/1GB,1)
$freeGB = [math]::Round($disk.FreeSpace/1GB,1)

$score = 100

if($ramGB -lt 8){ $score -= 15 }
if($freeGB -lt 20){ $score -= 10 }

Write-Host "CPU:"
Write-Host $cpu.Name
Write-Host ""

Write-Host "Cores:" $cpu.NumberOfCores
Write-Host "Threads:" $cpu.NumberOfLogicalProcessors
Write-Host ""

Write-Host "RAM:" $ramGB "GB"
Write-Host "Disk Free:" $freeGB "GB"
Write-Host ""

Write-Host "Motherboard:"
Write-Host $board.Manufacturer $board.Product
Write-Host ""

Write-Host "BIOS:"
Write-Host $bios.SMBIOSBIOSVersion
Write-Host ""

Write-Host "Windows:"
Write-Host $os.Caption
Write-Host ""

Write-Host "Health Score:" $score "/100"
Write-Host ""

Read-Host "Press Enter"