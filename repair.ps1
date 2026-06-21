Clear-Host

Write-Host "SYSTEMDOCTOR REPAIR" -ForegroundColor Cyan
Write-Host ""

Write-Host "1 - SFC Scan"
Write-Host "2 - DISM Repair"
Write-Host ""

$choice = Read-Host "Select"

if ($choice -eq "1") {

    Write-Host "Starting SFC..." -ForegroundColor Yellow

    Start-Process -FilePath "cmd.exe" `
        -ArgumentList "/c sfc /scannow" `
        -Verb RunAs

}
elseif ($choice -eq "2") {

    Write-Host "Starting DISM..." -ForegroundColor Yellow

    Start-Process -FilePath "cmd.exe" `
        -ArgumentList "/c DISM /Online /Cleanup-Image /RestoreHealth" `
        -Verb RunAs

}
else {
    Write-Host "Invalid option"
}

Read-Host "Press Enter"