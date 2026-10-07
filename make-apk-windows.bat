@echo off
chcp 65001 >nul
call npm install
if not exist android call npx cap add android
call npx capacitor-assets generate --android
call npx cap sync android
cd android
call gradlew.bat assembleDebug
cd ..
echo.
echo APK: android\app\build\outputs\apk\debug\app-debug.apk
pause
