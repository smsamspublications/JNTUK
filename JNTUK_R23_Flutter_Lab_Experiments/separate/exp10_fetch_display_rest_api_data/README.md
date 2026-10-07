# Experiment 10 - Fetch & Display REST API Data

- **10(a)&(b) Fetch JSON, render list** -> `lib/main.dart`

## Run
1. File > Open > select this folder.
2. First time only, in the Android Studio Terminal tab: `flutter create .` then `flutter pub get`
   (creates the android/ folder; your lib/ code and pubspec are kept).
3. Start an emulator (or plug in a phone), open the file above, click the green Run arrow.

Package `http: ^1.2.2` is already declared in pubspec.yaml.
Needs internet. Debug builds already allow it; for a release APK add the INTERNET permission to android/app/src/main/AndroidManifest.xml.
