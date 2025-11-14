/// Core design token definitions for the Material Toolkit package.
library;

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:material_toolkit/material_toolkit.dart';

part 'animation/duration_tokens.dart';
part 'core/extended_values.dart';
part 'core/material_dimensions.dart';
part 'core/material_timings.dart';
part 'geometry/border_width_tokens.dart';
part 'geometry/breakpoint_tokens.dart';
part 'geometry/elevation_tokens.dart';
part 'geometry/form_factor.dart';
part 'geometry/icon_size_tokens.dart';
part 'geometry/layout_grid_tokens.dart';
part 'geometry/redius_tokens.dart';
part 'geometry/spacing_tokens.dart';
part 'painting/box_shadows_tokens.dart';
part 'painting/opacity_tokens.dart';
part 'painting/text_shadow_tokens.dart';
part 'painting/z_index_tokens.dart';

extension DesignTokensContextExtension on BuildContext {
  DesignTokens get tokens {
    final tokens = Theme.of(this).extension<DesignTokens>();
    assert(tokens != null, 'DesignTokens not found in Theme extensions');
    return tokens!;
  }
}

extension DesignTokensThemeExtension on ThemeData {
  DesignTokens get tokens {
    final tokens = extension<DesignTokens>();
    assert(tokens != null, 'DesignTokens not found in Theme extensions');
    return tokens!;
  }
}

class DesignProvider extends InheritedWidget {
  const DesignProvider({
    required super.child,
    required this.tokens,
    super.key,
  });

  static DesignTokens of(BuildContext context) {
    final tokens = context
        .dependOnInheritedWidgetOfExactType<DesignProvider>()
        ?.tokens;

    assert(tokens != null, 'No DesignTokens found in context');

    return tokens!;
  }

  static DesignTokens? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DesignProvider>()?.tokens;
  }

  final DesignTokens tokens;

  @override
  bool updateShouldNotify(DesignProvider oldWidget) =>
      tokens != oldWidget.tokens;
}

class DesignTokens extends ThemeExtension<DesignTokens> {
  DesignTokens({
    this.boxShadows = const BoxShadowTokens(),
    this.borderWidths = const BorderWidthTokens(),
    this.breakpoints = const BreakpointTokens(),
    this.durations = const DurationTokens(),
    this.elevations = const ElevationTokens(),
    this.formFactor = FormFactor.medium,
    this.iconSizes = const IconSizeTokens(),
    this.layoutGrid = const LayoutGridTokens(),
    this.opacities = const OpacityTokens(),
    this.radii = const RadiusTokens(),
    this.spacings = const SpacingTokens(),
    this.textShadows = const TextShadowTokens(),
    this.zIndexes = const ZIndexTokens(),
  }) : googleFonts = const GoogleFontsResolver();

  factory DesignTokens.material({Map<String, dynamic>? overrides}) {
    var tokens = DesignTokens();
    if (overrides != null) {
      tokens = tokens.copyWith(
        boxShadows: overrides['boxShadows'] != null
            ? BoxShadowTokens.fromMap(
                overrides['boxShadows'] as Map<String, dynamic>,
              )
            : null,
        breakpoints: overrides['breakpoints'] != null
            ? BreakpointTokens.fromMap(
                overrides['breakpoints'] as Map<String, dynamic>,
              )
            : null,
        durations: overrides['durations'] != null
            ? DurationTokens.fromMap(
                overrides['durations'] as Map<String, dynamic>,
              )
            : null,
        elevations: overrides['elevations'] != null
            ? ElevationTokens.fromMap(
                overrides['elevations'] as Map<String, dynamic>,
              )
            : null,
        iconSizes: overrides['iconSizes'] != null
            ? IconSizeTokens.fromMap(
                overrides['iconSizes'] as Map<String, dynamic>,
              )
            : null,
        radii: overrides['radii'] != null
            ? RadiusTokens.fromMap(overrides['radii'] as Map<String, dynamic>)
            : null,
        spacings: overrides['spacings'] != null
            ? SpacingTokens.fromMap(
                overrides['spacings'] as Map<String, dynamic>,
              )
            : null,
        textShadows: overrides['textShadows'] != null
            ? TextShadowTokens.fromMap(
                overrides['textShadows'] as Map<String, dynamic>,
              )
            : null,
      );
    }
    return tokens;
  }

