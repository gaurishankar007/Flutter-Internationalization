# 🌍 Flutter Internationalization Demo

This Flutter project demonstrates how to implement **internationalization (i18n)** and dynamically change the app's language. The project provides two distinct approaches to achieve this:

1. Using `.arb` files with configuration through `l10n.yaml`.
2. Using custom `.json` files stored in the `assets/language` directory.

---

## ✨ Features

- 🌐 **Dynamic Language Change**: Switch between languages seamlessly in the app.
- 📂 **ARB-based Localization**: Utilize `.arb` files to manage translations with Flutter's built-in localization tools.
- 📝 **JSON-based Custom Localization**: Use custom `.json` files for a manual localization approach.
- 🔍 **Error Tracking**: Keep track of untranslated keys with the `l10n_errors.txt` file.
- 🔧 **Configurable**: Easily configure supported languages and files.
- 🌐 **Supported Languages**: The supported languages in this project are listed below.
  - English (`en`)
  - Spanish (`es`)
  - Hindi (`hi`)
  - Nepali (`ne`)

---

## 🚀 Getting Started

### Prerequisites

Ensure you have Flutter installed. For installation instructions, visit [Flutter Install](https://docs.flutter.dev/get-started/install).

---

### 🔨 How It Works

#### **1. ARB-based Localization**

Localization using Flutter's native support via `.arb` files:

- **Configuration in `l10n.yaml`:**
  ```yaml
  arb-dir: lib/l10n
  output-dir: lib/l10n/generated
  template-arb-file: app_en.arb
  output-localization-file: app_localization.dart
  output-class: AppLocalization
  synthetic-package: false
  nullable-getter: false
  untranslated-messages-file: l10n_errors.txt
  ```

#### **2. Json-based Localization**

The app uses a custom `JsonLocalization` class to manage translations:

- **JSON File Loading**: The app fetches the appropriate language JSON file based on the selected locale.
- **Localized String Retrieval**: Translations are accessed using the `translate(String key)` method.
- **Localization Delegate**: A custom `LocalizationsDelegate` (`_JsonLocalizationsDelegate`) integrates with Flutter's localization system.
