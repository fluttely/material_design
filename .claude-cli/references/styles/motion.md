# Material Design 3 - Motion

## Overview
Motion in Material Design 3 provides meaningful feedback, guides user attention, and creates smooth, purposeful transitions. It's built on four foundational principles: informative, focused, expressive, and functional.

## Current Implementation Status

### ✅ Implemented Features

#### Motion Duration
- **Motion Duration System** (`m3_motion_duration.dart`)
  - Standardized duration values for different types of animations
  - Support for short, medium, long, and extra-long durations
  - Context-appropriate timing for various UI transitions

#### Motion Easing
- **Easing Curves** (`m3_motion_easing.dart`)
  - Material Design 3 easing curves
  - Standard, emphasized, and decelerated curves
  - Cubic bezier curve implementations

### 🔄 Missing/Incomplete Features

#### Advanced Motion Patterns
- **Shared Element Transitions**: Seamless element transitions between screens
- **Container Transforms**: Morphing animations between containers
- **Fade Through**: Content replacement animations
- **Fade**: Simple opacity transitions
- **Slide**: Directional slide animations

#### Motion Tokens
- **Complete Motion System**: Comprehensive motion token library
- **Component-Specific Motions**: Pre-defined animations for each component
- **State Transitions**: Animation patterns for state changes

#### Motion Utilities
- **Animation Builders**: Helper widgets for common motion patterns
- **Motion Curves**: Extended curve library
- **Physics-Based Animations**: Spring and bounce animations

## Motion Duration System

### Duration Categories
```dart
abstract class M3MotionDuration {
  // Short duration - for small UI changes
  static const Duration short1 = Duration(milliseconds: 50);
  static const Duration short2 = Duration(milliseconds: 100);
  static const Duration short3 = Duration(milliseconds: 150);
  static const Duration short4 = Duration(milliseconds: 200);
  
  // Medium duration - for standard transitions
  static const Duration medium1 = Duration(milliseconds: 250);
  static const Duration medium2 = Duration(milliseconds: 300);
  static const Duration medium3 = Duration(milliseconds: 350);
  static const Duration medium4 = Duration(milliseconds: 400);
  
  // Long duration - for complex animations
  static const Duration long1 = Duration(milliseconds: 450);
  static const Duration long2 = Duration(milliseconds: 500);
  static const Duration long3 = Duration(milliseconds: 550);
  static const Duration long4 = Duration(milliseconds: 600);
  
  // Extra long duration - for dramatic transitions
  static const Duration extraLong1 = Duration(milliseconds: 700);
  static const Duration extraLong2 = Duration(milliseconds: 800);
  static const Duration extraLong3 = Duration(milliseconds: 900);
  static const Duration extraLong4 = Duration(milliseconds: 1000);
  
  // Commonly used durations
  static const Duration emphasis = medium2;      // 300ms
  static const Duration standard = medium1;     // 250ms
  static const Duration entering = medium2;     // 300ms
  static const Duration exiting = short4;       // 200ms
  static const Duration complex = long2;        // 500ms
}
```

### Context-Specific Durations
```dart
class M3ContextualDuration {
  static Duration forComponent(String componentType, String animationType) {
    switch (componentType.toLowerCase()) {
      case 'button':
        switch (animationType) {
          case 'press': return M3MotionDuration.short1;
          case 'hover': return M3MotionDuration.short2;
          case 'focus': return M3MotionDuration.short2;
          default: return M3MotionDuration.standard;
        }
        
      case 'card':
        switch (animationType) {
          case 'elevation': return M3MotionDuration.short4;
          case 'expand': return M3MotionDuration.medium2;
          case 'collapse': return M3MotionDuration.medium1;
          default: return M3MotionDuration.standard;
        }
        
      case 'dialog':
        switch (animationType) {
          case 'enter': return M3MotionDuration.medium3;
          case 'exit': return M3MotionDuration.medium1;
          default: return M3MotionDuration.emphasis;
        }
        
      case 'bottomsheet':
        switch (animationType) {
          case 'enter': return M3MotionDuration.long1;
          case 'exit': return M3MotionDuration.medium2;
          case 'drag': return M3MotionDuration.short1;
          default: return M3MotionDuration.complex;
        }
        
      case 'navigation':
        switch (animationType) {
          case 'page': return M3MotionDuration.medium4;
          case 'tab': return M3MotionDuration.medium1;
          case 'drawer': return M3MotionDuration.long1;
          default: return M3MotionDuration.emphasis;
        }
        
      default:
        return M3MotionDuration.standard;
    }
  }
  
  static Duration forDistance(double distance) {
    // Calculate duration based on travel distance
    if (distance < 100) return M3MotionDuration.short2;
    if (distance < 300) return M3MotionDuration.medium1;
    if (distance < 500) return M3MotionDuration.medium3;
    return M3MotionDuration.long2;
  }
  
  static Duration forComplexity(int elementCount) {
    // Duration based on number of animated elements
    if (elementCount <= 1) return M3MotionDuration.short4;
    if (elementCount <= 3) return M3MotionDuration.medium2;
    if (elementCount <= 5) return M3MotionDuration.medium4;
    return M3MotionDuration.long2;
  }
}
```

