# Material Design 3 - Shape

## Overview
Shape in Material Design 3 provides visual cohesion, brand expression, and hierarchy through the systematic use of rounded corners, borders, and geometric forms. The shape system supports accessibility while allowing for brand customization.

## Current Implementation Status

### ✅ Implemented Features

#### Basic Shape System
- **Shape Definitions** (`m3_shape.dart`)
  - Basic shape utilities and definitions
  - Support for standard geometric shapes

#### Radius System
- **Border Radius** (`m3_radius.dart`)
  - Standardized border radius values
  - Consistent rounded corner system

### 🔄 Missing/Incomplete Features

#### Shape Scale
- **Complete Shape Scale**: Full range of shape tokens (none, extra small, small, medium, large, extra large)
- **Shape Families**: Rounded, squared, and cut corner shape families
- **Shape Roles**: Component-specific shape applications

#### Advanced Shape Features
- **Cut Corners**: Angular corner cutting for brand expression
- **Shape Animations**: Smooth transitions between different shapes
- **Responsive Shapes**: Shape adaptation based on screen size

#### Shape Tokens
- **Shape Token System**: Comprehensive token library for all shapes
- **Component Shape Maps**: Shape specifications for each component
- **State-Based Shapes**: Shape changes for interactive states

## Shape Scale System

### Shape Scale Tokens
```dart
abstract class M3ShapeScale {
  // No rounding
  static const BorderRadius none = BorderRadius.zero;
  
  // Extra small shapes
  static const BorderRadius extraSmall = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius extraSmallTop = BorderRadius.vertical(top: Radius.circular(4.0));
  
  // Small shapes
  static const BorderRadius small = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius smallTop = BorderRadius.vertical(top: Radius.circular(8.0));
  static const BorderRadius smallBottom = BorderRadius.vertical(bottom: Radius.circular(8.0));
  
  // Medium shapes
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius mediumTop = BorderRadius.vertical(top: Radius.circular(12.0));
  static const BorderRadius mediumBottom = BorderRadius.vertical(bottom: Radius.circular(12.0));
  
  // Large shapes
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius largeTop = BorderRadius.vertical(top: Radius.circular(16.0));
  static const BorderRadius largeBottom = BorderRadius.vertical(bottom: Radius.circular(16.0));
  static const BorderRadius largeEnd = BorderRadius.horizontal(right: Radius.circular(16.0));
  static const BorderRadius largeStart = BorderRadius.horizontal(left: Radius.circular(16.0));
  
  // Extra large shapes
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(28.0));
  static const BorderRadius extraLargeTop = BorderRadius.vertical(top: Radius.circular(28.0));
  
  // Full rounding
  static const BorderRadius full = BorderRadius.all(Radius.circular(9999.0));
}
```

### Shape Families
```dart
abstract class M3ShapeFamily {
  // Rounded shape family (default)
  static BorderRadius rounded(double size) {
    return BorderRadius.circular(size);
  }
  
  // Squared shape family
  static BorderRadius squared() {
    return BorderRadius.zero;
  }
  
  // Cut corner shape family
  static BorderRadius cutCorner(double size) {
    return BorderRadius.only(
      topLeft: Radius.circular(size),
      topRight: Radius.zero,
      bottomLeft: Radius.zero,
      bottomRight: Radius.circular(size),
    );
  }
  
  // Asymmetric shapes
  static BorderRadius asymmetric({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }
  
  // Brand-specific shapes
  static BorderRadius brand({
    required double primary,
    double? secondary,
    BrandShapeStyle style = BrandShapeStyle.consistent,
  }) {
    final secondaryRadius = secondary ?? primary;
    
    switch (style) {
      case BrandShapeStyle.consistent:
        return BorderRadius.circular(primary);
      case BrandShapeStyle.playful:
        return BorderRadius.only(
          topLeft: Radius.circular(primary),
          topRight: Radius.circular(secondaryRadius),
          bottomLeft: Radius.circular(secondaryRadius),
          bottomRight: Radius.circular(primary),
        );
      case BrandShapeStyle.modern:
        return BorderRadius.only(
          topLeft: Radius.circular(primary),
          topRight: Radius.zero,
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(primary),
        );
      case BrandShapeStyle.organic:
        return BorderRadius.only(
          topLeft: Radius.elliptical(primary, secondaryRadius),
          topRight: Radius.elliptical(secondaryRadius, primary),
          bottomLeft: Radius.elliptical(secondaryRadius, primary),
          bottomRight: Radius.elliptical(primary, secondaryRadius),
        );
    }
  }
}

enum BrandShapeStyle { consistent, playful, modern, organic }
```

