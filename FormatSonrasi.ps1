Write-Host "Checking if Winget is Installed..."
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
    Write-Host "Winget Already Installed"
}
else {
    irm https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi.bat/main/SilentWinget.ps1 | iex
}
New-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Type DWord -Value 0
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCortanaButton' -Value 0
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCortanaButton' -Value 0
New-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Type DWord -Value 1
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds' -Name 'ShellFeedsTaskbarOpenOnHover' -Value 0
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -Value 0
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -Value 0
New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu' -Name '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -Type DWord -Value 0
New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -Type DWord -Value 1
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0
New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name 'HideSCAMeetNow' -Type DWord -Value 1
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Value '506'
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys' -Name 'Flags' -Value '58'
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response' -Name 'Flags' -Value '122'
New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'Allow Telemetry' -Type DWord -Value 0
New-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft' -Name 'LetAppsRunInBackground' -Type DWord -Value 0
New-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Type DWord -Value 1
Set-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard' -Name 'InitialKeyboardIndicators' -Value 2
powercfg.exe /change monitor-timeout-ac 0
powercfg.exe /change standby-timeout-ac 0
Set-Service -Name "dot3svc" -StartupType Automatic
Set-Service -Name "WlanSvc" -StartupType Automatic
taskkill /f /im explorer.exe
start explorer.exe
net use \\10.2.11.25 /user:bat 5Tgbnhy6
robocopy "\\10.2.11.25\Programlar\OFFICE-2019-ORJINAL-WINDOWS" "$env:userprofile\Desktop\Office_2019" /E /j /ndl /njh /R:0 /W:0
cd "$env:userprofile\Desktop\Office_2019"
.\setup.exe /configure Office2019ConfigurationX64TR.xml
winget install --id=Zoom.Zoom -e -h --scope machine --accept-source-agreements --accept-package-agreements
winget install --id=Microsoft.Teams -e -h --scope machine
winget install --id=Google.Chrome -e -h
winget install --id=RARLab.WinRAR -e -h
winget install --id=VideoLAN.VLC -e -h
winget install --id=Oracle.JavaRuntimeEnvironment -e -h
winget install --id=Adobe.Acrobat.Reader.64-bit -e -h
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c -h
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe -h
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe -h
winget uninstall Microsoft.MixedReality.Portal_8wekyb3d8bbwe -h
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c -h
winget uninstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0 -h
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe -h
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe -h
winget uninstall Microsoft.549981C3F5F10_8wekyb3d8bbwe -h
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe -h
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingFinance_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingSports_8wekyb3d8bbwe -h
winget uninstall Microsoft.People_8wekyb3d8bbwe -h
winget uninstall Disney.37853FC22B2CE_6rarf9sa4v8jt -h
irm https://raw.githubusercontent.com/GokhanTurk/CreateShortcut.ps1/Multiple2/shortcut.ps1 | iex
cd "C:\Users\Public\Desktop\"
Remove-Item vlc*
Remove-Item Adob*
cd "$env:userprofile\Desktop\"
Remove-Item "Microsoft Edge.lnk"
Remove-Item Office_2019 -Force -Recurse
pause
exit
