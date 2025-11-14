# Material Design 3 - Elevation

## Overview
Elevation in Material Design 3 creates depth and hierarchy through the use of shadows and surface tinting. It helps users understand the relative importance and layering of interface elements.

## Current Implementation Status

### ✅ Implemented Features

#### Basic Elevation System
- **Elevation Levels** (`m3_elevation.dart`)
  - Standardized elevation values for different UI contexts
  - Support for common elevation levels (0-24dp)

#### Surface Tinting
- **Tonal Surface Colors** (`m3_tonal_color.dart`)
  - Elevation-based surface color calculations
  - Integration with Flutter's ElevationOverlay system
  - Automatic tint application based on elevation

#### Shadow System
- **Shadow Definitions** (`m3_shadow.dart`)
  - Shadow specifications for different elevation levels
  - Consistent shadow styling across components

### 🔄 Missing/Incomplete Features

#### Advanced Elevation Features
- **Elevation Animations**: Smooth elevation transitions
- **Dynamic Elevation**: Context-aware elevation adjustments
- **Elevation Tokens**: Complete token system for elevation values

#### Shadow Enhancements
- **Ambient Shadows**: Soft shadows for general lighting
- **Directional Shadows**: Sharp shadows for focused lighting
- **Custom Shadow Colors**: Brand-specific shadow styling

#### Component Integration
- **Component Elevation Maps**: Elevation specifications per component
- **State-Based Elevation**: Elevation changes for different states
- **Platform-Specific Shadows**: Native shadow rendering

## Elevation Scale

### Standard Elevation Levels
```dart
abstract class M3Elevation {
  // Surface level - no elevation
  static const double level0 = 0.0;
  
  // Basic elevation levels
  static const double level1 = 1.0;   // Cards at rest
  static const double level2 = 3.0;   // Buttons, switches
  static const double level3 = 6.0;   // FAB at rest, chips
  static const double level4 = 8.0;   // Bottom navigation
  static const double level5 = 12.0;  // App bars, bottom sheets
  
  // Higher elevation levels
  static const double modal = 16.0;    // Modal dialogs
  static const double navigation = 24.0; // Navigation drawer
  static const double overlay = 32.0;  // Overlays, tooltips
  
  // Interactive states
  static const double cardHover = 4.0;
  static const double cardPressed = 8.0;
  static const double fabHover = 8.0;
  static const double fabPressed = 12.0;
  
  // Component-specific elevations
  static const double appBar = 0.0;     // M3 app bars are flat by default
  static const double bottomAppBar = 3.0;
  static const double drawer = 16.0;
  static const double bottomSheet = 1.0;
  static const double snackbar = 6.0;
  static const double tooltip = 24.0;
  static const double banner = 1.0;
  static const double card = 1.0;
  static const double chip = 1.0;
  static const double menu = 8.0;
}
```

### Elevation Utilities
```dart
class M3ElevationUtils {
  static double getComponentElevation(String componentType, {String? state}) {
    switch (componentType.toLowerCase()) {
      case 'card':
        if (state == 'hover') return M3Elevation.cardHover;
        if (state == 'pressed') return M3Elevation.cardPressed;
        return M3Elevation.card;
        
      case 'fab':
        if (state == 'hover') return M3Elevation.fabHover;
        if (state == 'pressed') return M3Elevation.fabPressed;
        return M3Elevation.level3;
        
      case 'button':
        if (state == 'pressed') return M3Elevation.level1;
        return M3Elevation.level0;
        
      case 'appbar':
        return M3Elevation.appBar;
        
      case 'bottomsheet':
        return M3Elevation.bottomSheet;
        
      case 'dialog':
        return M3Elevation.modal;
        
      case 'drawer':
        return M3Elevation.drawer;
        
      default:
        return M3Elevation.level0;
    }
  }
  
  static bool isValidElevation(double elevation) {
    return elevation >= 0 && elevation <= 32;
  }
  
  static double clampElevation(double elevation) {
    return elevation.clamp(0.0, 32.0);
  }
}
```

## Shadow System

### Shadow Specifications
```dart
abstract class M3Shadows {
  // Elevation 0 - No shadow
  static const List<BoxShadow> elevation0 = [];
  
  // Elevation 1 - Subtle shadow
  static const List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Color(0x1F000000), // 12% opacity
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
    ),
  ];
  
  // Elevation 2 - Light shadow
  static const List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 2,
    ),
  ];
  
  // Elevation 3 - Medium shadow
  static const List<BoxShadow> elevation3 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 3,
    ),
  ];
  
  // Elevation 4 - Pronounced shadow
  static const List<BoxShadow> elevation4 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 6,
    ),
  ];
  
  // Elevation 5 - Strong shadow
  static const List<BoxShadow> elevation5 = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 8),
      blurRadius: 12,
      spreadRadius: 6,
    ),
  ];
  
  static List<BoxShadow> getShadow(double elevation) {
    switch (elevation.round()) {
      case 0:
        return elevation0;
      case 1:
        return elevation1;
      case 2:
      case 3:
        return elevation2;
      case 4:
      case 5:
      case 6:
        return elevation3;
      case 7:
      case 8:
        return elevation4;
      default:
        return elevation5;
    }
  }
}
```

