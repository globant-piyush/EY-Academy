#Write powershell script to disable firewall of all VMs in a resource group.

# 1. Turning Off Firewall Using PowerShell

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# 2.Disabling the Windows Firewall on an virtual machine from the portal

#1) Open up a Blank Notepad and paste the following into it:
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy
\DomainProfile' -name "EnableFirewall" -Value 0

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\
PublicProfile' -name "EnableFirewall" -Value 0

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\
Standardprofile' -name "EnableFirewall" -Value 0

#2) Save the file as disablefirewall.ps1
#3) Navigate to the Azure Portal
#4) Select the impacted VM
#5) Select extensions
#6) Select Add
#7) Select Custom Script Extension
#8) Select Create
#9) Select the disablefirewall.ps1 created in the previous steps
#10) Install the .ps1 file. No arguments are needed.
#11) Go back to the extensions tab and wait for the Custom Script to report as successful
#12) Attempt to RDP to the machine. If it fails, restart the VM and attempt to RDP to it again.