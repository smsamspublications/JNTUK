# LBRCE Flutter Lab - Android Studio Projects (Experiments 1-10)

All code is taken directly from Flutter_Lab_Manual.docx. Two ways to use it - pick one.

| Option | Folder | Best for |
|---|---|---|
| **A. All-in-one (recommended)** | `all_in_one/flutter_lab_all` | One setup, one project, run any experiment by running its file |
| **B. Separate projects** | `separate/exp01 ... exp10` | One experiment per project, e.g. to hand out individually |

## One-time setup (per computer)
1. Install Android Studio, then add the **Flutter** and **Dart** plugins
   (Settings > Plugins). Install the Flutter SDK and point Android Studio at it
   (Settings > Languages & Frameworks > Flutter).
2. Create an emulator (Device Manager) or connect a phone with USB debugging.
3. Unzip this folder, then run the setup script **once**. It runs
   `flutter create .` and `flutter pub get` in every project (adds the android/
   folder; your lib/ code and pubspec.yaml are kept):
   - Windows: double-click `setup_all.bat` (or run it from a terminal)
   - macOS / Linux: `./setup_all.sh`
   If you only want one project, open it in Android Studio and in its Terminal tab run:
   `flutter create . --platforms=android` then `flutter pub get`.

## Option A - run an experiment from the all-in-one project
1. File > Open > `all_in_one/flutter_lab_all`.
2. Choose the emulator in the device dropdown.
3. In the Project panel open `lib/` and pick the experiment file, e.g.
   `exp05_provider_counter.dart`.
4. Click the green Run arrow beside `main()` (or right-click the file > Run).
5. Edit, save, press the lightning bolt for hot reload.

| Experiment | Files in `lib/` |
|---|---|
| 1(b) Dart basics | `exp01_basics.dart` (console output only - see below) |
| 2 Widgets & Layout | `exp02_exploring_widgets.dart`, `exp02_row_column_stack.dart` |
| 3 Responsive UI | `exp03_layout_builder.dart`, `exp03_media_query.dart` |
| 4 Navigation | `exp04_navigator_push_pop.dart`, `exp04_named_routes.dart` |
| 5 State Management | `exp05_setstate_counter.dart`, `exp05_provider_counter.dart` |
| 6 Custom Widgets & Themes | `exp06_custom_widget.dart`, `exp06_themes.dart` |
| 7 Forms & Validation | `exp07_form_validation.dart` |
| 8 Scrollable Lists | `exp08_listview_selection.dart` |
| 9 Animations | `exp09_fade_slide.dart` |
| 10 REST API | `exp10_rest_api.dart` (needs internet) |

`lib/main.dart` is only an index screen listing these files.

## Option B - separate projects
Open `separate/expNN_...` in Android Studio. Part (a) is `lib/main.dart`;
part (b), where it exists, is `lib/main_b_....dart` - run that file to see it.
Each folder has its own short README.

## Notes
- **Experiment 1(a) (installing the SDK) cannot be a project** - it is the install
  itself, covered by the one-time setup above. **1(b)** is plain Dart: in
  `separate/exp01_.../` run `bin/main.dart`; expected output is
  `Hello, Flutter Learner!` / `You are learning Dart.` / `Factorial of 5 is 120.`
- Packages are already declared: `provider: ^6.1.2` (Exp 5b) and `http: ^1.2.2` (Exp 10).
- Exp 10: debug runs already have internet permission. For a release APK, add
  `<uses-permission android:name="android.permission.INTERNET"/>` to
  `android/app/src/main/AndroidManifest.xml`.
- Android Studio runs on a real Android screen, so `MediaQuery` (Exp 3b) reports the
  true device size and `Image.network` / the REST call (Exp 2, 10) work without the
  browser (CORS) limits seen in DartPad.
- If Android Studio shows "Pub get has not been run", click **Pub get** in the banner.
