winrm quickconfig -force;
Set-NetConnectionProfile -Name "Network" -NetworkCategory Private;
netsh advfirewall firewall add rule name=WinRM-HTTP dir=in localport=5985 protocol=TCP action=allow;
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
mkdir C:\Qualys
cd C:\Users\azureuser\Downloads
Invoke-WebRequest -OutFile "Firefox Installer.exe" -Uri https://download-installer.cdn.mozilla.net/pub/firefox/releases/101.0.1/win64/en-US/Firefox%20Setup%20101.0.1.exe
Start-Process -Wait -FilePath "C:\Users\azureuser\Downloads\Firefox Installer.exe" -ArgumentList "/S" -PassThru
$sharepath = "C:\Users\azureuser\AppData\Local\Temp"
$Acl = Get-ACL $SharePath
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
$Acl.AddAccessRule($AccessRule)
Set-Acl $SharePath $Acl
$Installer = $env:TEMP + "\chrome_installer.exe"; 
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Installer;