### Advanced Shadow System
```dart
class M3AdvancedShadows {
  // Ambient light shadows (soft, diffused)
  static BoxShadow ambientShadow({
    required double elevation,
    Color color = const Color(0x1F000000),
  }) {
    final opacity = (0.12 * elevation / 24).clamp(0.0, 0.12);
    final blur = (elevation * 0.5).clamp(1.0, 12.0);
    
    return BoxShadow(
      color: color.withOpacity(opacity),
      offset: Offset(0, elevation * 0.5),
      blurRadius: blur,
      spreadRadius: 0,
    );
  }
  
  // Directional shadows (sharp, focused)
  static BoxShadow directionalShadow({
    required double elevation,
    Color color = const Color(0x14000000),
    Offset direction = const Offset(0, 1),
  }) {
    final opacity = (0.08 * elevation / 24).clamp(0.0, 0.08);
    final blur = (elevation * 0.75).clamp(2.0, 16.0);
    final spread = (elevation * 0.25).clamp(0.0, 6.0);
    
    return BoxShadow(
      color: color.withOpacity(opacity),
      offset: direction * elevation,
      blurRadius: blur,
      spreadRadius: spread,
    );
  }
  
  // Combined shadow system
  static List<BoxShadow> materialShadow({
    required double elevation,
    Color? ambientColor,
    Color? directionalColor,
  }) {
    if (elevation <= 0) return [];
    
    return [
      ambientShadow(
        elevation: elevation,
        color: ambientColor ?? const Color(0x1F000000),
      ),
      directionalShadow(
        elevation: elevation,
        color: directionalColor ?? const Color(0x14000000),
      ),
    ];
  }
}
```

## Surface Tinting

### Enhanced Surface Tinting
```dart
class M3SurfaceTinting {
  static Color calculateSurfaceColor({
    required Color surface,
    required Color surfaceTint,
    required double elevation,
  }) {
    if (elevation <= 0) return surface;
    
    // Calculate tint opacity based on elevation
    final tintOpacity = _calculateTintOpacity(elevation);
    
    return Color.alphaBlend(
      surfaceTint.withOpacity(tintOpacity),
      surface,
    );
  }
  
  static double _calculateTintOpacity(double elevation) {
    // Material Design 3 tint opacity curve
    if (elevation <= 0) return 0.0;
    if (elevation >= 24) return 0.12;
    
    // Exponential curve for natural progression
    return 0.12 * (1 - math.exp(-elevation / 8));
  }
  
  static Color surfaceAt({
    required BuildContext context,
    required double elevation,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return calculateSurfaceColor(
      surface: colorScheme.surface,
      surfaceTint: colorScheme.surfaceTint,
      elevation: elevation,
    );
  }
  
  // Predefined surface levels
  static Color surface1(BuildContext context) => surfaceAt(context: context, elevation: 1);
  static Color surface2(BuildContext context) => surfaceAt(context: context, elevation: 3);
  static Color surface3(BuildContext context) => surfaceAt(context: context, elevation: 6);
  static Color surface4(BuildContext context) => surfaceAt(context: context, elevation: 8);
  static Color surface5(BuildContext context) => surfaceAt(context: context, elevation: 12);
}
```

## Elevation Animations

