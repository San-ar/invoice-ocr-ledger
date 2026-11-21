#!/usr/bin/env bash
set -e
npm install
[ -d android ] || npx cap add android
M=android/app/src/main/AndroidManifest.xml
grep -q "android.permission.CAMERA" $M || (sed -i.bak 's#<uses-permission android:name="android.permission.INTERNET" />#<uses-permission android:name="android.permission.INTERNET" />\n    <uses-permission android:name="android.permission.CAMERA" />\n    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />\n    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="32" />#' $M && rm -f $M.bak)
npx cap sync android
cd android && ./gradlew assembleDebug
echo; echo "APK ready: android/app/build/outputs/apk/debug/app-debug.apk"