## Motion Easing System

### Easing Curves
```dart
abstract class M3MotionEasing {
  // Standard easing - most common curve
  static const Curve standard = Cubic(0.2, 0.0, 0.0, 1.0);
  
  // Emphasized easing - for important transitions
  static const Curve emphasized = Cubic(0.05, 0.7, 0.1, 1.0);
  
  // Decelerated easing - for entering elements
  static const Curve decelerated = Cubic(0.0, 0.0, 0.2, 1.0);
  
  // Accelerated easing - for exiting elements
  static const Curve accelerated = Cubic(0.3, 0.0, 1.0, 1.0);
  
  // Linear easing - for color and opacity changes
  static const Curve linear = Curves.linear;
  
  // Legacy curves for backwards compatibility
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeIn = Curves.easeIn;
}
```

### Advanced Easing Curves
```dart
class M3AdvancedEasing {
  // Spring-based easing
  static Curve spring({
    double mass = 1.0,
    double stiffness = 100.0,
    double damping = 10.0,
  }) {
    return SpringCurve(
      SpringDescription(
        mass: mass,
        stiffness: stiffness,
        damping: damping,
      ),
    );
  }
  
  // Bounce easing
  static const Curve bounce = Curves.bounceOut;
  static const Curve bounceIn = Curves.bounceIn;
  static const Curve bounceInOut = Curves.bounceInOut;
  
  // Elastic easing
  static const Curve elastic = Curves.elasticOut;
  static const Curve elasticIn = Curves.elasticIn;
  static const Curve elasticInOut = Curves.elasticInOut;
  
  // Custom Material curves
  static const Curve overshoot = Cubic(0.34, 1.56, 0.64, 1.0);
  static const Curve anticipate = Cubic(0.36, 0.0, 0.66, -0.56);
  
  // Context-specific curves
  static Curve forEntering(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return emphasized;
      case 'button':
      case 'card':
        return decelerated;
      case 'page':
        return standard;
      default:
        return decelerated;
    }
  }
  
  static Curve forExiting(String elementType) {
    switch (elementType.toLowerCase()) {
      case 'dialog':
      case 'bottomsheet':
        return accelerated;
      case 'button':
      case 'card':
        return standard;
      case 'page':
        return accelerated;
      default:
        return accelerated;
    }
  }
}
```

## Motion Patterns

### Shared Element Transitions
```dart
class M3SharedElementTransition extends StatelessWidget {
  final String tag;
  final Widget child;
  final Duration duration;
  final Curve curve;
  
  const M3SharedElementTransition({
    Key? key,
    required this.tag,
    required this.child,
    this.duration = M3MotionDuration.emphasis,
    this.curve = M3MotionEasing.emphasized,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (context, animation, flightDirection, 
                           fromHeroContext, toHeroContext) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: Tween<double>(
                begin: flightDirection == HeroFlightDirection.push ? 1.0 : 1.1,
                end: flightDirection == HeroFlightDirection.push ? 1.1 : 1.0,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: curve,
              )).value,
              child: Material(
                color: Colors.transparent,
                child: flightDirection == HeroFlightDirection.push 
                    ? toHeroContext.widget 
                    : fromHeroContext.widget,
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
```

