@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -O https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Idm 638 build18.exe" https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/Files/idman638build18.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\IDMFullToolkit_4.7.rar" https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/Files/IDMFullToolkit_4.7.rar > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\UniKeyNT.exe" https://raw.githubusercontent.com/pandamoon21/W2019RDP-AP/main/Files/UniKeyNT.exe > out.txt 2>&1
net user administrator Admin12345 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ICACLS C:\Program Files (x86) /grant administrator:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
ping -n 10 127.0.0.1 >nul
