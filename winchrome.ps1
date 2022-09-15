winrm quickconfig -force;
Set-NetConnectionProfile -Name "Network" -NetworkCategory Private;
netsh advfirewall firewall add rule name=WinRM-HTTP dir=in localport=5985 protocol=TCP action=allow;
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
mkdir C:\Qualys
Invoke-WebRequest -OutFile "FirefoxInstaller.exe" -Uri https://download-installer.cdn.mozilla.net/pub/firefox/releases/101.0.1/win64/en-US/Firefox%20Setup%20101.0.1.exe
Start-Process -Wait -FilePath "C:\Qualys\FirefoxInstaller.exe" -ArgumentList "/S" -PassThru
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('https://www.slimjet.com/chrome/download-chrome.php?file=files%2F104.0.5112.102%2FChromeStandaloneSetup.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
#Invoke-WebRequest -OutFile "ChromeStandaloneSetup.exe" -Uri https://www.slimjet.com/chrome/download-chrome.php?file=files%2F104.0.5112.102%2FChromeStandaloneSetup.exe
#Start-Process -Wait -FilePath "C:\Qualys\ChromeStandaloneSetup.exe" -ArgumentList "/S" -PassThru 
$sharepath = "C:\Users\azureuser\AppData\Local\Temp"
$Acl = Get-ACL $SharePath
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
$Acl.AddAccessRule($AccessRule)
Set-Acl $SharePath $Acl
#$Installer = $env:TEMP + "\chrome_installer.exe"; 
#Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
#Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
#Remove-Item $Installer;
