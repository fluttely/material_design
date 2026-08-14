part of '../../expressive.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

/// Defines the visual properties of [M3ELoadingIndicator] widgets.
///
/// Used by [M3ELoadingIndicatorTheme] to control the visual properties of
/// loading indicators in a widget subtree.
///
/// To obtain this configuration, use [M3ELoadingIndicatorTheme.of] to access
/// the closest ancestor [M3ELoadingIndicatorTheme] of the current
/// [BuildContext].
///
/// See also:
///
///  * [M3ELoadingIndicatorTheme], an [InheritedWidget] that propagates the
///    theme down its subtree.
///
/// See <https://m3.material.io/components/loading-indicator/overview>.
@experimental
@immutable
class M3ELoadingIndicatorThemeData with Diagnosticable {
  /// Creates the set of properties used to configure [M3ELoadingIndicator]
  /// widgets.
  const M3ELoadingIndicatorThemeData({
    this.activeIndicatorColor,
    this.containerColor,
  });

  /// The color of the [M3ELoadingIndicator]'s active indicator.
  ///
  /// If null, the active indicator color will default to:
  ///
  /// - [ColorScheme.primary] for non-contained indicators.
  /// - [ColorScheme.onPrimaryContainer] for contained indicators.
  final Color? activeIndicatorColor;

  /// The color of the [M3ELoadingIndicator]'s container.
  ///
  /// If null, then the ambient theme's [ColorScheme.primaryContainer]
  /// will be used to draw the container.
  final Color? containerColor;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  M3ELoadingIndicatorThemeData copyWith({
    Color? activeIndicatorColor,
    Color? containerColor,
  }) {
    return M3ELoadingIndicatorThemeData(
      activeIndicatorColor: activeIndicatorColor ?? this.activeIndicatorColor,
      containerColor: containerColor ?? this.containerColor,
    );
  }

  /// Linearly interpolate between two loading indicator themes.
  ///
  /// If both arguments are null, then null is returned.
  static M3ELoadingIndicatorThemeData? lerp(
    M3ELoadingIndicatorThemeData? a,
    M3ELoadingIndicatorThemeData? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    return M3ELoadingIndicatorThemeData(
      activeIndicatorColor: Color.lerp(
        a?.activeIndicatorColor,
        b?.activeIndicatorColor,
        t,
      ),
      containerColor: Color.lerp(a?.containerColor, b?.containerColor, t),
    );
  }

  @override
  int get hashCode => Object.hash(activeIndicatorColor, containerColor);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is M3ELoadingIndicatorThemeData &&
        other.activeIndicatorColor == activeIndicatorColor &&
        other.containerColor == containerColor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ColorProperty(
          'activeIndicatorColor',
          activeIndicatorColor,
          defaultValue: null,
        ),
      )
      ..add(
        ColorProperty('containerColor', containerColor, defaultValue: null),
      );
  }
}

/// An inherited widget that defines the configuration for
/// [M3ELoadingIndicator]s in this widget's subtree.
///
/// Values specified here are used for [M3ELoadingIndicator] properties that are
/// not given an explicit non-null value.
///
/// {@tool snippet}
///
/// Here is an example of a loading indicator theme that applies a red active
/// indicator color.
///
/// ```dart
/// const M3ELoadingIndicatorTheme(
///   data: M3ELoadingIndicatorThemeData(
///     activeIndicatorColor: Colors.red,
///   ),
///   child: M3ELoadingIndicator(),
/// )
/// ```
/// {@end-tool}
///
/// See <https://m3.material.io/components/loading-indicator/overview>.
@experimental
class M3ELoadingIndicatorTheme extends InheritedTheme {
  /// Creates a theme that controls the configurations for [M3ELoadingIndicator]
  /// widgets.
  const M3ELoadingIndicatorTheme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The properties for descendant [M3ELoadingIndicator] widgets.
  final M3ELoadingIndicatorThemeData data;

  /// Returns the [data] from the closest [M3ELoadingIndicatorTheme] ancestor.
  /// If there is no ancestor, it returns null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// M3ELoadingIndicatorThemeData? theme = M3ELoadingIndicatorTheme.of(context);
  /// ```
  static M3ELoadingIndicatorThemeData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<M3ELoadingIndicatorTheme>()
        ?.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return M3ELoadingIndicatorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(M3ELoadingIndicatorTheme oldWidget) =>
      data != oldWidget.data;
}
