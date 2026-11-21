# Invoice Tracker

Offline-first Android invoice and payment ledger built for single-device shop management (MYR / RM, light-only emerald & gold theme).

## Tech Stack
- **Mobile Wrapper**: Capacitor 6 (`@capacitor/android`, `@capacitor/app`, `@capacitor/camera`, `@capacitor/filesystem`, `@capacitor/share`)
- **Frontend**: Plain HTML/CSS/JS ([`www/index.html`](invoice-handover/android-wrapper/www/index.html))
- **Local Storage**: On-device IndexedDB (`invoice_tracker_db`) using integer `sen` math (no floating-point rounding bugs)
- **OCR**: Direct client-side REST call to Groq Vision (`POST https://api.groq.com/openai/v1/chat/completions`, default model `qwen/qwen3.8-27b`) with a user-supplied API key stored locally

## Build Commands

Prerequisites: Node.js, JDK 17, and Android SDK (`platforms;android-34`, `build-tools;34.0.0`).

```bash
cd invoice-handover/android-wrapper
npm install
npx cap sync android

# Debug APK
cd android && ./gradlew assembleDebug

# Signed Release APK (requires android/keystore.properties + release .jks)
cd android && ./gradlew assembleRelease
```

Outputs:
- Debug: `invoice-handover/android-wrapper/android/app/build/outputs/apk/debug/app-debug.apk`
- Release: `invoice-handover/android-wrapper/android/app/build/outputs/apk/release/app-release.apk`

## Data, Backups & Signing
- **On-device storage**: All accounts, invoices, payments, and compressed (~1400px) JPEG photos are stored locally in IndexedDB. No external backend is used.
- **Backup & Export**: Open **Settings** (gear icon on Home) to export an Excel-ready CSV or save/restore a full JSON backup (including photos and Groq settings) via the Android Share Sheet.
- **Keystore Safety**: Never commit `*.jks`, `*.keystore`, or `keystore.properties` to Git. Keep the release keystore and `keystore.properties` backed up safely outside the repository—all future APK updates must be signed with the exact same keystore.
