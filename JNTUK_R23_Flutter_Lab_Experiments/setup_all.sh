#!/usr/bin/env bash
# Run once (macOS / Linux). Generates the android/ platform folder for every
# Flutter project here so Android Studio can run them on an emulator/phone.
# Your lib/ code and pubspec.yaml are NOT overwritten.
set -e
cd "$(dirname "$0")"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter not found on PATH."
  echo "Android Studio > Settings > Languages & Frameworks > Flutter shows the SDK path;"
  echo "add its 'bin' folder to PATH and run this again."
  exit 1
fi

setup() {
  echo "=== $1 ==="
  (cd "$1" && flutter create . --project-name "$2" --org edu.lbrce --platforms=android && flutter pub get)
}

setup all_in_one/flutter_lab_all flutter_lab_all
for d in separate/exp*/; do
  n=$(basename "$d")
  [ "$n" = "exp01_installation_dart_basics" ] && continue   # pure Dart, no platform folder needed
  setup "separate/$n" "$n"
done
echo "Done. In Android Studio: File > Open > pick a project folder."
