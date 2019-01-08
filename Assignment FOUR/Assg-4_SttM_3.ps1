#List of all VM in Azure and send email.


Get-AzVM | Export-Csv -Path ".\ListAzureVMs.csv"

$From = "piyushjes@gmail.com"
$To = "To@hotmail.com"
$Cc = "cc@hotmail.com"
$Attachment = ".\ListAzureVMs.csv"
$Subject = "Please find the list of VMs"
$Body = "Please, find the list of all the Azure VMs in the following attachment."
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) -Attachments $Attachment –DeliveryNotificationOption OnSuccess