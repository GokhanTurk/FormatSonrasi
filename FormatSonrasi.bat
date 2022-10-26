@echo off
chcp 65001 & REM Türkçe karakterlerin düzgün çalışması için.
color b & REM Renklendirme
cls & REM Ekranı temizler.
net session > nul 2>&1 & REM Yönetici olarak çalıştırma kontrolü. 
if %errorlevel% == 2 goto :EXIT else goto START:
:START
winget > nul 2>&1 & REM Winget yüklü mü kontrolü.
if not %errorlevel% == 0 goto :EXIT2 else goto :formatsonrasi
:formatsonrasi
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /t REG_DWORD /v ShowTaskViewButton /d 0 /f & REM Görev görünüm düğmesini gizler.
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /t REG_DWORD /v ShowCortanaButton /d 0 /f & REM Cortanayı gizler.
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search /t REG_DWORD /v SearchboxTaskbarMode /d 1 /f & REM Arama çubuğunu simge hâline getirir.
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds /t REG_DWORD /v ShellFeedsTaskbarOpenOnHover /d 0 /f & REM Haberler ve ilgi alanlarında fareyi üzerine getirince açılmasını engeller.
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /t REG_DWORD /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /d 0 /f & REM Masaüstüne Bu bilgisayar simgesini getirir.
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f & REM Masaüstüne user klasörünü getirir.
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /t REG_DWORD /d 0 /f & REM Masaüstüne user klasörünü getirir.
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v LaunchTo /t REG_DWORD /d 1 /f & REM Dozya gezginini Bu bilgisayar olarak başlatır.
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f & REM Dosya uzantılarını gösterir.
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HideSCAMeetNow /t REG_DWORD /d 1 /f & REM Anında Toplantıyı gizler.
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Psched /v NonBestEffortLimit /t REG_DWORD /d 0 /f & REM Network performansını iyileştirir.
echo Görev çubuğu düzenlendi.
powercfg.exe /change monitor-timeout-ac 0 & REM Ekran kapanma süresini 0 yapar.
powercfg.exe /change standby-timeout-ac 0 & REM Uyku modunu kapatır.
echo Uyku ve ekran kapanması kapatıldı.
taskkill /f /im explorer.exe & REM Değişikliklerin görünmesi için explorerı kapatır.
start explorer.exe & REM Explorerı başlatır.
sc config "dot3svc" start= auto & REM Kablolu kimlik doğrulama servisini otomatik açar.
sc config "WlanSvc" start= auto & REM Kablosuz kimlik doğrulama servisini otomatik açar.
echo Kimlik doğrulama hizmetleri açıldı.
echo Office 2019 Kurulumu...
echo Dosyalar kopyalaniyor...
:OFFICE
robocopy "\\10.0.11.100\paylas\1 Masaüstü Bilgisayar Win 10 Programları\OFFICE 2019 ORJINAL - WINDOWS" "%userprofile%\Desktop\Office_2019" /E /j /ndl /njh 2>&1 & REM Ağdan Office klasörünü kopyalar.
if not %errorlevel% == 0 goto :LOGIN2 & REM Office kopyalamak için kaynağa ulaşamazsa login fonksiyonuna yönlendirir.
echo Dosyalar kopyalandi. Kurulum baslatiliyor...
cd "%userprofile%\Desktop\Office_2019" || @echo yol bulunamadi. && pause & REM Office kurulumu için klasörün içine girer.
echo Office 2019 kuruluyor...
setup.exe /configure Office2019ConfigurationX64TR.xml & REM Offici kurulumu.
echo Kurulum tamamlandi.
echo Gerekli programlar yükleniyor...
winget install --id=Zoom.Zoom -e -h --accept-source-agreements --accept-package-agreements
winget install --id=Google.Chrome -e -h
winget install --id=RARLab.WinRAR -e -h
winget install --id=VideoLAN.VLC -e -h
winget install --id=Oracle.JavaRuntimeEnvironment -e -h
winget install --id=Adobe.Acrobat.Reader.64-bit -e -h
echo Gereksiz programlar kaldırılıyor...
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
echo Gereksiz programları kaldırma işlemi tamamlandı.
cd "%userprofile%\Desktop\"
rmdir Office_2019 /s /q || rmdir Office_2019 /s /q & REM Office kurulum dosyalarını siler.
echo Kurulum dosyaları silindi.
pause
exit
:EXIT
echo -                                -
echo Yönetici olarak çalıştırmalısınız!
echo -                                -
ping 127.0.0.1 > nul
exit
:EXIT2
Echo winget kuruluyor...
powershell -executionpolicy bypass -file "\\10.0.11.100\paylas\GokhanTurk\BAT\Powershell\WingetInstall.ps1" > nul 2>&1 & REM winget kurulumu yapan ps scripti çalıştırır.
if %errorlevel% == 0 goto :formatsonrasi else goto :LOGIN
:LOGIN
net use \\10.0.11.100
goto :EXIT2
:LOGIN2
net use \\10.0.11.100
goto :OFFICE
