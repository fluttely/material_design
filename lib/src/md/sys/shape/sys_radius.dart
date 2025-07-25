// ============================================================================
// lib/src/sys/shape/sys_radius.dart
/// Material Design 3 Shape Radius Tokens
/// Reference: https://m3.material.io/styles/shape/shape-scale-tokens
enum SysRadius {
  none(0),
  extraSmall(4),
  small(8),
  medium(12),
  large(16),
  extraLarge(28),
  full(999);

  final double value;
  const SysRadius(this.value);
}
