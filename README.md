# Flutter Material Lab

An interactive component testing playground built with Flutter's official standalone **[material_ui](https://pub.dev/packages/material_ui)** package.

Live site: https://bradleysouciercomputer.github.io/flutter-material-3/

## What's inside

- A focused BottomSheet playground for modal and persistent sheets.
- Controls for drag handles, drag-to-dismiss, outside-tap dismissal, corner radius, and elevation.
- Interactive examples for buttons, text fields, selection controls, sliders, dropdown menus, cards, list tiles, chips, badges, progress indicators, snack bars, dialogs, date and time pickers, tabs, navigation, tooltips, typography, and color schemes.
- Searchable component catalog, light/dark theme switch, and Material color seed presets.
- Expandable Dart examples with copy actions.

## Run locally

Requires a recent stable Flutter SDK with web support.

```sh
flutter pub get
flutter run -d chrome
```

## GitHub Pages

The workflow in `.github/workflows/deploy.yml` builds the Flutter web release and deploys it after pushes to `main`.

In the repository settings, set **Settings → Pages → Build and deployment → Source** to **GitHub Actions**. Then open the **Actions** tab and let the workflow finish. The site is built with the repository subpath as its base URL.

## Package

The app imports Material widgets from `package:material_ui/material_ui.dart`, the standalone Flutter Material library. It does not recreate the widgets with HTML or CSS.
