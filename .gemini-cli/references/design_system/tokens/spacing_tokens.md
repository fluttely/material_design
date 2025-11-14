# Spacing Tokens

## Purpose

Spacing tokens define a consistent and scalable set of spacing values to be used for padding, margins, gaps, and other layout-related properties. Using tokens ensures a harmonious and predictable rhythm throughout the UI.

## Token Definition

Spacing tokens will be represented by a `SpacingTokens` class or enum, mapping abstract size names to concrete `double` values.

## Proposed Structure

```dart
// DART (Conceptual)
enum SpacingToken {
  none,    // 0.0
  xxxs,    // 2.0
  xxs,     // 4.0
  xs,      // 8.0
  s,       // 12.0
  m,       // 16.0
  l,       // 24.0
  xl,      // 32.0
  xxl,     // 48.0
  xxxl,    // 64.0
}

class SpacingTokens {
  final Map<SpacingToken, double> values;
}
```

## Rationale

This structure provides a clear, readable, and type-safe way to reference spacing values. The enum prevents the use of arbitrary "magic numbers" for spacing, enforcing consistency. The scale is based on a 4dp grid, a common practice in Material Design.
