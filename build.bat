@echo off
setlocal
where gradle >nul 2>nul
if errorlevel 1 (
  echo Gradle 9.2+ wurde nicht gefunden. Installiere Gradle oder oeffne das Projekt in IntelliJ IDEA.
  pause
  exit /b 1
)
gradle build
if errorlevel 1 exit /b %errorlevel%
echo Build abgeschlossen. JAR liegt unter build/libs/ragzan-utility-0.1.0.jar
pause
