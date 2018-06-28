Write-Output "Hello World"

$username = Get-AutomationVariable -Name 'username'

$username = 'paul'

Set-AutomationVariable -Name 'username' -Value $username