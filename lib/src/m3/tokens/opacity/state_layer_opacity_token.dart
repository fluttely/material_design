part of '../../../../material_design.dart';

abstract final class M3StateLayerOpacities {
  const M3StateLayerOpacities._();

  /// Hover state layer opacity (8%).
  ///
  /// Applied when a user hovers over an interactive element with a pointing
  /// device (mouse, trackpad). This subtle opacity provides immediate feedback
  /// that the element is interactive and ready to be activated.
  ///
  /// The 8% opacity ensures the hover effect is noticeable but not
  /// overwhelming,
  /// maintaining readability while clearly indicating interactivity.
  ///
  /// **Ideal use cases**:
  /// - Button hover states
  /// - Clickable card overlays
  /// - Menu item highlighting
  /// - Link hover effects
  /// - Interactive list item indication
  static const double hover = 0.08;

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
  static const double focus = 0.10;

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
  static const double pressed = 0.10;

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
  static const double dragged = 0.16;
}

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
///   decoration: M3BoxDecoration(
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
  /// The 8% opacity ensures the hover effect is noticeable but not
  /// overwhelming,
  /// maintaining readability while clearly indicating interactivity.
  ///
  /// **Ideal use cases**:
  /// - Button hover states
  /// - Clickable card overlays
  /// - Menu item highlighting
  /// - Link hover effects
  /// - Interactive list item indication
  hover(M3StateLayerOpacities.hover),

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
  focus(M3StateLayerOpacities.focus),

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
  pressed(M3StateLayerOpacities.pressed),

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
  dragged(M3StateLayerOpacities.dragged);

  /// Creates a state layer opacity token with the specified value.
  const M3StateLayerOpacityToken(this.value);

  /// The opacity value as a decimal (0.0 to 1.0).
  @override
  final double value;
}
