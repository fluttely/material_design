# Material Design 3 - Accessibility

## Overview
Accessibility in Material Design ensures that products are usable by everyone, including people with disabilities. This includes considerations for visual, motor, auditory, and cognitive accessibility.

## Current Implementation Status

### ✅ Implemented Features

#### Color Accessibility
- **Tonal Surface Colors** (`m3_tonal_color.dart`)
  - Elevation-based surface tinting maintains color contrast
  - Integrates with Flutter's accessibility contrast checking

#### Visual Density
- **Adaptive Density** (`m3_visual_density.dart`)
  - Supports different density levels for better touch accessibility
  - Allows customization for user preferences

### 🔄 Missing/Incomplete Features

#### Color Contrast
- **Contrast Ratios**: Automated contrast ratio validation
- **High Contrast Mode**: Support for system high contrast settings
- **Color Blindness**: Color palette adjustments for color vision deficiencies

#### Typography Accessibility
- **Dynamic Type**: Support for system font size preferences
- **Reading Accessibility**: Enhanced line height and spacing for dyslexia
- **Font Weight Adjustments**: Heavier weights for low vision users

#### Touch and Interaction
- **Minimum Touch Targets**: 48dp minimum touch target enforcement
- **Touch Target Spacing**: Adequate spacing between interactive elements
- **Gesture Alternatives**: Alternative input methods for complex gestures

#### Focus Management
- **Focus Indicators**: Clear visual focus indicators
- **Focus Order**: Logical tab navigation order
- **Focus Restoration**: Proper focus management in dynamic content

## Accessibility Guidelines

### Color and Contrast

#### Minimum Contrast Ratios
- **Normal Text**: 4.5:1 ratio against background
- **Large Text**: 3:1 ratio for text 18pt+ or 14pt+ bold
- **UI Components**: 3:1 ratio for visual indicators
- **Focus Indicators**: 3:1 ratio against adjacent colors

#### Implementation
```dart
class M3AccessibilityColors {
  // High contrast color pairs
  static const Color highContrastPrimary = Color(0xFF000000);
  static const Color highContrastOnPrimary = Color(0xFFFFFFFF);
  
  // Minimum contrast validations
  static bool hasMinimumContrast(Color foreground, Color background) {
    final luminance1 = foreground.computeLuminance();
    final luminance2 = background.computeLuminance();
    final contrast = (max(luminance1, luminance2) + 0.05) / 
                    (min(luminance1, luminance2) + 0.05);
    return contrast >= 4.5;
  }
}
```

### Typography Accessibility

#### Dynamic Type Support
```dart
class M3AccessibleTypography {
  static TextStyle adaptiveTextStyle(TextStyle base, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textScaleFactor = mediaQuery.textScaleFactor;
    
    return base.copyWith(
      fontSize: base.fontSize! * textScaleFactor,
      height: base.height != null ? base.height! / textScaleFactor : null,
    );
  }
}
```

#### Reading Accessibility
```dart
class M3ReadabilitySettings {
  static const double enhancedLineHeight = 1.6;
  static const double enhancedLetterSpacing = 0.12;
  static const FontWeight enhancedFontWeight = FontWeight.w500;
  
  static TextStyle makeReadable(TextStyle style) {
    return style.copyWith(
      height: enhancedLineHeight,
      letterSpacing: enhancedLetterSpacing,
      fontWeight: enhancedFontWeight,
    );
  }
}
```

### Touch Accessibility

#### Minimum Touch Targets
```dart
class M3TouchTargets {
  static const double minimumTouchTarget = 48.0;
  static const double recommendedTouchTarget = 56.0;
  static const double minimumSpacing = 8.0;
  
  static Widget ensureMinimumTouchTarget({
    required Widget child,
    double minSize = minimumTouchTarget,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
      ),
      child: child,
    );
  }
}
```

### Focus Management

#### Focus Indicators
```dart
class M3FocusIndicators {
  static const double focusIndicatorWidth = 2.0;
  static const Color focusIndicatorColor = Color(0xFF1976D2);
  
  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: focusIndicatorColor,
      width: focusIndicatorWidth,
    ),
  );
  
  static BoxDecoration focusDecoration = BoxDecoration(
    border: Border.all(
      color: focusIndicatorColor,
      width: focusIndicatorWidth,
    ),
  );
}
```

