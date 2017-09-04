@echo off

regedit /s gruvbox-dark-medium.reg
regedit /s cmd-here.reg
regedit /s common-settings.reg

call Update-Link.cmd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk"
call Update-Link.cmd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell (x86).lnk"
call Update-Link.cmd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk"
call Update-Link.cmd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Bash on Ubuntu on Windows.lnk"
call Update-Link.cmd "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Bash на Ubuntu на Windows.lnk"