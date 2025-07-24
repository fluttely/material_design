import 'package:material_design/material_design.dart';

/// Material Design 3 state layer opacity tokens for interactive components.
///
/// This enum defines opacity values for state layers and other common UI
/// elements, following Material Design 3 interaction guidelines. State layers
/// are semi-transparent overlays that indicate the interactive state of
/// components (e.g., hovered, focused, pressed), providing visual feedback
/// to users about their interactions.
///
/// State layers enhance usability by creating clear visual distinctions
/// between different interaction states, improving accessibility and
/// user experience across all interaction methods.
///
/// ## Usage
///
/// ```dart
/// // Get hover state opacity
/// double opacity = M3StateLayerOpacityToken.hover.value; // 0.08
///
/// // Apply to container overlays
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue.withValues(alpha:
///       M3StateLayerOpacityToken.pressed.value,
///     ),
///   ),
/// )
///
/// // Use in custom state management
/// Widget buildStateLayer(bool isHovered, bool isPressed) {
///   final opacity = isPressed
///     ? M3StateLayerOpacityToken.pressed.value
///     : isHovered
///       ? M3StateLayerOpacityToken.hover.value
///       : 0.0;
///
///   return Opacity(opacity: opacity, child: stateLayer);
/// }
/// ```
///
/// ## State Guidelines
///
/// - **Hover (8%)**: Mouse hover indication
/// - **Focus (10%)**: Keyboard focus indication
/// - **Pressed (10%)**: Active press/tap state
/// - **Dragged (16%)**: Drag operation state
///
/// Reference: https://m3.material.io/foundations/interaction/states/state-layers
enum M3StateLayerOpacityToken implements IM3Token<double> {
  /// Hover state layer opacity (8%).
  ///
  /// Applied when a user hovers over an interactive element with a pointing
  /// device (mouse, trackpad). This subtle opacity provides immediate feedback
  /// that the element is interactive and ready to be activated.
  ///
  /// The 8% opacity ensures the hover effect is noticeable but not overwhelming,
  /// maintaining readability while clearly indicating interactivity.
  ///
  /// **Ideal use cases**:
  /// - Button hover states
  /// - Clickable card overlays
  /// - Menu item highlighting
  /// - Link hover effects
  /// - Interactive list item indication
  hover(0.08),

  /// Focus state layer opacity (10%).
  ///
  /// Applied when an element receives keyboard focus or is selected via
  /// assistive technologies. This opacity provides clear indication of the
  /// currently focused element, essential for keyboard navigation and
  /// accessibility compliance.
  ///
  /// The 10% opacity ensures sufficient contrast for focus indication while
  /// maintaining content legibility and visual hierarchy.
  ///
  /// **Ideal use cases**:
  /// - Keyboard focus indicators
  /// - Form field focus states
  /// - Button focus visualization
  /// - Navigation focus indication
  /// - Accessibility compliance overlays
  focus(0.10),

  /// Pressed state layer opacity (10%).
  ///
  /// Applied during active press or tap interactions to provide immediate
  /// tactile feedback. This state confirms to users that their interaction
  /// has been registered and the element is responding to their action.
  ///
  /// The 10% opacity creates a noticeable but comfortable visual response
  /// that enhances the perceived responsiveness of the interface.
  ///
  /// **Ideal use cases**:
  /// - Button press feedback
  /// - Touch/tap interaction states
  /// - Active selection indication
  /// - Click confirmation overlays
  /// - Momentary action feedback
  pressed(0.10),

  /// Dragged state layer opacity (16%).
  ///
  /// Applied to elements during drag operations to clearly indicate that
  /// the element is being moved or manipulated. This higher opacity creates
  /// strong visual feedback for complex interactions requiring sustained
  /// user attention.
  ///
  /// The 16% opacity provides sufficient visual weight to maintain visibility
  /// during drag operations while clearly distinguishing from other states.
  ///
  /// **Ideal use cases**:
  /// - Drag and drop operations
  /// - Sortable list item manipulation
  /// - Slider handle interactions
  /// - Resizable element operations
  /// - Complex gesture feedback
  dragged(0.16);

  /// Creates a state layer opacity token with the specified value.
  const M3StateLayerOpacityToken(this.value);

  /// The opacity value as a decimal (0.0 to 1.0).
  @override
  final double value;
}

/// Material Design 3 general opacity tokens for UI elements.
///
/// This enum defines general-purpose opacity values for UI elements like
/// disabled components, dividers, and backdrops, following Material Design 3
/// guidelines. These opacities are typically applied directly to element colors,
/// unlike state layers which are overlaid on top of components.
///
/// The opacity system ensures consistent visual hierarchy and accessibility
/// compliance across different component states and UI element types.
///
/// ## Usage
///
/// ```dart
/// // Get disabled content opacity
/// double opacity = M3Opacity.disabledContent.value; // 0.38
///
/// // Apply to disabled text
/// Text(
///   'Disabled Text',
///   style: TextStyle(
///     color: Colors.black.withValues(alpha:
///       M3Opacity.disabledContent.value,
///     ),
///   ),
/// )
///
/// // Use for disabled containers
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue.withValues(alpha:
///       M3Opacity.disabledContainer.value,
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
enum M3Opacity implements IM3Token<double> {
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
  disabledContent(0.38),

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
  disabledContainer(0.12),

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
  divider(0.12),

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
  backdrop(0.5);

  /// Creates an opacity token with the specified value.
  const M3Opacity(this.value);

  /// The opacity value as a decimal (0.0 to 1.0).
  @override
  final double value;
}
