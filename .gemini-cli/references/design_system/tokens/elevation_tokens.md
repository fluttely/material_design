# Elevation Tokens

## Purpose

Elevation tokens define the standardized levels of separation between surfaces along the z-axis. In Material Design, elevation is primarily communicated through shadows. These tokens will represent the properties needed to construct `BoxShadow` objects.

## Token Definition

Elevation tokens will be represented by an `ElevationTokens` class, where each level maps to a set of shadow properties: `color`, `offset`, `blurRadius`, and `spreadRadius`. Material 3 often uses a single `BoxShadow` with a colored tint rather than multiple shadows.

## Proposed Structure

```dart
// DART (Conceptual)
enum ElevationToken {
  level0, // No elevation
  level1, // e.g., Cards, Buttons
  level2, // e.g., Menus, Dialogs
  level3, // e.g., Navigation Drawers
  level4,
  level5,
}

class ShadowProperties {
  final Color color;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
}

class ElevationTokens {
  // M3 often uses a single shadow, with color being the primary differentiator.
  final Map<ElevationToken, ShadowProperties> values;
}
```

## Rationale

This token structure abstracts the complexity of shadow rendering. Instead of manually defining `BoxShadow` properties for each component, developers can apply a semantic elevation level. This ensures that shadows are applied consistently, maintaining a clear visual hierarchy and depth perception across the application, aligned with Material 3's surface and shadow system.