  factory DesignTokens.fromMap(Map<String, dynamic> map) {
    return DesignTokens.material(overrides: map);
  }

  factory DesignTokens.fromJson(String json) {
    return DesignTokens.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  final BoxShadowTokens boxShadows;
  final BorderWidthTokens borderWidths;
  final BreakpointTokens breakpoints;
  final DurationTokens durations;
  final ElevationTokens elevations;
  final FormFactor formFactor;
  final IconSizeTokens iconSizes;
  final LayoutGridTokens layoutGrid;
  final OpacityTokens opacities;
  final RadiusTokens radii;
  final SpacingTokens spacings;
  final TextShadowTokens textShadows;
  final ZIndexTokens zIndexes;
  final GoogleFontsResolver googleFonts;

  /// Spacings
  late final gap = GapResolver(spacings);
  late final edgeInsets = EdgeInsetsResolver(spacings);
  late final padding = PaddingResolver(edgeInsets);

  /// Radii
  late final radius = RadiusResolver(radii);
  late final borderRadius = BorderRadiusResolver(radii);
  late final shape = ShapeResolver(radii);
  late final inputBorder = InputBorderResolver(radii);

  @override
  ThemeExtension<DesignTokens> lerp(
    ThemeExtension<DesignTokens>? other,
    double t,
  ) {
    if (other is! DesignTokens) {
      return this;
    } else {
      return DesignTokens(
        boxShadows: boxShadows,
        breakpoints: breakpoints,
        durations: durations,
        elevations: elevations,
        formFactor: formFactor,
        iconSizes: iconSizes,
        radii: radii,
        spacings: spacings,
        textShadows: textShadows,
      );
    }
  }

  @override
  DesignTokens copyWith({
    BoxShadowTokens? boxShadows,
    BreakpointTokens? breakpoints,
    DurationTokens? durations,
    ElevationTokens? elevations,
    FormFactor? formFactor,
    IconSizeTokens? iconSizes,
    RadiusTokens? radii,
    SpacingTokens? spacings,
    TextShadowTokens? textShadows,
  }) {
    return DesignTokens(
      boxShadows: boxShadows ?? this.boxShadows,
      breakpoints: breakpoints ?? this.breakpoints,
      durations: durations ?? this.durations,
      elevations: elevations ?? this.elevations,
      formFactor: formFactor ?? this.formFactor,
      iconSizes: iconSizes ?? this.iconSizes,
      radii: radii ?? this.radii,
      spacings: spacings ?? this.spacings,
      textShadows: textShadows ?? this.textShadows,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignTokens &&
          boxShadows == other.boxShadows &&
          breakpoints == other.breakpoints &&
          durations == other.durations &&
          elevations == other.elevations &&
          formFactor == other.formFactor &&
          iconSizes == other.iconSizes &&
          radii == other.radii &&
          spacings == other.spacings &&
          textShadows == other.textShadows &&
          gap == other.gap &&
          edgeInsets == other.edgeInsets &&
          padding == other.padding &&
          radius == other.radius &&
          borderRadius == other.borderRadius &&
          shape == other.shape &&
          inputBorder == other.inputBorder &&
          googleFonts == other.googleFonts;

  @override
  int get hashCode =>
      boxShadows.hashCode ^
      breakpoints.hashCode ^
      durations.hashCode ^
      elevations.hashCode ^
      formFactor.hashCode ^
      iconSizes.hashCode ^
      radii.hashCode ^
      spacings.hashCode ^
      textShadows.hashCode ^
      gap.hashCode ^
      edgeInsets.hashCode ^
      padding.hashCode ^
      radius.hashCode ^
      borderRadius.hashCode ^
      shape.hashCode ^
      inputBorder.hashCode ^
      googleFonts.hashCode;

  @override
  String toString() =>
      '''
    DesignTokensTokens(
      boxShadows: $boxShadows,
      breakpoints: $breakpoints,
      durations: $durations,
      elevations: $elevations,
      formFactor: $formFactor,
      iconSizes: $iconSizes,
      radii: $radii,
      spacings: $spacings,
      textShadows: $textShadows,
      gaps: $gap,
      edgeInsets: $edgeInsets,
      padding: $padding,
      radius: $radius,
      borderRadius: $borderRadius,
      shape: $shape,
      inputBorder: $inputBorder,
      googleFonts: $googleFonts,
    )
  ''';
}
