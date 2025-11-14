# Elevation Resolvers

## Purpose

Elevation resolvers translate semantic `ElevationToken`s into a list of `BoxShadow` objects, which is the standard way to represent elevation and depth in Flutter.

## Proposed API & Mapping

### 1. `ElevationResolver`

A class with a static method to convert an `ElevationToken` into `List<BoxShadow>`.

**API:**
```dart
// DART (Conceptual)
Container(
  decoration: BoxDecoration(
    boxShadow: ElevationResolver.fromToken(ElevationToken.level2),
  ),
  ...
)
```

**Mapping:**
The resolver would contain a map from the enum to the concrete shadow values.

```dart
// DART (Conceptual)
// Inside ElevationResolver
static const Map<ElevationToken, List<BoxShadow>> _shadowMap = {
  ElevationToken.level0: [],
  ElevationToken.level1: [
    BoxShadow(
      color: Color(0x1F000000), // Example color
      blurRadius: 3.0,
      offset: Offset(0, 1),
    ),
  ],
  ElevationToken.level2: [
    BoxShadow(
      color: Color(0x33000000), // Example color
      blurRadius: 8.0,
      offset: Offset(0, 4),
    ),
  ],
  // ... other levels
};

static List<BoxShadow> fromToken(ElevationToken token) {
  return _shadowMap[token] ?? [];
}
```

## Rationale

This provides a simple, centralized, and type-safe mechanism for applying shadows. It abstracts the specific `BoxShadow` implementation details from the component layer. If the design system's shadow aesthetics need to be updated, the changes only need to be made in the `_shadowMap` within the `ElevationResolver`, and they will be propagated throughout the entire app. This aligns with Material 3's emphasis on tonal elevation and surface color in addition to shadows.
