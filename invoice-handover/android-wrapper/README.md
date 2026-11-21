Capacitor wrapper for producing the Android APK (free, sideloaded).
Put the finished app's files in ./www (index.html at its root), then run ./build.sh.
Needs Node.js and Android Studio (SDK + JDK). Output: android/app/build/outputs/apk/debug/app-debug.apk.
For the real handover build a SIGNED RELEASE APK and keep the keystore safe (see PRD section 12).
The build script adds the CAMERA permission. Export/backup use Capacitor Filesystem + Share (already in package.json).
