$sounds = Get-ChildItem "C:\Windows\Media" -Filter *.wav

while ($true) {
    $sound = Get-Random -InputObject $sounds
    (New-Object Media.SoundPlayer $sound.FullName).PlaySync() 
    Start-Sleep -Milliseconds 100
}
