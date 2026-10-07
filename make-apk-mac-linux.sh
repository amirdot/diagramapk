#!/bin/sh
cd "$(dirname "$0")"
npm install
[ -d android ] || npx cap add android
npx capacitor-assets generate --android
npx cap sync android
(cd android && ./gradlew assembleDebug)
echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