## Component Shape Mapping

### Shape Tokens by Component
```dart
abstract class M3ComponentShapes {
  // Button shapes
  static const BorderRadius buttonSmall = M3ShapeScale.extraSmall;    // 4dp
  static const BorderRadius buttonMedium = M3ShapeScale.small;        // 8dp
  static const BorderRadius buttonLarge = M3ShapeScale.medium;        // 12dp
  static const BorderRadius buttonFab = M3ShapeScale.large;           // 16dp
  static const BorderRadius buttonExtendedFab = M3ShapeScale.large;   // 16dp
  
  // Card shapes
  static const BorderRadius card = M3ShapeScale.medium;               // 12dp
  static const BorderRadius cardElevated = M3ShapeScale.medium;       // 12dp
  static const BorderRadius cardFilled = M3ShapeScale.medium;         // 12dp
  static const BorderRadius cardOutlined = M3ShapeScale.medium;       // 12dp
  
  // Sheet shapes
  static const BorderRadius bottomSheet = M3ShapeScale.largeTop;      // 16dp top only
  static const BorderRadius sideSheet = M3ShapeScale.none;            // 0dp
  static const BorderRadius dialog = M3ShapeScale.extraLarge;         // 28dp
  
  // Input shapes
  static const BorderRadius textField = M3ShapeScale.extraSmall;      // 4dp
  static const BorderRadius textFieldOutlined = M3ShapeScale.extraSmall; // 4dp
  
  // Navigation shapes
  static const BorderRadius navigationBar = M3ShapeScale.none;        // 0dp
  static const BorderRadius navigationRail = M3ShapeScale.none;       // 0dp
  static const BorderRadius navigationDrawer = M3ShapeScale.largeEnd; // 16dp end only
  
  // Chip shapes
  static const BorderRadius chip = M3ShapeScale.small;                // 8dp
  static const BorderRadius chipAssist = M3ShapeScale.small;          // 8dp
  static const BorderRadius chipFilter = M3ShapeScale.small;          // 8dp
  static const BorderRadius chipInput = M3ShapeScale.small;           // 8dp
  static const BorderRadius chipSuggestion = M3ShapeScale.small;      // 8dp
  
  // Menu shapes
  static const BorderRadius menu = M3ShapeScale.extraSmall;           // 4dp
  static const BorderRadius menuBar = M3ShapeScale.none;              // 0dp
  
  // Other component shapes
  static const BorderRadius appBar = M3ShapeScale.none;               // 0dp
  static const BorderRadius bottomAppBar = M3ShapeScale.none;         // 0dp
  static const BorderRadius searchBar = M3ShapeScale.full;            // Fully rounded
  static const BorderRadius snackbar = M3ShapeScale.extraSmall;       // 4dp
  static const BorderRadius tooltip = M3ShapeScale.extraSmall;        // 4dp
  static const BorderRadius badge = M3ShapeScale.full;                // Fully rounded
  static const BorderRadius progressIndicator = M3ShapeScale.full;    // Fully rounded
  static const BorderRadius slider = M3ShapeScale.full;               // Fully rounded
  static const BorderRadius divider = M3ShapeScale.none;              // 0dp
}
```

