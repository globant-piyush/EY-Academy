#Find empty security groups in AD and delete them.

# Get empty Active Directory Groups 
$Groups = Get-ADGroup -Filter * -Properties Members –server vm1 | Where-Object {-not $_.members} | Select-Object Name, GroupCategory, DistinguishedName

# Export results to CSV
$Groups | Export-Csv D:\Devops\EY-Academy\Assignment THREE\NotActiveGroups.csv -NoTypeInformation

# Delete Inactive Groups
ForEach ($Item in $Groups){
  Remove-ADGroup -Identity $Item.DistinguishedName -Confirm:$false
  Write-Output "$($Item.Name) - Deleted"
}