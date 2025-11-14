# Spacing Resolvers

## Purpose

Spacing resolvers translate abstract `SpacingToken`s into concrete Flutter layout objects like `EdgeInsets` and `SizedBox`. This allows developers to work with semantic spacing names while the resolvers handle the conversion to the required Flutter types.

## Proposed API & Mapping

### 1. `PaddingResolver` / `MarginResolver`

A widget that takes a `SpacingToken` and applies it as padding or margin.

**API:**
```dart
// DART (Conceptual)
PaddingResolver.all(SpacingToken.m, child: ...);
PaddingResolver.symmetric(vertical: SpacingToken.s, horizontal: SpacingToken.m, child: ...);
PaddingResolver.only({left: SpacingToken.l, child: ...});
```

**Mapping:**
- `SpacingToken.m` -> `EdgeInsets.all(16.0)`
- `SpacingToken.s` -> `EdgeInsets.symmetric(vertical: 12.0)`

### 2. `EdgeInsetsResolver`

A class with static methods to convert tokens directly to `EdgeInsets`.

**API:**
```dart
// DART (Conceptual)
final padding = EdgeInsetsResolver.all(SpacingToken.m);
final margin = EdgeInsetsResolver.symmetric(v: SpacingToken.s, h: SpacingToken.m);
```

**Mapping:**
- `SpacingToken.m` -> `EdgeInsets.all(16.0)`

### 3. `GapResolver`

A widget that creates a fixed-size space (a `SizedBox`). This is often simpler and more performant than `Padding` for creating space between items in a `Row` or `Column`.

**API:**
```dart
// DART (Conceptual)
Column(
  children: [
    MyWidget1(),
    GapResolver(SpacingToken.m), // Creates a SizedBox(height: 16.0)
    MyWidget2(),
  ],
);

Row(
  children: [
    MyWidget1(),
    GapResolver(SpacingToken.l, axis: Axis.horizontal), // Creates a SizedBox(width: 24.0)
    MyWidget2(),
  ],
);
```

**Mapping:**
- `GapResolver(SpacingToken.m)` in a `Column` -> `SizedBox(height: 16.0)`
- `GapResolver(SpacingToken.l, axis: Axis.horizontal)` -> `SizedBox(width: 24.0)`

## Rationale

This multi-faceted approach provides flexibility. The `PaddingResolver` widget is convenient for simple cases. The `EdgeInsetsResolver` class is useful for widgets that require an `EdgeInsets` object directly. The `GapResolver` provides a dedicated and efficient tool for creating space, which is a very common layout task.
