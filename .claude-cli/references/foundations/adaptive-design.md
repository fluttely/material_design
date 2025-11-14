# Material Design 3 - Adaptive Design

## Overview
Adaptive design in Material Design 3 ensures that interfaces work seamlessly across different screen sizes, input methods, and device capabilities. This includes responsive layouts, navigation patterns, and component adaptations.

## Current Implementation Status

### ✅ Implemented Features

#### Breakpoints
- **Screen Breakpoints** (`m3_breakpoint.dart`)
  - Standardized breakpoint system for responsive design
  - Support for compact, medium, and expanded screen sizes

#### Visual Density
- **Density Adaptation** (`m3_visual_density.dart`)
  - Adaptive component density for different platforms
  - Support for comfortable, compact, and standard densities

### 🔄 Missing/Incomplete Features

#### Navigation Adaptations
- **Navigation Rail**: For medium screen widths
- **Navigation Drawer**: For narrow screens with many destinations
- **Bottom Navigation**: For mobile-first experiences
- **Top App Bar Variations**: Different styles for different screen sizes

#### Layout Adaptations
- **Grid Systems**: Responsive grid layouts
- **Canonical Layouts**: Standard layout patterns for different screen sizes
- **Fold-Aware Layouts**: Support for foldable devices

#### Component Adaptations
- **Button Sizes**: Different button sizes for different contexts
- **Dialog Adaptations**: Full-screen dialogs on mobile, modal on desktop
- **Sheet Adaptations**: Bottom sheets vs side sheets

## Breakpoint System

### Standard Breakpoints
```dart
abstract class M3Breakpoints {
  // Window size classes
  static const double compact = 0;      // 0-599dp
  static const double medium = 600;     // 600-839dp
  static const double expanded = 840;   // 840dp+
  
  // Detailed breakpoints
  static const double xSmall = 0;       // 0-359dp
  static const double small = 360;      // 360-599dp
  static const double mediumSmall = 600; // 600-719dp
  static const double mediumLarge = 720; // 720-839dp
  static const double large = 840;      // 840-1199dp
  static const double xLarge = 1200;    // 1200dp+
}
```

### Responsive Utilities
```dart
class M3ResponsiveUtils {
  static WindowSizeClass getWindowSizeClass(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width < M3Breakpoints.medium) {
      return WindowSizeClass.compact;
    } else if (width < M3Breakpoints.expanded) {
      return WindowSizeClass.medium;
    } else {
      return WindowSizeClass.expanded;
    }
  }
  
  static bool isCompact(BuildContext context) => 
      getWindowSizeClass(context) == WindowSizeClass.compact;
      
  static bool isMedium(BuildContext context) => 
      getWindowSizeClass(context) == WindowSizeClass.medium;
      
  static bool isExpanded(BuildContext context) => 
      getWindowSizeClass(context) == WindowSizeClass.expanded;
}

enum WindowSizeClass { compact, medium, expanded }
```

## Adaptive Navigation

### Navigation Strategy
```dart
class M3AdaptiveNavigation extends StatelessWidget {
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  
  const M3AdaptiveNavigation({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final windowSize = M3ResponsiveUtils.getWindowSizeClass(context);
    
    switch (windowSize) {
      case WindowSizeClass.compact:
        return NavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        );
        
      case WindowSizeClass.medium:
        return NavigationRail(
          destinations: destinations.map((d) => NavigationRailDestination(
            icon: d.icon,
            selectedIcon: d.selectedIcon,
            label: Text(d.label),
          )).toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        );
        
      case WindowSizeClass.expanded:
        return NavigationDrawer(
          children: destinations.asMap().entries.map((entry) {
            return NavigationDrawerDestination(
              icon: entry.value.icon,
              selectedIcon: entry.value.selectedIcon,
              label: Text(entry.value.label),
            );
          }).toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
        );
    }
  }
}
```

### Responsive App Bar
```dart
class M3AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showMenuButton;
  
  const M3AdaptiveAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showMenuButton = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final isCompact = M3ResponsiveUtils.isCompact(context);
    
    return AppBar(
      title: Text(title),
      centerTitle: isCompact,
      actions: actions,
      leading: showMenuButton && !isCompact 
          ? IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
          : null,
      elevation: isCompact ? 0 : 1,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
```

## Adaptive Layouts

### Responsive Grid
```dart
class M3ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  
  const M3ResponsiveGrid({
    Key? key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final windowSize = M3ResponsiveUtils.getWindowSizeClass(context);
    
    int columns;
    switch (windowSize) {
      case WindowSizeClass.compact:
        columns = 1;
        break;
      case WindowSizeClass.medium:
        columns = 2;
        break;
      case WindowSizeClass.expanded:
        columns = 3;
        break;
    }
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}
```

### Adaptive Container
```dart
class M3AdaptiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  
  const M3AdaptiveContainer({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final windowSize = M3ResponsiveUtils.getWindowSizeClass(context);
    
    double horizontalPadding;
    switch (windowSize) {
      case WindowSizeClass.compact:
        horizontalPadding = 16.0;
        break;
      case WindowSizeClass.medium:
        horizontalPadding = 24.0;
        break;
      case WindowSizeClass.expanded:
        horizontalPadding = 32.0;
        break;
    }
    
    return Container(
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 16.0,
      ),
      child: child,
    );
  }
}
```

