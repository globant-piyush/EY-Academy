
Get-Process | Sort-Object CPU -desc | Select-Object -first 10 | Export-Csv "10Processes.csv"