(Get-Content RESandbox.wsb.template).replace('__SANDBOX__', $PSScriptRoot) | Set-Content .\RESandbox.wsb