### Shape Utilities
```dart
class M3ShapeUtils {
  static BorderRadius getComponentShape(String componentType, {String? variant, String? size}) {
    switch (componentType.toLowerCase()) {
      case 'button':
        switch (size?.toLowerCase()) {
          case 'small': return M3ComponentShapes.buttonSmall;
          case 'large': return M3ComponentShapes.buttonLarge;
          default: return M3ComponentShapes.buttonMedium;
        }
        
      case 'fab':
        return variant == 'extended' 
            ? M3ComponentShapes.buttonExtendedFab 
            : M3ComponentShapes.buttonFab;
            
      case 'card':
        switch (variant?.toLowerCase()) {
          case 'elevated': return M3ComponentShapes.cardElevated;
          case 'filled': return M3ComponentShapes.cardFilled;
          case 'outlined': return M3ComponentShapes.cardOutlined;
          default: return M3ComponentShapes.card;
        }
        
      case 'textfield':
        return variant == 'outlined' 
            ? M3ComponentShapes.textFieldOutlined 
            : M3ComponentShapes.textField;
            
      case 'chip':
        switch (variant?.toLowerCase()) {
          case 'assist': return M3ComponentShapes.chipAssist;
          case 'filter': return M3ComponentShapes.chipFilter;
          case 'input': return M3ComponentShapes.chipInput;
          case 'suggestion': return M3ComponentShapes.chipSuggestion;
          default: return M3ComponentShapes.chip;
        }
        
      case 'sheet':
        return variant == 'bottom' 
            ? M3ComponentShapes.bottomSheet 
            : M3ComponentShapes.sideSheet;
            
      case 'dialog':
        return M3ComponentShapes.dialog;
        
      case 'menu':
        return variant == 'bar' 
            ? M3ComponentShapes.menuBar 
            : M3ComponentShapes.menu;
            
      default:
        return M3ShapeScale.none;
    }
  }
  
  static bool isValidRadius(double radius) {
    return radius >= 0 && radius <= 9999;
  }
  
  static double clampRadius(double radius) {
    return radius.clamp(0.0, 9999.0);
  }
  
  static BorderRadius lerpShape(BorderRadius a, BorderRadius b, double t) {
    return BorderRadius.lerp(a, b, t) ?? a;
  }
  
  static BorderRadius scaleShape(BorderRadius shape, double scaleFactor) {
    return BorderRadius.only(
      topLeft: Radius.circular(shape.topLeft.x * scaleFactor),
      topRight: Radius.circular(shape.topRight.x * scaleFactor),
      bottomLeft: Radius.circular(shape.bottomLeft.x * scaleFactor),
      bottomRight: Radius.circular(shape.bottomRight.x * scaleFactor),
    );
  }
}
```

## Advanced Shape Features

### Cut Corner Shapes
```dart
class M3CutCornerShapes {
  static ShapeBorder cutCorner({
    double size = 8.0,
    CutCornerPosition position = CutCornerPosition.topRight,
  }) {
    switch (position) {
      case CutCornerPosition.topLeft:
        return _CutCornerBorder(
          topLeft: size,
          topRight: 0,
          bottomLeft: 0,
          bottomRight: 0,
        );
      case CutCornerPosition.topRight:
        return _CutCornerBorder(
          topLeft: 0,
          topRight: size,
          bottomLeft: 0,
          bottomRight: 0,
        );
      case CutCornerPosition.bottomLeft:
        return _CutCornerBorder(
          topLeft: 0,
          topRight: 0,
          bottomLeft: size,
          bottomRight: 0,
        );
      case CutCornerPosition.bottomRight:
        return _CutCornerBorder(
          topLeft: 0,
          topRight: 0,
          bottomLeft: 0,
          bottomRight: size,
        );
      case CutCornerPosition.diagonal:
        return _CutCornerBorder(
          topLeft: size,
          topRight: 0,
          bottomLeft: 0,
          bottomRight: size,
        );
      case CutCornerPosition.all:
        return _CutCornerBorder(
          topLeft: size,
          topRight: size,
          bottomLeft: size,
          bottomRight: size,
        );
    }
  }
}

enum CutCornerPosition { topLeft, topRight, bottomLeft, bottomRight, diagonal, all }

class _CutCornerBorder extends ShapeBorder {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  
  const _CutCornerBorder({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });
  
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;
  
  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }
  
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    
    // Start from top-left, accounting for cut corner
    path.moveTo(rect.left + topLeft, rect.top);
    
    // Top edge
    path.lineTo(rect.right - topRight, rect.top);
    
    // Top-right corner
    if (topRight > 0) {
      path.lineTo(rect.right, rect.top + topRight);
    } else {
      path.lineTo(rect.right, rect.top);
    }
    
    // Right edge
    path.lineTo(rect.right, rect.bottom - bottomRight);
    
    // Bottom-right corner
    if (bottomRight > 0) {
      path.lineTo(rect.right - bottomRight, rect.bottom);
    } else {
      path.lineTo(rect.right, rect.bottom);
    }
    
    // Bottom edge
    path.lineTo(rect.left + bottomLeft, rect.bottom);
    
    // Bottom-left corner
    if (bottomLeft > 0) {
      path.lineTo(rect.left, rect.bottom - bottomLeft);
    } else {
      path.lineTo(rect.left, rect.bottom);
    }
    
    // Left edge
    path.lineTo(rect.left, rect.top + topLeft);
    
    // Close path
    if (topLeft > 0) {
      path.lineTo(rect.left + topLeft, rect.top);
    } else {
      path.lineTo(rect.left, rect.top);
    }
    
    path.close();
    return path;
  }
  
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // No painting needed for shape border
  }
  
  @override
  ShapeBorder scale(double t) {
    return _CutCornerBorder(
      topLeft: topLeft * t,
      topRight: topRight * t,
      bottomLeft: bottomLeft * t,
      bottomRight: bottomRight * t,
    );
  }
}
```

