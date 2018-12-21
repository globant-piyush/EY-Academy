#Checking RDP on VM is enabled or not
#MS docs provides great article over it
#After each troubleshooting step, try connecting to your VM again.
#Go to that VM--> Settings---> Networking ---> Inbound port rules

#Testing rdp port for local
Test-NetConnection -ComputerName $env:COMPUTERNAME -Port 3389
#Testing rdp to google
Test-NetConnection -ComputerName google.com -Port 3389 -InformationLevel Detailed
#This test RDP connection directly 
Test-NetConnection -CommonTCPPort RDP
#This remove detail diagnose for route
Test-NetConnection -ComputerName "www.contoso.com" -ConstrainInterface 5 -DiagnoseRouting -InformationLevel "Detailed" 