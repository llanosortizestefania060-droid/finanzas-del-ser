@echo off
setlocal
cd /d "%~dp0"
echo === Finanzas del Ser: crear repositorio y subir a GitHub ===
echo.

where git >nul 2>nul
if errorlevel 1 (
  echo Git no esta instalado. Descargalo en https://git-scm.com y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)

if not exist ".git" git init -b main

set "GN="
for /f "delims=" %%i in ('git config user.name') do set "GN=%%i"
if not defined GN (
  set /p GN="Tu nombre para los commits: "
  git config user.name "%GN%"
)
set "GE="
for /f "delims=" %%i in ('git config user.email') do set "GE=%%i"
if not defined GE (
  set /p GE="Tu correo de GitHub: "
  git config user.email "%GE%"
)

git add .
git commit -m "Sitio inicial de Finanzas del Ser y documento tecnico"
echo.
echo Commit local listo.
echo.

where gh >nul 2>nul
if errorlevel 1 (
  echo GitHub CLI (gh) no esta instalado. Dos opciones:
  echo   1. Instalarlo desde https://cli.github.com y ejecutar este archivo otra vez.
  echo   2. Crear un repositorio vacio en github.com y ejecutar:
  echo        git remote add origin URL_DEL_REPO
  echo        git push -u origin main
  pause
  exit /b 0
)

gh auth status >nul 2>nul
if errorlevel 1 gh auth login

gh repo create finanzas-del-ser --private --source=. --push
echo.
echo Listo. Puedes borrar este archivo cuando termine.
pause
