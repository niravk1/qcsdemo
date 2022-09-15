winrm quickconfig -force;
Set-NetConnectionProfile -Name "Network" -NetworkCategory Private;
netsh advfirewall firewall add rule name=WinRM-HTTP dir=in localport=5985 protocol=TCP action=allow;
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
$sharepath = "C:\Users\azureuser\AppData\Local\Temp"
$Acl = Get-ACL $SharePath
$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
$Acl.AddAccessRule($AccessRule)
Set-Acl $SharePath $Acl
$Installer = $env:TEMP + "\chrome_installer.exe"; 
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Installer;
