# Shape Resolvers

## Purpose

Shape resolvers translate `RadiusToken`s into concrete Flutter shape and border objects like `BorderRadius`, `RoundedRectangleBorder`, and `ShapeBorder`. This is crucial for applying a consistent shape language to components.

## Proposed API & Mapping

### 1. `BorderRadiusResolver`

A class with static methods to convert `RadiusToken`s to `BorderRadius`.

**API:**
```dart
// DART (Conceptual)
final borderRadius = BorderRadiusResolver.all(RadiusToken.m);
final pillShape = BorderRadiusResolver.all(RadiusToken.full);
```

**Mapping:**
- `RadiusToken.m` -> `BorderRadius.circular(12.0)`
- `RadiusToken.full` -> `BorderRadius.circular(9999.0)`

### 2. `ShapeResolver`

A class with static methods to generate `ShapeBorder` objects, which are used by many Material components (`Card`, `Button`, etc.).

**API:**
```dart
// DART (Conceptual)
Card(
  shape: ShapeResolver.roundedRect(
    radius: RadiusToken.m,
    side: BorderSide(color: Colors.grey),
  ),
  ...
)
```

**Mapping:**
- `ShapeResolver.roundedRect(radius: RadiusToken.m)` -> `RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))`

### 3. `RadiusResolver`

A class with static methods to convert `RadiusToken`s to `Radius` objects, for use cases where only a single corner radius is needed.

**API:**
```dart
// DART (Conceptual)
final radius = RadiusResolver.fromToken(RadiusToken.s); // Returns Radius.circular(8.0)
```

**Mapping:**
- `RadiusToken.s` -> `Radius.circular(8.0)`

## Rationale

This layered approach provides the right tool for each job. `BorderRadiusResolver` is the most common need. `ShapeResolver` is a higher-level utility that builds on top of it, providing direct compatibility with Material component `shape` properties. `RadiusResolver` offers the lowest-level primitive for maximum flexibility in custom painters or complex shape definitions.
