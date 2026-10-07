@echo off
rem Run once (Windows). Generates the android\ platform folder for every
rem Flutter project here so Android Studio can run them on an emulator/phone.
rem Your lib\ code and pubspec.yaml are NOT overwritten.
setlocal
cd /d "%~dp0"

where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter not found on PATH.
  echo Android Studio ^> Settings ^> Languages and Frameworks ^> Flutter shows the SDK path.
  echo Add its bin folder to PATH, open a NEW terminal, and run this again.
  exit /b 1
)

echo === all_in_one\flutter_lab_all ===
pushd all_in_one\flutter_lab_all
call flutter create . --project-name flutter_lab_all --org edu.lbrce --platforms=android
call flutter pub get
popd

for /d %%D in (separate\exp*) do (
  if /i not "%%~nxD"=="exp01_installation_dart_basics" (
    echo === %%D ===
    pushd "%%D"
    call flutter create . --project-name %%~nxD --org edu.lbrce --platforms=android
    call flutter pub get
    popd
  )
)
echo Done. In Android Studio: File ^> Open ^> pick a project folder.
endlocal
