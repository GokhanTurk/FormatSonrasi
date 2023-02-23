 Write-Host "Checking if Winget is Installed..."
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
    Write-Host "Winget Already Installed"
}
else {
    irm https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi.bat/main/SilentWinget.ps1 | iex
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowTaskViewButton -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowCortanaButton -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode -Type DWord -Value 1
Set-ItemProperty -Path "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" -Name ShellFeedsTaskbarOpenOnHover -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name {20D04FE0-3AEA-1069-A2D8-08002B30309D} -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name {59031a47-3f72-44a7-89c5-5595fe6b30ee} -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name {59031a47-3f72-44a7-89c5-5595fe6b30ee} -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name LaunchTo -Type DWord -Value 1
Set-ItemProperty -Path "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name HideSCAMeetNow -Type DWord -Value 1
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Psched /v NonBestEffortLimit" -Name NonBestEffortLimit -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Type String -Value "58"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Type String -Value "122"
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name Allow Telemetry -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft" -Name LetAppsRunInBackground -Type DWord -Value 0
Set-ItemProperty -Path "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name GlobalUserDisabled -Type DWord -Value 1
Set-ItemProperty -Path "HKU\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type String -Value "2"
pause
exit
