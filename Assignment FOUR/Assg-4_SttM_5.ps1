#Take a snapshot of a VM.

$vmName = 'vm1' 
$resourceGroup = 'myResourceGrp'
 
$vm = Get-AzVM -ResourceGroup $resourceGroup -Name $vmName

$diskName = $vm.StorageProfile.OSDisk.Name
$oldOsdisk = Get-AzDisk -ResourceGroupName $resourceGroup -DiskName $diskname
$snapConfig = New-AzSnapshotConfig -SourceUri $oldOsdisk.Id -CreateOption Copy -Location $vm.Location 

# Create the Azure virtual machine snapshot
$snapshot = New-AzSnapshot -Snapshot $snapConfig -SnapshotName $vm.Name -ResourceGroupName $resourceGroup
$snapshot