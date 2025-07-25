# Radius Tokens

## Purpose

Radius tokens define a set of standardized border radius values to be applied to the corners of UI elements like cards, buttons, and dialogs. This ensures that the roundness of corners is consistent and contributes to a unified shape language.

## Token Definition

Radius tokens will be represented by a `RadiusTokens` class or enum, mapping abstract size names to concrete `Radius` or `BorderRadius` objects.

## Proposed Structure

```dart
// DART (Conceptual)
enum RadiusToken {
  none, // 0.0
  xs,   // 4.0
  s,    // 8.0
  m,    // 12.0
  l,    // 16.0
  xl,   // 24.0
  full, // A very large number for full rounding (e.g., 9999.0)
}

class RadiusTokens {
  final Map<RadiusToken, Radius> values;
}
```

## Rationale

Using tokens for corner radii establishes a clear shape hierarchy. The `full` token is a common convention for creating pill-shaped or circular elements without needing to calculate the exact radius required. The scale provides a range of options suitable for different component sizes, from small chips to large dialogs.