## Adaptive Components

### Dialog Adaptations
```dart
class M3AdaptiveDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;
  
  const M3AdaptiveDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final isCompact = M3ResponsiveUtils.isCompact(context);
    
    if (isCompact) {
      // Full-screen dialog for compact screens
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: actions,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: content,
        ),
      );
    } else {
      // Modal dialog for larger screens
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      );
    }
  }
  
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
  }) {
    final isCompact = M3ResponsiveUtils.isCompact(context);
    
    if (isCompact) {
      return Navigator.of(context).push<T>(
        MaterialPageRoute(
          builder: (context) => M3AdaptiveDialog(
            title: title,
            content: content,
            actions: actions,
          ),
          fullscreenDialog: true,
        ),
      );
    } else {
      return showDialog<T>(
        context: context,
        builder: (context) => M3AdaptiveDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
    }
  }
}
```

### Adaptive Sheets
```dart
class M3AdaptiveSheet extends StatelessWidget {
  final Widget child;
  final String? title;
  
  const M3AdaptiveSheet({
    Key? key,
    required this.child,
    this.title,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final isCompact = M3ResponsiveUtils.isCompact(context);
    
    if (isCompact) {
      // Bottom sheet for compact screens
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                if (title != null) ...[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      title!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Divider(height: 1),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Side sheet for larger screens
      return Container(
        width: 320,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Divider(height: 1),
            ],
            Expanded(
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ],
        ),
      );
    }
  }
}
```

## Input Method Adaptations

### Touch vs Mouse Adaptations
```dart
class M3InputAdaptations {
  static double getMinimumTouchTarget(BuildContext context) {
    // Detect primary input method
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    final platform = Theme.of(context).platform;
    
    if (platform == TargetPlatform.iOS || 
        platform == TargetPlatform.android) {
      return 48.0; // Touch-optimized
    } else {
      return 32.0; // Mouse-optimized
    }
  }
  
  static EdgeInsetsGeometry getAdaptivePadding(BuildContext context) {
    final platform = Theme.of(context).platform;
    
    if (platform == TargetPlatform.iOS || 
        platform == TargetPlatform.android) {
      return EdgeInsets.all(16.0); // Touch-friendly spacing
    } else {
      return EdgeInsets.all(8.0); // Dense spacing for mouse
    }
  }
}
```

## Fold-Aware Design

### Foldable Device Support
```dart
class M3FoldableLayout extends StatelessWidget {
  final Widget primaryContent;
  final Widget? secondaryContent;
  
  const M3FoldableLayout({
    Key? key,
    required this.primaryContent,
    this.secondaryContent,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // This would integrate with foldable device APIs
    // when available in Flutter
    
    final mediaQuery = MediaQuery.of(context);
    final isWideScreen = mediaQuery.size.width > 600;
    final aspectRatio = mediaQuery.size.width / mediaQuery.size.height;
    
    // Detect potential fold (very wide aspect ratio)
    final isPotentiallyFolded = aspectRatio > 1.8;
    
    if (isPotentiallyFolded && secondaryContent != null) {
      return Row(
        children: [
          Expanded(child: primaryContent),
          VerticalDivider(width: 1),
          Expanded(child: secondaryContent!),
        ],
      );
    } else {
      return primaryContent;
    }
  }
}
```

## Testing Adaptive Design

### Responsive Testing
```dart
testWidgets('Adaptive navigation works across screen sizes', (tester) async {
  // Test compact screen
  tester.binding.window.physicalSizeTestValue = Size(360, 640);
  await tester.pumpWidget(MyApp());
  expect(find.byType(NavigationBar), findsOneWidget);
  
  // Test medium screen
  tester.binding.window.physicalSizeTestValue = Size(720, 1024);
  await tester.pumpWidget(MyApp());
  expect(find.byType(NavigationRail), findsOneWidget);
  
  // Test expanded screen
  tester.binding.window.physicalSizeTestValue = Size(1200, 800);
  await tester.pumpWidget(MyApp());
  expect(find.byType(NavigationDrawer), findsOneWidget);
});
```

## Best Practices

1. **Progressive Enhancement**: Start with mobile-first design
2. **Content Priority**: Show most important content first on small screens
3. **Touch Targets**: Ensure adequate touch target sizes
4. **Performance**: Optimize for different device capabilities
5. **Platform Conventions**: Follow platform-specific patterns

## Future Enhancements

1. **Automatic Layout Detection**: AI-powered layout optimization
2. **Advanced Fold Support**: Deep integration with foldable APIs
3. **Performance Monitoring**: Adaptive performance based on device capabilities
4. **User Preference Learning**: Adaptive layouts based on user behavior
5. **Advanced Responsive Utilities**: More sophisticated breakpoint management

## References
- [Material Design Adaptive Design](https://m3.material.io/foundations/adaptive-design)
- [Flutter Responsive Design](https://docs.flutter.dev/development/ui/layout/adaptive-responsive)
- [Material Design Layout](https://m3.material.io/foundations/layout)
- [Window Size Classes](https://developer.android.com/guide/topics/large-screens/support-different-screen-sizes)