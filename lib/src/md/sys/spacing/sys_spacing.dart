// ============================================================================
// lib/src/sys/spacing/sys_spacing.dart
/// Material Design 3 Spacing Tokens
/// Reference: https://m3.material.io/foundations/layout/applying-layout/spacing
enum SysSpacing {
  none(0),
  extraSmall(4),
  small(8),
  medium(16),
  large(24),
  extraLarge(32);

  final double value;
  const SysSpacing(this.value);
}