### Elevation Transitions
```dart
class M3ElevationAnimation extends StatefulWidget {
  final Widget child;
  final double restingElevation;
  final double hoveredElevation;
  final double pressedElevation;
  final Duration duration;
  final Curve curve;
  
  const M3ElevationAnimation({
    Key? key,
    required this.child,
    this.restingElevation = 1.0,
    this.hoveredElevation = 4.0,
    this.pressedElevation = 8.0,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  }) : super(key: key);
  
  @override
  State<M3ElevationAnimation> createState() => _M3ElevationAnimationState();
}

class _M3ElevationAnimationState extends State<M3ElevationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _elevationAnimation;
  
  double _targetElevation = 1.0;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _elevationAnimation = Tween<double>(
      begin: widget.restingElevation,
      end: widget.restingElevation,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
    
    _targetElevation = widget.restingElevation;
  }
  
  void _animateToElevation(double elevation) {
    if (_targetElevation == elevation) return;
    
    _elevationAnimation = Tween<double>(
      begin: _elevationAnimation.value,
      end: elevation,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
    
    _targetElevation = elevation;
    _controller.forward(from: 0);
  }
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _animateToElevation(widget.hoveredElevation),
      onExit: (_) => _animateToElevation(widget.restingElevation),
      child: GestureDetector(
        onTapDown: (_) => _animateToElevation(widget.pressedElevation),
        onTapUp: (_) => _animateToElevation(widget.hoveredElevation),
        onTapCancel: () => _animateToElevation(widget.restingElevation),
        child: AnimatedBuilder(
          animation: _elevationAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                color: M3SurfaceTinting.surfaceAt(
                  context: context,
                  elevation: _elevationAnimation.value,
                ),
                boxShadow: M3Shadows.getShadow(_elevationAnimation.value),
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.child,
            );
          },
        ),
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

## Component-Specific Elevation

### Elevated Widgets
```dart
class M3ElevatedCard extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;
  
  const M3ElevatedCard({
    Key? key,
    required this.child,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final cardElevation = elevation ?? M3Elevation.card;
    
    return Material(
      elevation: cardElevation,
      color: M3SurfaceTinting.surfaceAt(
        context: context,
        elevation: cardElevation,
      ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class M3ElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double? elevation;
  
  const M3ElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.elevation,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return M3ElevationAnimation(
      restingElevation: elevation ?? M3Elevation.level1,
      hoveredElevation: M3Elevation.level2,
      pressedElevation: M3Elevation.level1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0, // We handle elevation manually
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }
}
```

### Modal Elevation
```dart
class M3ModalElevation {
  static void showElevatedDialog({
    required BuildContext context,
    required Widget child,
    double elevation = 24.0,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: elevation,
        backgroundColor: M3SurfaceTinting.surfaceAt(
          context: context,
          elevation: elevation,
        ),
        child: child,
      ),
    );
  }
  
  static void showElevatedBottomSheet({
    required BuildContext context,
    required Widget child,
    double elevation = 16.0,
  }) {
    showModalBottomSheet(
      context: context,
      elevation: elevation,
      backgroundColor: M3SurfaceTinting.surfaceAt(
        context: context,
        elevation: elevation,
      ),
      builder: (context) => child,
    );
  }
}
```

## Platform Adaptations

### Platform-Specific Elevation
```dart
class M3PlatformElevation {
  static double adaptElevationForPlatform(
    double baseElevation,
    TargetPlatform platform,
  ) {
    switch (platform) {
      case TargetPlatform.iOS:
        // iOS typically uses less pronounced elevation
        return baseElevation * 0.7;
      case TargetPlatform.macOS:
        // macOS uses subtle elevation
        return baseElevation * 0.8;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        // Android uses full Material elevation
        return baseElevation;
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // Desktop platforms use moderate elevation
        return baseElevation * 0.9;
    }
  }
  
  static List<BoxShadow> platformShadows({
    required double elevation,
    required TargetPlatform platform,
  }) {
    final adaptedElevation = adaptElevationForPlatform(elevation, platform);
    
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // iOS/macOS style shadows
        return [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: Offset(0, adaptedElevation * 0.5),
            blurRadius: adaptedElevation * 1.5,
            spreadRadius: 0,
          ),
        ];
      default:
        return M3Shadows.getShadow(adaptedElevation);
    }
  }
}
```

## Accessibility Considerations

### High Contrast Elevation
```dart
class M3AccessibleElevation {
  static List<BoxShadow> highContrastShadow(double elevation) {
    if (elevation <= 0) return [];
    
    // Enhanced shadows for high contrast mode
    return [
      BoxShadow(
        color: const Color(0x40000000), // Stronger shadow
        offset: Offset(0, elevation * 0.5),
        blurRadius: elevation * 1.5,
        spreadRadius: elevation * 0.25,
      ),
    ];
  }
  
  static Color highContrastSurfaceColor({
    required Color surface,
    required Color surfaceTint,
    required double elevation,
  }) {
    // Stronger tinting for high contrast
    if (elevation <= 0) return surface;
    
    final tintOpacity = (0.2 * elevation / 24).clamp(0.0, 0.2);
    return Color.alphaBlend(
      surfaceTint.withOpacity(tintOpacity),
      surface,
    );
  }
}
```

## Testing Elevation

### Elevation Tests
```dart
testWidgets('Elevation animation works correctly', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: M3ElevationAnimation(
          restingElevation: 1.0,
          hoveredElevation: 4.0,
          child: Container(width: 100, height: 100),
        ),
      ),
    ),
  );
  
  // Test initial state
  expect(find.byType(M3ElevationAnimation), findsOneWidget);
  
  // Test hover state
  await tester.hover(find.byType(M3ElevationAnimation));
  await tester.pumpAndSettle();
  
  // Verify elevation changed
  // (This would require accessing internal state)
});
```

## Best Practices

1. **Consistent Hierarchy**: Use elevation to create clear visual hierarchy
2. **Accessibility**: Ensure sufficient contrast in shadows and surface tinting
3. **Performance**: Minimize elevation changes for better animation performance
4. **Platform Consistency**: Adapt elevation styling to platform conventions
5. **Content Priority**: Use higher elevation for more important content

## Future Enhancements

1. **Advanced Animations**: Physics-based elevation animations
2. **Dynamic Lighting**: Elevation that responds to ambient light sensors
3. **Contextual Elevation**: Smart elevation based on content and context
4. **3D Elevation**: True 3D elevation effects
5. **Performance Optimization**: Hardware-accelerated shadow rendering

## References
- [Material Design Elevation](https://m3.material.io/styles/elevation/overview)
- [Material Design Shadow](https://material.io/design/environment/elevation.html)
- [Flutter Material Elevation](https://api.flutter.dev/flutter/material/Material/elevation.html)
- [CSS Box Shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow)