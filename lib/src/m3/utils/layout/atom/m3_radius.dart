part of '../../../../../../material_design.dart';

/// Custom Radius that enforces Material Design 3 tokens.
class M3Radius extends Radius {
  /// Creates uniform border radius from a shape token.
  const M3Radius.circular(M3CornersToken corner)
      : super.circular(
          corner == M3CornersToken.none
              ? M3Corners.none
              : corner == M3CornersToken.extraSmall
                  ? M3Corners.extraSmall
                  : corner == M3CornersToken.small
                      ? M3Corners.small
                      : corner == M3CornersToken.medium
                          ? M3Corners.medium
                          : corner == M3CornersToken.large
                              ? M3Corners.large
                              : corner == M3CornersToken.largeIncreased
                                  ? M3Corners.largeIncreased
                                  : corner == M3CornersToken.extraLarge
                                      ? M3Corners.extraLarge
                                      : corner ==
                                              M3CornersToken.extraLargeIncreased
                                          ? M3Corners.extraLargeIncreased
                                          : corner ==
                                                  M3CornersToken.extraExtraLarge
                                              ? M3Corners.extraExtraLarge
                                              : M3Corners.full,
        );

  static const M3Radius zero = M3Radius.circular(M3CornersToken.none);
}