### Shape Animations
```dart
class M3ShapeAnimation extends StatefulWidget {
  final Widget child;
  final BorderRadius fromShape;
  final BorderRadius toShape;
  final Duration duration;
  final Curve curve;
  final bool animateOnTap;
  
  const M3ShapeAnimation({
    Key? key,
    required this.child,
    required this.fromShape,
    required this.toShape,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.animateOnTap = true,
  }) : super(key: key);
  
  @override
  State<M3ShapeAnimation> createState() => _M3ShapeAnimationState();
}

class _M3ShapeAnimationState extends State<M3ShapeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<BorderRadius> _shapeAnimation;
  
  bool _isAnimated = false;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _shapeAnimation = BorderRadiusTween(
      begin: widget.fromShape,
      end: widget.toShape,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }
  
  void _toggleShape() {
    if (_isAnimated) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.animateOnTap ? _toggleShape : null,
      child: AnimatedBuilder(
        animation: _shapeAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: _shapeAnimation.value,
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              ),
            ),
            child: widget.child,
          );
        },
      ),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

### Responsive Shapes
```dart
class M3ResponsiveShape {
  static BorderRadius forScreenSize({
    required BuildContext context,
    BorderRadius? small,
    BorderRadius? medium,
    BorderRadius? large,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 600) {
      return small ?? M3ShapeScale.small;
    } else if (screenWidth < 1200) {
      return medium ?? M3ShapeScale.medium;
    } else {
      return large ?? M3ShapeScale.large;
    }
  }
  
  static BorderRadius forDensity({
    required BuildContext context,
    BorderRadius? comfortable,
    BorderRadius? compact,
    BorderRadius? standard,
  }) {
    final visualDensity = Theme.of(context).visualDensity;
    
    if (visualDensity.horizontal < -1) {
      return compact ?? M3ShapeScale.extraSmall;
    } else if (visualDensity.horizontal > 1) {
      return comfortable ?? M3ShapeScale.large;
    } else {
      return standard ?? M3ShapeScale.medium;
    }
  }
  
  static BorderRadius adaptive({
    required BuildContext context,
    required String componentType,
    String? variant,
  }) {
    final baseShape = M3ShapeUtils.getComponentShape(
      componentType,
      variant: variant,
    );
    
    return forScreenSize(
      context: context,
      small: M3ShapeUtils.scaleShape(baseShape, 0.8),
      medium: baseShape,
      large: M3ShapeUtils.scaleShape(baseShape, 1.2),
    );
  }
}
```

## Shape Theming

### Shape Theme Builder
```dart
class M3ShapeTheme {
  final BorderRadius small;
  final BorderRadius medium;
  final BorderRadius large;
  final BorderRadius extraLarge;
  
  const M3ShapeTheme({
    this.small = M3ShapeScale.small,
    this.medium = M3ShapeScale.medium,
    this.large = M3ShapeScale.large,
    this.extraLarge = M3ShapeScale.extraLarge,
  });
  
