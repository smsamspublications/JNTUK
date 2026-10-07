# Experiment 1 - Installation & Dart Basics

## 1(a) Install Flutter & Dart with Android Studio
See the main README (section "One-time setup"). The Linux terminal commands in the
manual (apt-get / git clone) are the command-line route; with Android Studio you
install the Flutter plugin and point it at the SDK instead. Verify with:

    flutter doctor
    dart --version

## 1(b) First Dart program
This is a **pure Dart** project (no Flutter, no emulator).
1. File > Open > select this folder.
2. Open `bin/main.dart`, click the green Run arrow beside `main()`.
3. Expected output:
   Hello, Flutter Learner! / You are learning Dart. / Factorial of 5 is 120.

Or from a terminal in this folder: `dart run bin/main.dart`
