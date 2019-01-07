#List of Active & Inactive user list from Azure AD.

$DaysInactive = 30
$InactiveDate = (Get-Date).Adddays(-($DaysInactive))

# Get all Users that have not logged on in specific number of days
$Users = Get-ADUser -Filter { LastLogonDate -lt $InactiveDate -and Enabled -eq $true } -Properties LastLogonDate | Select-Object @{ Name="Username"; Expression={$_.SamAccountName} }, Name, LastLogonDate, DistinguishedName

# Export results to CSV
$Users | Export-Csv D:\Devops\EY-Academy\Assignment THREE\NotActiveUsers.csv -NoTypeInformation