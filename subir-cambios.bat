@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Quitando archivos que ya no se usan...
del /q "assets\icons\presupuesto.svg" "assets\icons\ahorro.svg" "assets\icons\compras.svg" "assets\icons\educacion.svg" "assets\img\logo-provisional.svg" "assets\img\hero-provisional.svg" 2>nul
echo Subiendo cambios a GitHub...
git add -A
git commit -m "Aplicar branding oficial: paleta, Poppins, logo, fotos y modalidades"
git push
echo.
echo Listo. Si no hubo errores arriba, ya esta en GitHub.
pause
