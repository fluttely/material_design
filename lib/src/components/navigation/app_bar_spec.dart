import 'package:flutter/material.dart';

/// Variants for Material Design 3 Top App Bar
enum TopAppBarVariant {
  center,
  small,
  medium,
  large,
}

/// Specification for Material Design 3 Top App Bar
@immutable
class TopAppBarSpec {
  const TopAppBarSpec({
    required this.variant,
    required this.height,
    required this.padding,
    required this.titleScale,
    required this.titleAlignment,
    required this.scrollUnder,
  });
  final TopAppBarVariant variant;
  final double height;
  final EdgeInsets padding;
  final double titleScale;
  final Alignment titleAlignment;
  final bool scrollUnder;

  /// Predefined specs for each variant
  static const TopAppBarSpec center = TopAppBarSpec(
    variant: TopAppBarVariant.center,
    height: 64,
    padding: EdgeInsets.symmetric(horizontal: 16),
    titleScale: 1,
    titleAlignment: Alignment.center,
    scrollUnder: false,
  );

  static const TopAppBarSpec small = TopAppBarSpec(
    variant: TopAppBarVariant.small,
    height: 64,
    padding: EdgeInsets.symmetric(horizontal: 16),
    titleScale: 1,
    titleAlignment: Alignment.centerLeft,
    scrollUnder: true,
  );

  static const TopAppBarSpec medium = TopAppBarSpec(
    variant: TopAppBarVariant.medium,
    height: 112,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    titleScale: 1.15,
    titleAlignment: Alignment.centerLeft,
    scrollUnder: true,
  );

  static const TopAppBarSpec large = TopAppBarSpec(
    variant: TopAppBarVariant.large,
    height: 152,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    titleScale: 1.25,
    titleAlignment: Alignment.centerLeft,
    scrollUnder: true,
  );
}
