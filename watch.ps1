while ($true) {
    $code = 0
    try {
        $code = (Invoke-WebRequest "https://hypnotize-gave-wiry.ngrok-free.dev/health" -Headers @{"ngrok-skip-browser-warning"="1"} -UseBasicParsing -TimeoutSec 10).StatusCode
    } catch { $code = 0 }
    if ($code -ne 200) {
        Write-Host "$(Get-Date -Format HH:mm:ss) нет ответа, перезапускаю туннель и бота"
        docker compose -f docker-compose.dev.yml restart tunnel bot
        Start-Sleep 60
    } else {
        Write-Host "$(Get-Date -Format HH:mm:ss) всё работает"
    }
    Start-Sleep 60
}