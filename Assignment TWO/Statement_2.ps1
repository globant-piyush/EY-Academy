$CPUInfo =Get-WmiObject Win32_Processor -ComputerName $env:computername #Get CPU Information

$OSInfo =Get-WmiObject Win32_OperatingSystem -ComputerName $env:computername #Get OS Information 
#Get Memory Information. The data will be shown in a table as MB, rounded to the nearest second decimal

$OSTotalVirtualMemory = [math]::round($OSInfo.TotalVirtualMemorySize / 1MB, 2) 
$OSTotalVisibleMemory = [math]::round(($OSInfo.TotalVisibleMemorySize  / 1MB), 2) 
$PhysicalMemory = Get-WmiObject CIM_PhysicalMemory -ComputerName $env:computername | Measure-Object -Property capacity -sum | % {[math]::round(($_.sum / 1GB),2)} 

$infoObject = New-Object PSObject 
#The following add data to the infoObjects. 

Add-Member -inputObject $infoObject -memberType NoteProperty -name "ServerName" -value $CPUInfo.SystemName 
Add-Member -inputObject $infoObject -memberType NoteProperty -name "CPU_Name" -value $CPUInfo.Name 
Add-Member -inputObject $infoObject -memberType NoteProperty -name "CPU_Description" -value $CPUInfo.Description

echo $infoObject | Export-Csv "CPU_OS_Memory_info.csv"