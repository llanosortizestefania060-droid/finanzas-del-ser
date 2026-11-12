@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Quitando archivos que ya no se usan...
del /q "servicios.html" "assets\icons\presupuesto.svg" "assets\icons\ahorro.svg" "assets\icons\compras.svg" "assets\icons\educacion.svg" "assets\icons\facebook.svg" "assets\icons\facebook-oscuro.svg" "assets\img\logo-provisional.svg" "assets\img\hero-provisional.svg" "assets\img\logo-azul.png" 2>nul
echo Subiendo cambios a GitHub...
git add -A
git commit -m "Logo SVG, mensaje de cierre y enlace de Instagram verificado"
git push
echo.
echo Listo. Si no hubo errores arriba, ya esta en GitHub.
pause
