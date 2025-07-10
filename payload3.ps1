Add-Type -AssemblyName System.Windows.Forms
while ($true) {
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(1, 1)
    Start-Sleep -Milliseconds 0
}
