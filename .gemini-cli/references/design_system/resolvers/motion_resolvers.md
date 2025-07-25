# Motion Resolvers

## Purpose

Motion resolvers provide easy access to the `MotionTokens` within the Flutter animation framework. While motion tokens are often simple constants (`Duration`, `Curve`), resolvers can provide helpful utilities or widgets that simplify common animation patterns.

## Proposed API & Mapping

### 1. `AnimatedContainerResolver`

A wrapper around Flutter's `AnimatedContainer` that uses motion tokens for its default duration and curve. This simplifies creating implicitly animated containers that are consistent with the system's motion design.

**API:**
```dart
// DART (Conceptual)
AnimatedContainerResolver(
  // duration and curve are optional, defaulting to tokens
  // duration: MotionTokens.medium1,
  // curve: MotionTokens.standard,
  width: isSelected ? 200 : 100,
  height: isSelected ? 200 : 100,
  color: isSelected ? Colors.blue : Colors.red,
  child: ...,
)
```

**Mapping:**
- The `duration` property defaults to `MotionTokens.medium1`.
- The `curve` property defaults to `MotionTokens.standard`.

### 2. `MotionTokenResolver` (Static Access)

While the `MotionTokens` class itself can be used directly, a resolver class could provide a more consistent access pattern alongside other resolvers. For this category, the resolver might be a simple proxy to the token class.

**API:**
```dart
// DART (Conceptual)
// This is functionally equivalent to accessing MotionTokens directly,
// but maintains the "resolver" pattern for consistency.
final duration = MotionTokenResolver.duration.medium1;
final curve = MotionTokenResolver.curve.standard;

// The implementation could be a simple static getter:
class MotionTokenResolver {
  static final duration = MotionTokens.duration;
  static final curve = MotionTokens.curve;
}
```

## Rationale

The primary benefit of motion resolvers is to reduce boilerplate and ensure consistency. `AnimatedContainerResolver` saves the developer from repeatedly specifying the same duration and curve for standard animations. The static `MotionTokenResolver` class provides a single, consistent entry point (`SomeResolver.fromToken(...)` or `SomeResolver.property`) for the entire design system, even if its implementation for motion is a simple pass-through. This makes the system easier to learn and use.
