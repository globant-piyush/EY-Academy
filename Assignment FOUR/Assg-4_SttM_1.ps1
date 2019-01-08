

#Powershell script to rest VM's admin password.

$SubID = "00fc6d8c-f624-42a9-b509-c0559c5590ac" 

$Location = "Central India" 

Connect-AzAccount 
Select-AzSubscription -Subscription $SubID
Set-AzVMAccessExtension -ResourceGroupName myResourceGrp -Location $Location -VMName vm1 -Credential (get-credential) -TypeHandlerVersion "2.0" -Name VMAccessAgent
