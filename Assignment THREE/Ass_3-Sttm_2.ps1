#Collect below information of 2 VMs on Azure- Name,IPV4Address,CanonicalName,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion,LastLogonDate and PasswordLastSet

Get-ADComputer -Server 'vmserver1' -Identity "vmserver1" -Properties Name,IPV4Address,CanonicalName,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion,LastLogonDate,PasswordLastSet