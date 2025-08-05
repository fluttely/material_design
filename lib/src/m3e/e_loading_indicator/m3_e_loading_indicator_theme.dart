part of '../../../material_design.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

/// Defines the visual properties of [M3ELoadingIndicator] widgets.
///
/// Used by [LoadingIndicatorTheme] to control the visual properties of
/// loading indicators in a widget subtree.
///
/// To obtain this configuration, use [LoadingIndicatorTheme.of] to access
/// the closest ancestor [LoadingIndicatorTheme] of the current [BuildContext].
///
/// See also:
///
///  * [LoadingIndicatorTheme], an [InheritedWidget] that propagates the
///    theme down its subtree.
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

/// An inherited widget that defines the configuration for [M3ELoadingIndicator]s
/// in this widget's subtree.
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
/// const LoadingIndicatorTheme(
///   data: LoadingIndicatorThemeData(
///     activeIndicatorColor: Colors.red,
///   ),
///   child: LoadingIndicator(),
/// )
/// ```
/// {@end-tool}
class LoadingIndicatorTheme extends InheritedTheme {
  /// Creates a theme that controls the configurations for [M3ELoadingIndicator]
  /// widgets.
  const LoadingIndicatorTheme({
    required this.data,
    required super.child,
    super.key,
  });

  /// The properties for descendant [M3ELoadingIndicator] widgets.
  final M3ELoadingIndicatorThemeData data;

  /// Returns the [data] from the closest [LoadingIndicatorTheme] ancestor. If
  /// there is no ancestor, it returns null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// LoadingIndicatorThemeData? theme = LoadingIndicatorTheme.of(context);
  /// ```
  static M3ELoadingIndicatorThemeData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoadingIndicatorTheme>()
        ?.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return LoadingIndicatorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(LoadingIndicatorTheme oldWidget) =>
      data != oldWidget.data;
}