### Container Transform
```dart
class M3ContainerTransform extends StatefulWidget {
  final Widget openBuilder;
  final Widget closedBuilder;
  final Duration duration;
  final Curve curve;
  
  const M3ContainerTransform({
    Key? key,
    required this.openBuilder,
    required this.closedBuilder,
    this.duration = M3MotionDuration.long1,
    this.curve = M3MotionEasing.emphasized,
  }) : super(key: key);
  
  @override
  State<M3ContainerTransform> createState() => _M3ContainerTransformState();
}

class _M3ContainerTransformState extends State<M3ContainerTransform>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  
  bool _isOpen = false;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.6, curve: widget.curve),
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 1.0, curve: widget.curve),
    ));
  }
  
  void _toggleContainer() {
    setState(() {
      _isOpen = !_isOpen;
    });
    
    if (_isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleContainer,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Closed state
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: widget.closedBuilder,
                ),
              ),
              // Open state
              if (_controller.value > 0.6)
                Opacity(
                  opacity: (_controller.value - 0.6) / 0.4,
                  child: widget.openBuilder,
                ),
            ],
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

### Fade Through Transition
```dart
class M3FadeThrough extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  
  const M3FadeThrough({
    Key? key,
    required this.child,
    this.duration = M3MotionDuration.medium2,
    this.curve = M3MotionEasing.standard,
  }) : super(key: key);
  
  @override
  State<M3FadeThrough> createState() => _M3FadeThroughState();
}

class _M3FadeThroughState extends State<M3FadeThrough>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _outgoingOpacity;
  late Animation<double> _incomingOpacity;
  late Animation<double> _outgoingScale;
  late Animation<double> _incomingScale;
  
  Widget? _previousChild;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    
    _outgoingOpacity = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.35, curve: widget.curve),
    ));
    
    _incomingOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.65, 1.0, curve: widget.curve),
    ));
    
    _outgoingScale = Tween<double>(
      begin: 1.0,
      end: 0.92,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.35, curve: widget.curve),
    ));
    
    _incomingScale = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.65, 1.0, curve: widget.curve),
    ));
  }
  
  @override
  void didUpdateWidget(M3FadeThrough oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.child.runtimeType != oldWidget.child.runtimeType ||
        widget.child.key != oldWidget.child.key) {
      _previousChild = oldWidget.child;
      _controller.forward(from: 0);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            // Outgoing content
            if (_previousChild != null && _controller.value < 0.35)
              Transform.scale(
                scale: _outgoingScale.value,
                child: Opacity(
                  opacity: _outgoingOpacity.value,
                  child: _previousChild,
                ),
              ),
            // Incoming content
            Transform.scale(
              scale: _incomingScale.value,
              child: Opacity(
                opacity: _incomingOpacity.value,
                child: widget.child,
              ),
            ),
          ],
        );
      },
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

## Motion Utilities

### Animation Builders
```dart
class M3AnimationBuilder {
  static Widget slideUp({
    required Widget child,
    Duration duration = M3MotionDuration.medium2,
    Curve curve = M3MotionEasing.decelerated,
    double offset = 30.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: offset, end: 0.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: child,
    );
  }
  
  static Widget fadeIn({
    required Widget child,
    Duration duration = M3MotionDuration.medium1,
    Curve curve = M3MotionEasing.linear,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
  
  static Widget scaleIn({
    required Widget child,
    Duration duration = M3MotionDuration.medium2,
    Curve curve = M3MotionEasing.emphasized,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
  
  static Widget slideAndFade({
    required Widget child,
    Duration duration = M3MotionDuration.medium3,
    Curve curve = M3MotionEasing.emphasized,
    Offset slideOffset = const Offset(0, 30),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.translate(
          offset: slideOffset * (1 - value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
```

