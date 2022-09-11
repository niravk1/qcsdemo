winrm quickconfig -force;
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
Set-NetConnectionProfile -Name "Network" -NetworkCategory Private;
netsh advfirewall firewall add rule name=WinRM-HTTP dir=in localport=5985 protocol=TCP action=allow;
$Installer = $env:TEMP + "\chrome_installer.exe"; 
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Installer;
