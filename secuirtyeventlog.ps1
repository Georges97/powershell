$date = (get-date).AddDays(-30)

Get-eventlog  -log Security -After $date | Export-Csv -Path C:\eventlog.csv