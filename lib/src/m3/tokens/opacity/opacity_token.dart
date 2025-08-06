part of '../../../../material_design.dart';

abstract final class M3Opacities {
  const M3Opacities._();

  /// Opacity for disabled component content (38%).
  ///
  /// Applied to text, icons, and other content elements when components
  /// are in a disabled state. This opacity ensures disabled content remains
  /// legible while clearly indicating that the element is not interactive.
  ///
  /// The 38% opacity meets accessibility contrast requirements while
  /// providing clear visual indication of disabled state.
  ///
  /// **Ideal use cases**:
  /// - Disabled button text and icons
  /// - Non-interactive form field content
  /// - Disabled menu items and links
  /// - Inactive navigation elements
  /// - Read-only text content
  static const double disabledContent = 0.38;

  /// Opacity for disabled component containers (12%).
  ///
  /// Applied to container backgrounds, borders, and surface elements when
  /// components are disabled. This subtle opacity maintains visual structure
  /// while indicating non-interactive state.
  ///
  /// The 12% opacity provides minimal visual presence without completely
  /// hiding the component structure.
  ///
  /// **Ideal use cases**:
  /// - Disabled button backgrounds
  /// - Inactive form field containers
  /// - Non-interactive card surfaces
  /// - Disabled input field backgrounds
  /// - Inactive component borders
  static const double disabledContainer = 0.12;

  /// Opacity for divider elements (12%).
  ///
  /// Applied to dividers, separators, and other elements that provide
  /// subtle visual separation between content areas. This opacity creates
  /// gentle boundaries without overwhelming the content.
  ///
  /// The 12% opacity ensures dividers are visible but unobtrusive,
  /// maintaining content focus while providing structure.
  ///
  /// **Ideal use cases**:
  /// - List item dividers and separators
  /// - Section boundary lines
  /// - Content area separators
  /// - Menu item dividers
  /// - Layout grid lines
  static const double divider = 0.12;

  /// Opacity for backdrop and scrim elements (50%).
  ///
  /// Applied to modal backdrops, overlay scrims, and other elements that
  /// need to dim background content while maintaining some visibility.
  /// This creates focus on foreground content while preserving context.
  ///
  /// The 50% opacity provides substantial dimming while keeping background
  /// content recognizable and maintaining spatial awareness.
  ///
  /// **Ideal use cases**:
  /// - Modal dialog backdrops
  /// - Overlay scrim layers
  /// - Bottom sheet backgrounds
  /// - Navigation drawer overlays
  /// - Loading screen overlays
  ///
  /// **Note**: This is not a formal M3 token but represents common practice.
  static const double backdrop = 0.5;
}

/// Material Design 3 general opacity tokens for UI elements.
///
/// This enum defines general-purpose opacity values for UI elements like
/// disabled components, dividers, and backdrops, following Material Design 3
/// guidelines. These opacities are typically applied directly to element
/// colors,
/// unlike state layers which are overlaid on top of components.
///
/// The opacity system ensures consistent visual hierarchy and accessibility
/// compliance across different component states and UI element types.
///
/// ## Usage
///
/// ```dart
/// // Get disabled content opacity
/// double opacity = M3OpacityToken.disabledContent.value; // 0.38
///
/// // Apply to disabled text
/// Text(
///   'Disabled Text',
///   style: TextStyle(
///     color: Colors.black.withValues(alpha:
///       M3OpacityToken.disabledContent.value,
///     ),
///   ),
/// )
///
/// // Use for disabled containers
/// Container(
///   decoration: M3BoxDecoration(
///     color: Colors.blue.withValues(alpha:
///       M3OpacityToken.disabledContainer.value,
///     ),
///   ),
/// )
/// ```
///
/// ## Opacity Guidelines
///
/// - **Disabled Content (38%)**: Text and icons in disabled state
/// - **Disabled Container (12%)**: Container backgrounds when disabled
/// - **Divider (12%)**: Subtle separation elements
/// - **Backdrop (50%)**: Modal backdrops and scrims
///
/// Reference: Material Design 3 accessibility and component guidelines
enum M3OpacityToken implements IM3Token<double> {
  /// Opacity for disabled component content (38%).
  ///
  /// Applied to text, icons, and other content elements when components
  /// are in a disabled state. This opacity ensures disabled content remains
  /// legible while clearly indicating that the element is not interactive.
  ///
  /// The 38% opacity meets accessibility contrast requirements while
  /// providing clear visual indication of disabled state.
  ///
  /// **Ideal use cases**:
  /// - Disabled button text and icons
  /// - Non-interactive form field content
  /// - Disabled menu items and links
  /// - Inactive navigation elements
  /// - Read-only text content
  disabledContent(M3Opacities.disabledContent),

  /// Opacity for disabled component containers (12%).
  ///
  /// Applied to container backgrounds, borders, and surface elements when
  /// components are disabled. This subtle opacity maintains visual structure
  /// while indicating non-interactive state.
  ///
  /// The 12% opacity provides minimal visual presence without completely
  /// hiding the component structure.
  ///
  /// **Ideal use cases**:
  /// - Disabled button backgrounds
  /// - Inactive form field containers
  /// - Non-interactive card surfaces
  /// - Disabled input field backgrounds
  /// - Inactive component borders
  disabledContainer(M3Opacities.disabledContainer),

  /// Opacity for divider elements (12%).
  ///
  /// Applied to dividers, separators, and other elements that provide
  /// subtle visual separation between content areas. This opacity creates
  /// gentle boundaries without overwhelming the content.
  ///
  /// The 12% opacity ensures dividers are visible but unobtrusive,
  /// maintaining content focus while providing structure.
  ///
  /// **Ideal use cases**:
  /// - List item dividers and separators
  /// - Section boundary lines
  /// - Content area separators
  /// - Menu item dividers
  /// - Layout grid lines
  divider(M3Opacities.divider),

  /// Opacity for backdrop and scrim elements (50%).
  ///
  /// Applied to modal backdrops, overlay scrims, and other elements that
  /// need to dim background content while maintaining some visibility.
  /// This creates focus on foreground content while preserving context.
  ///
  /// The 50% opacity provides substantial dimming while keeping background
  /// content recognizable and maintaining spatial awareness.
  ///
  /// **Ideal use cases**:
  /// - Modal dialog backdrops
  /// - Overlay scrim layers
  /// - Bottom sheet backgrounds
  /// - Navigation drawer overlays
  /// - Loading screen overlays
  ///
  /// **Note**: This is not a formal M3 token but represents common practice.
  backdrop(M3Opacities.backdrop);

  /// Creates an opacity token with the specified value.
  const M3OpacityToken(this.value);

  /// The opacity value as a decimal (0.0 to 1.0).
  @override
  final double value;
}