### Staggered Animations
```dart
class M3StaggeredAnimation extends StatefulWidget {
  final List<Widget> children;
  final Duration interval;
  final Duration itemDuration;
  final Curve curve;
  final Axis direction;
  
  const M3StaggeredAnimation({
    Key? key,
    required this.children,
    this.interval = const Duration(milliseconds: 100),
    this.itemDuration = M3MotionDuration.medium2,
    this.curve = M3MotionEasing.decelerated,
    this.direction = Axis.vertical,
  }) : super(key: key);
  
  @override
  State<M3StaggeredAnimation> createState() => _M3StaggeredAnimationState();
}

class _M3StaggeredAnimationState extends State<M3StaggeredAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  
  @override
  void initState() {
    super.initState();
    
    _controllers = List.generate(
      widget.children.length,
      (index) => AnimationController(
        duration: widget.itemDuration,
        vsync: this,
      ),
    );
    
    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ));
    }).toList();
    
    _startStaggeredAnimations();
  }
  
  void _startStaggeredAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      if (i > 0) {
        await Future.delayed(widget.interval);
      }
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return widget.direction == Axis.vertical
        ? Column(
            children: _buildAnimatedChildren(),
          )
        : Row(
            children: _buildAnimatedChildren(),
          );
  }
  
  List<Widget> _buildAnimatedChildren() {
    return List.generate(widget.children.length, (index) {
      return AnimatedBuilder(
        animation: _animations[index],
        builder: (context, child) {
          final slideOffset = widget.direction == Axis.vertical
              ? Offset(0, 30 * (1 - _animations[index].value))
              : Offset(30 * (1 - _animations[index].value), 0);
              
          return Transform.translate(
            offset: slideOffset,
            child: Opacity(
              opacity: _animations[index].value,
              child: widget.children[index],
            ),
          );
        },
      );
    });
  }
  
  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
```

## Page Transitions

### Material Page Transitions
```dart
class M3PageTransitions {
  static PageRouteBuilder slideTransition({
    required Widget page,
    Duration duration = M3MotionDuration.medium4,
    Curve curve = M3MotionEasing.emphasized,
    SlideDirection direction = SlideDirection.fromRight,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: M3MotionDuration.medium2,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset beginOffset;
        switch (direction) {
          case SlideDirection.fromRight:
            beginOffset = const Offset(1.0, 0.0);
            break;
          case SlideDirection.fromLeft:
            beginOffset = const Offset(-1.0, 0.0);
            break;
          case SlideDirection.fromTop:
            beginOffset = const Offset(0.0, -1.0);
            break;
          case SlideDirection.fromBottom:
            beginOffset = const Offset(0.0, 1.0);
            break;
        }
        
        final slideAnimation = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));
        
        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Interval(0.3, 1.0, curve: M3MotionEasing.linear),
        ));
        
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
  
  static PageRouteBuilder fadeTransition({
    required Widget page,
    Duration duration = M3MotionDuration.medium2,
    Curve curve = M3MotionEasing.linear,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: curve,
          ),
          child: child,
        );
      },
    );
  }
  
  static PageRouteBuilder sharedAxisTransition({
    required Widget page,
    Duration duration = M3MotionDuration.long1,
    SharedAxisTransitionType transitionType = SharedAxisTransitionType.horizontal,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: transitionType,
          child: child,
        );
      },
    );
  }
}

enum SlideDirection { fromRight, fromLeft, fromTop, fromBottom }
enum SharedAxisTransitionType { horizontal, vertical, scaled }
```

## Motion Testing

### Animation Testing
```dart
testWidgets('Motion duration is correct', (tester) async {
  const testDuration = M3MotionDuration.medium2;
  
  await tester.pumpWidget(
    MaterialApp(
      home: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: testDuration,
        builder: (context, value, child) {
          return Opacity(opacity: value, child: Container());
        },
      ),
    ),
  );
  
  // Test animation timing
  await tester.pump();
  await tester.pump(testDuration ~/ 2);
  // Verify intermediate state
  await tester.pump(testDuration ~/ 2);
  // Verify final state
});
```

## Best Practices

1. **Purposeful Motion**: Every animation should have a clear purpose
2. **Consistent Timing**: Use the established duration and easing tokens
3. **Respect Accessibility**: Honor user motion preferences
4. **Performance**: Keep animations smooth and efficient
5. **Context Awareness**: Choose appropriate motion for the situation

## Future Enhancements

1. **Physics-Based Animations**: More realistic motion using physics
2. **Gesture-Driven Animations**: Animations that follow user gestures
3. **Adaptive Motion**: Motion that adapts to device capabilities
4. **Advanced Patterns**: More sophisticated transition patterns
5. **Motion Analytics**: Tools to analyze and optimize animations

## References
- [Material Design Motion](https://m3.material.io/styles/motion/overview)
- [Material Motion System](https://m3.material.io/styles/motion/easing-and-duration)
- [Flutter Animations](https://docs.flutter.dev/development/ui/animations)
- [Material Motion Flutter](https://pub.dev/packages/animations)