#### Focus Order Management
```dart
class M3FocusOrder {
  static List<FocusNode> createOrderedFocusNodes(int count) {
    return List.generate(
      count,
      (index) => FocusNode(debugLabel: 'focus_$index'),
    );
  }
  
  static void setupFocusOrder(List<FocusNode> nodes) {
    for (int i = 0; i < nodes.length - 1; i++) {
      nodes[i].nextFocus = nodes[i + 1];
    }
  }
}
```

## Screen Reader Support

### Semantic Labels
```dart
class M3Semantics {
  static Widget accessibleButton({
    required Widget child,
    required VoidCallback onPressed,
    required String semanticLabel,
    String? hint,
  }) {
    return Semantics(
      label: semanticLabel,
      hint: hint,
      button: true,
      child: InkWell(
        onTap: onPressed,
        child: child,
      ),
    );
  }
  
  static Widget accessibleImage({
    required Widget image,
    required String alt,
  }) {
    return Semantics(
      label: alt,
      image: true,
      child: image,
    );
  }
}
```

### Live Regions
```dart
class M3LiveRegions {
  static Widget announceChanges({
    required Widget child,
    required String announcement,
    bool assertive = false,
  }) {
    return Semantics(
      liveRegion: true,
      child: child,
    );
  }
}
```

## Platform-Specific Accessibility

### iOS Accessibility
```dart
class M3iOSAccessibility {
  static const double iOSMinimumTouchTarget = 44.0;
  
  static bool get isVoiceOverRunning {
    return MediaQuery.of(context).accessibleNavigation;
  }
  
  static double get preferredContentSize {
    return MediaQuery.of(context).textScaleFactor;
  }
}
```

### Android Accessibility
```dart
class M3AndroidAccessibility {
  static bool get isTalkBackEnabled {
    return MediaQuery.of(context).accessibleNavigation;
  }
  
  static bool get isHighTextContrastEnabled {
    return MediaQuery.of(context).highContrast;
  }
}
```

## Testing Accessibility

### Automated Testing
```dart
testWidgets('Button meets accessibility requirements', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: M3Button(
        onPressed: () {},
        child: Text('Test Button'),
      ),
    ),
  );
  
  // Test minimum touch target
  final buttonSize = tester.getSize(find.byType(M3Button));
  expect(buttonSize.width, greaterThanOrEqualTo(48.0));
  expect(buttonSize.height, greaterThanOrEqualTo(48.0));
  
  // Test semantic properties
  expect(
    tester.getSemantics(find.byType(M3Button)),
    matchesSemantics(
      isButton: true,
      hasEnabledState: true,
      isEnabled: true,
    ),
  );
});
```

### Manual Testing Checklist
- [ ] Navigation works with keyboard only
- [ ] All interactive elements have focus indicators
- [ ] Color contrast meets WCAG AA standards
- [ ] Touch targets are at least 48dp
- [ ] Screen reader announces content correctly
- [ ] High contrast mode is supported
- [ ] Text scales properly with system settings

## Best Practices

### Design Considerations
1. **Color**: Never rely solely on color to convey information
2. **Typography**: Use sufficient contrast and scalable fonts
3. **Layout**: Provide adequate spacing and clear visual hierarchy
4. **Interaction**: Ensure all functionality is keyboard accessible

### Implementation Guidelines
1. **Use Semantic Widgets**: Prefer Flutter's semantic widgets
2. **Test Early**: Include accessibility testing in development workflow
3. **Follow Platform Guidelines**: Respect platform-specific accessibility features
4. **User Testing**: Include users with disabilities in testing process

## Future Enhancements

1. **Accessibility Scanner**: Automated accessibility checking tool
2. **High Contrast Themes**: Pre-built high contrast color schemes
3. **Voice Navigation**: Enhanced voice control support
4. **Accessibility Settings**: Built-in accessibility preference management
5. **Documentation Generator**: Automated accessibility documentation

## References
- [Material Design Accessibility](https://m3.material.io/foundations/accessible-design)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Flutter Accessibility](https://docs.flutter.dev/development/accessibility-and-localization/accessibility)
- [iOS Accessibility](https://developer.apple.com/accessibility/)
- [Android Accessibility](https://developer.android.com/guide/topics/ui/accessibility)