@echo off
chcp 65001 >nul
cd /d "%~dp0"
set "MSG=Ajustes del sitio"
echo Quitando archivos que ya no se usan...
del /q "servicios.html" "assets\icons\presupuesto.svg" "assets\icons\ahorro.svg" "assets\icons\compras.svg" "assets\icons\educacion.svg" "assets\icons\facebook.svg" "assets\icons\facebook-oscuro.svg" "assets\img\logo-provisional.svg" "assets\img\hero-provisional.svg" "assets\img\logo-azul.png" "assets\img\logo-blanco.png" "assets\img\favicon.png" 2>nul
echo.
echo Mensaje propuesto: %MSG%
set /p "NUEVO=Presiona Enter para usarlo o escribe otro mensaje: "
if defined NUEVO set "MSG=%NUEVO%"
git add -A
git commit -m "%MSG%"
git push
echo.
echo Listo. Si no hubo errores arriba, ya esta en GitHub.
pause
