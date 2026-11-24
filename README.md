# ShopLite

ShopLite is a learning project for a shopping app using feature-first Clean
Architecture. The SHOP-2 foundation provides an empty feature structure, lint
rules, and a Material 3 placeholder home screen that follows the device's light
or dark appearance. Shopping features and API integrations are not implemented.

## Setup and run

### Prerequisites

- Flutter 3.35.7 stable (includes Dart 3.9.2), or a compatible stable release.
- Git.
- For Android: Android Studio, the Android SDK, and an Android emulator or a
  physical device with USB debugging enabled.
- For the optional web target: Google Chrome.

Run `flutter doctor` and resolve any Android toolchain issues it reports. If
requested, accept the Android SDK licenses with `flutter doctor --android-licenses`.
Create an emulator in Android Studio's Device Manager and start it, or connect
your Android device.

```sh
git clone https://github.com/ducvu0911dev-spec/ft_flutter_shoplite.git
cd ft_flutter_shoplite
flutter pub get
flutter devices
flutter run -d <device-id>
```

Replace `<device-id>` with the Android device ID printed by `flutter devices`.
To list and launch an existing emulator from the terminal:

```sh
flutter emulators
flutter emulators --launch <emulator-id>
```

Alternatively, run the web target with `flutter run -d chrome`.
No API keys, environment files, or backend services are required.
The first Android build needs internet access to download Gradle dependencies.

## Folder structure

```text
lib/
├── main.dart
├── core/
│   ├── network/
│   ├── error/
│   ├── storage/
│   ├── widgets/
│   │   └── placeholder_home_screen.dart
│   ├── router/
│   └── theme/
│       └── app_theme.dart
└── features/
    ├── auth/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── products/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── cart/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── favorites/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    ├── checkout/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    └── settings/
        ├── data/
        ├── domain/
        └── presentation/
test/
└── app_test.dart
```

Empty directories contain `.gitkeep` so they survive a clone. Remove a directory's
`.gitkeep` when adding its first implementation file.

## Architecture rules

- Organize feature code under its feature's `data`, `domain`, and `presentation`
  directories.
- `domain`: pure Dart entities, repository contracts, and use cases. Do not import
  Flutter, UI code, or data implementations here.
- `data`: data sources, models/mappers, and implementations of domain repository
  contracts. Dependencies point toward `domain`.
- `presentation`: screens, widgets, and future state management. Use domain
  contracts/use cases; do not call data sources directly.
- `core`: shared infrastructure and widgets. Keep it independent of features.
- `main.dart` is the application entry point and composition root. It configures
  `MaterialApp`; the temporary home screen lives in `core/widgets` until replaced
  by feature screens.
- Define colors and app themes in `core/theme/app_theme.dart`. Read colors and
  typography through `Theme.of(context)` in UI code. Keep `ThemeMode.system` so
  changing the device appearance changes the app theme.
- Prefer `const` constructors and collections wherever possible.
- This foundation adds no runtime dependencies beyond the Flutter SDK. Runtime
  packages, routing, API calls, and feature logic belong to later tickets.

## Testing and code quality

```sh
dart format .
flutter analyze
flutter test
```

Analysis must report zero issues. `analysis_options.yaml` includes `flutter_lints`
and explicitly enables `prefer_const_constructors` and
`prefer_const_literals_to_create_immutables`.

The widget test verifies the placeholder and its response to device appearance
changes in both directions. To verify on Android, launch the app, switch the
device between light and dark mode in Android Settings, and check that the home
screen updates. Attach screenshots or a short recording of both appearances to
the SHOP-2 PR. Build an Android debug APK with `flutter build apk --debug`.

Verified locally with Flutter 3.35.7 on an Android 16 (API 36) emulator: debug APK
build, installation, launch, and device light/dark switching. Captured evidence:
[light mode](docs/screenshots/home-light.png) and
[dark mode](docs/screenshots/home-dark.png).

## Contribution workflow

Work on a feature branch, for example `feature/SHOP-2-project-foundation`.
Use commit messages in the format `SHOP-2: <message>` and open a PR referencing
SHOP-2. Obtain mentor review and approval before merging to `main`. Configure
protection for `main` in the Git hosting settings; repository files alone do not
enforce branch protection.

## AI usage log

See [docs/ai_usage_log.md](docs/ai_usage_log.md) for tasks, prompt summaries,
changes accepted, and suggestions rejected.

## Known issues and limitations

- Authentication, products, cart, favorites, checkout, and settings are empty
  architecture folders. The home screen is intentionally a placeholder.
- Loading, error, and empty states do not apply to this foundation ticket.
- Native platforms use the generated development identifiers and launcher assets;
  production branding and signing are not configured.
- Jira backlog creation, repository branch protection, mentor approval, and PR
  merge are separate delivery steps from the local project setup.
