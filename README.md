# Material Design for Flutter

[![pub version](https://img.shields.io/pub/v/material_design.svg)](https://pub.dev/packages/material_design)
[![license](https://img.shields.io/badge/license-BSD-blue.svg)](/LICENSE)
[![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)](https://flutter.dev)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

The fastest path to consistent Material Design UIs in Flutter. Build beautiful apps aligned with official metrics and guidelines using a powerful set of ready-to-use design tokens and helper widgets.

This package provides a comprehensive toolkit for implementing Material Design 3 in Flutter. It includes a complete design token system and utilities that align with the official Material Design 3 specification, making it easier to build beautiful and consistent user interfaces.

## Features

- **Design Token System**: A complete implementation of the Material Design 3 token hierarchy, including reference, system, and component tokens.
- **Adaptive Design**: Utilities for creating adaptive layouts that respond to different screen sizes and platforms.
- **Material Design 3 Compliance**: Built to align with the official Material Design 3 guidelines.

## Getting Started

To use this package, add `material_design` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  material_design: ^0.29.0-dev
```

Then, import the library in your Dart code:

```dart
import 'package:material_design/material_design.dart';
```

## Usage

### Design Tokens

The library provides a flexible system for defining and using design tokens.

```dart
// Create reference tokens
const primaryRef = ReferenceToken<Color>(
  Color(0xFF6750A4),
  'purple.40'
);

// Create system tokens
const primaryColor = SystemToken<Color>(
  Color(0xFF6750A4),
  'color.primary',
  referenceToken: primaryRef,
);

// Create component tokens
const buttonBackground = ComponentToken<Color>(
  Color(0xFF6750A4),
  'button.filled.background',
  systemToken: primaryColor,
  component: 'Button',
);
```

## Contributing

Contributions are welcome! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
