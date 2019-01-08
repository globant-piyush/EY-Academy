#Stop all VMs in a resource group of a subscription

$VMListFile = ".\AzureVMslist.txt" 
$ReportFile = ".\VMStopReport.csv" 

Foreach ($obj in Get-Content "$VMListFile") 
{ 

$Error.Clear() 
Stop-AzVM -ResourceGroupName "myResourceGrp" -Name "$obj" 
if ($Error.Count -ne 0) 
{ 
$STR = "Stopped Azure Virtual Machine: " + $obj 
Add-Content $ReportFile $STR 
} 
else 
{ 
$STR = "ERROR: Failed to stop Azure Virtual Machine : " + $obj+","+$Error[0] 
Add-Content $ReportFile $STR 
} 
}