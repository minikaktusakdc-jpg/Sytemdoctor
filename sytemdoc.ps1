Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

$form = New-Object System.Windows.Forms.Form
$form.Text = "SystemDoctor"
$form.Size = New-Object System.Drawing.Size(500,380)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(30,30,30)
$form.ForeColor = [System.Drawing.Color]::White
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

$title = New-Object System.Windows.Forms.Label
$title.Text = "SystemDoctor"
$title.Font = New-Object System.Drawing.Font("Segoe UI",18,[System.Drawing.FontStyle]::Bold)
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(150,20)
$title.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($title)

$info = New-Object System.Windows.Forms.Label
$info.Text = "PC Diagnostics and Repair"
$info.AutoSize = $true
$info.Location = New-Object System.Drawing.Point(150,60)
$info.ForeColor = [System.Drawing.Color]::LightGray
$form.Controls.Add($info)

function New-SDButton {
    param(
        [string]$Text,
        [int]$X,
        [int]$Y
    )

    $btn = New-Object System.Windows.Forms.Button
    $btn.Text = $Text
    $btn.Size = New-Object System.Drawing.Size(180,40)
    $btn.Location = New-Object System.Drawing.Point($X,$Y)
    $btn.BackColor = [System.Drawing.Color]::FromArgb(50,50,50)
    $btn.ForeColor = [System.Drawing.Color]::White
    return $btn
}

$btnScan = New-SDButton "Smart Scan" 150 110
$btnInfo = New-SDButton "Quick Info" 150 160
$btnRepair = New-SDButton "Repair System" 150 210
$btnExit = New-SDButton "Exit" 150 260

$form.Controls.Add($btnScan)
$form.Controls.Add($btnInfo)
$form.Controls.Add($btnRepair)
$form.Controls.Add($btnExit)

$btnScan.Add_Click({
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -NoExit -File `"$ScriptDir\Scan.ps1`""
})

$btnInfo.Add_Click({
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -NoExit -File `"$ScriptDir\QuickInfo.ps1`""
})

$btnRepair.Add_Click({
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -NoExit -File `"$ScriptDir\Repair.ps1`""
})

$btnExit.Add_Click({
    $form.Close()
})

[void]$form.ShowDialog()