  factory M3ShapeTheme.rounded({double factor = 1.0}) {
    return M3ShapeTheme(
      small: BorderRadius.circular(8.0 * factor),
      medium: BorderRadius.circular(12.0 * factor),
      large: BorderRadius.circular(16.0 * factor),
      extraLarge: BorderRadius.circular(28.0 * factor),
    );
  }
  
  factory M3ShapeTheme.sharp() {
    return const M3ShapeTheme(
      small: M3ShapeScale.none,
      medium: M3ShapeScale.none,
      large: M3ShapeScale.none,
      extraLarge: M3ShapeScale.none,
    );
  }
  
  factory M3ShapeTheme.playful() {
    return M3ShapeTheme(
      small: M3ShapeFamily.asymmetric(
        topLeft: 8,
        topRight: 4,
        bottomLeft: 4,
        bottomRight: 8,
      ),
      medium: M3ShapeFamily.asymmetric(
        topLeft: 12,
        topRight: 6,
        bottomLeft: 6,
        bottomRight: 12,
      ),
      large: M3ShapeFamily.asymmetric(
        topLeft: 16,
        topRight: 8,
        bottomLeft: 8,
        bottomRight: 16,
      ),
      extraLarge: M3ShapeFamily.asymmetric(
        topLeft: 28,
        topRight: 14,
        bottomLeft: 14,
        bottomRight: 28,
      ),
    );
  }
  
  ThemeData applyToTheme(ThemeData theme) {
    return theme.copyWith(
      cardTheme: theme.cardTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: medium),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: small),
        ),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        border: OutlineInputBorder(borderRadius: small),
      ),
      dialogTheme: theme.dialogTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: extraLarge),
      ),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: large.topLeft),
        ),
      ),
    );
  }
}
```

## Shape Accessibility

### High Contrast Shapes
```dart
class M3AccessibleShapes {
  static BorderRadius highContrastShape(BorderRadius baseShape) {
    // Slightly reduce corner radius for better edge definition
    return BorderRadius.only(
      topLeft: Radius.circular(baseShape.topLeft.x * 0.8),
      topRight: Radius.circular(baseShape.topRight.x * 0.8),
      bottomLeft: Radius.circular(baseShape.bottomLeft.x * 0.8),
      bottomRight: Radius.circular(baseShape.bottomRight.x * 0.8),
    );
  }
  
  static Decoration accessibleDecoration({
    required BorderRadius borderRadius,
    required Color backgroundColor,
    required Color borderColor,
    double borderWidth = 2.0,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: borderRadius,
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }
}
```

## Testing Shapes

### Shape Testing Utilities
```dart
testWidgets('Shape applies correctly to component', (tester) async {
  const testShape = M3ShapeScale.medium;
  
  await tester.pumpWidget(
    MaterialApp(
      home: Card(
        shape: RoundedRectangleBorder(borderRadius: testShape),
        child: Container(width: 100, height: 100),
      ),
    ),
  );
  
  final card = tester.widget<Card>(find.byType(Card));
  final shape = card.shape as RoundedRectangleBorder;
  expect(shape.borderRadius, equals(testShape));
});
```

## Best Practices

1. **Consistency**: Use the established shape scale throughout the app
2. **Brand Expression**: Customize shapes to reflect brand personality
3. **Accessibility**: Ensure sufficient contrast at shape boundaries
4. **Performance**: Use simple shapes for frequently animated elements
5. **Context Appropriateness**: Choose shapes that match the content and function

## Future Enhancements

1. **Advanced Shape Animations**: More sophisticated shape morphing
2. **Custom Shape Builder**: Visual tool for creating custom shapes
3. **Shape Inheritance**: Hierarchical shape systems
4. **Adaptive Shape Intelligence**: AI-driven shape selection
5. **3D Shape Support**: Three-dimensional shape capabilities

## References
- [Material Design Shape](https://m3.material.io/styles/shape/overview)
- [Material Design Shape Scale](https://m3.material.io/styles/shape/shape-scale-tokens)
- [Flutter Shapes](https://docs.flutter.dev/cookbook/design/custom-shapes)
- [CSS Border Radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)