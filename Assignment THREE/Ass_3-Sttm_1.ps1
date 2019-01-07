#Write a powershell script to monitor availability of a website. This might need an installation of IIS server in a VM on Azure.

function Display-Message ($title, $msg) {     
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null 
    [Windows.Forms.MessageBox]::Show($msg, $title, [Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::DefaultDesktopOnly) | Out-Null     
} 

[string] $url = "http://23.99.178.34/"

[net.httpWebRequest] $req = [net.webRequest]::create($url)
$req.Method = "HEAD"

[net.httpWebResponse] $res = $req.getResponse()

if ($res.StatusCode -ge "200") {
  write-host "`nSite up`n" `
    -foregroundcolor green
}
else {
  Display-Message -title "Warning!" -msg "Site down!!!"
  write-host "`nSite down`n" `
    -foregroundcolor red
}

