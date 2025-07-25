# Motion Tokens

## Purpose

Motion tokens define the standard durations and easing curves for animations and transitions within the application. Using motion tokens ensures that the application's animations are consistent, feel cohesive, and adhere to Material Design's principles for natural and intuitive motion.

## Token Definition

Motion tokens will be defined in a `MotionTokens` class, which provides named properties for different animation `Duration`s and `Curve`s.

## Proposed Structure

```dart
// DART (Conceptual)
class MotionTokens {
  // Durations
  static const Duration short1 = Duration(milliseconds: 50);
  static const Duration short2 = Duration(milliseconds: 100);
  static const Duration medium1 = Duration(milliseconds: 200);
  static const Duration medium2 = Duration(milliseconds: 300);
  static const Duration long1 = Duration(milliseconds: 400);
  static const Duration long2 = Duration(milliseconds: 500);

  // Easing Curves
  static const Curve standard = Curves.easeInOut;
  static const Curve standardDecelerate = Curves.easeOut;
  static const Curve standardAccelerate = Curves.easeIn;
  static const Curve emphatic = Curves.easeOutBack;
}
```

## Rationale

This approach provides a centralized and semantic way to manage animation properties. Developers can use meaningful names like `MotionTokens.medium1` instead of hardcoding milliseconds. This makes the code more readable and allows for global changes to the application's motion design by modifying a single file. The chosen values are based on Material Design's recommendations for common transition types.
