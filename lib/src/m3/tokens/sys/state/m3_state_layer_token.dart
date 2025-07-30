// part of '../../../../../material_design.dart';

// /// Material Design 3 state layer tokens for interactive components.
// ///
// /// This enum provides comprehensive state layer management for interactive
// /// elements, combining color overlays with appropriate opacity values to
// /// create consistent user interaction feedback across all component types.
// ///
// /// State layers are semi-transparent overlays that communicate the
// /// interactive state of components (hover, focus, pressed, etc.) by
// /// applying tinted overlays with specific opacity values over the base
// /// component surface.
// ///
// /// ## Usage
// ///
// /// ```dart
// /// // Basic state layer application
// /// Container(
// ///   decoration: BoxDecoration(
// ///     color: M3StateLayerToken.hoverPrimary.color,
// ///   ),
// /// )
// ///
// /// // Conditional state layer based on interaction
// /// Widget buildWithStateLayer(bool isHovered, bool isPressed) {
// ///   final stateLayer = isPressed
// ///       ? M3StateLayerToken.pressedPrimary
// ///       : isHovered
// ///           ? M3StateLayerToken.hoverPrimary
// ///           : null;
// ///
// ///   return Container(
// ///     decoration: BoxDecoration(
// ///       color: stateLayer?.color ?? Colors.transparent,
// ///     ),
// ///   );
// /// }
// /// ```
// ///
// /// ## State Layer Principles
// ///
// /// - **Hover**: 8% opacity for pointer device indication
// /// - **Focus**: 10% opacity for keyboard/assistive navigation
// /// - **Pressed**: 10% opacity for active touch/click feedback
// /// - **Dragged**: 16% opacity for drag operation indication
// ///
// /// ## Color Variants
// ///
// /// Each interaction state is available across primary, secondary, tertiary,
// /// and surface color roles to match component theming requirements.
// ///
// /// Reference: https://m3.material.io/foundations/interaction/states/state-layers
// enum M3StateLayerToken implements IM3Token<Color> {
//   // Primary color family state layers
//   /// Hover state layer for primary color components.
//   ///
//   /// Applies 8% opacity primary color overlay for hover interactions.
//   /// Used on primary buttons, primary navigation items, and other
//   /// primary interactive elements when hovered with pointing devices.
//   ///
//   /// **Best practices**:
//   /// - Apply only during pointer hover events
//   /// - Remove immediately when hover ends
//   /// - Combine with appropriate cursor changes
//   hoverPrimary(Color(0x14000000)),

//   /// Focus state layer for primary color components.
//   ///
//   /// Applies 10% opacity primary color overlay for focus indication.
//   /// Essential for keyboard navigation and assistive technology users.
//   /// Provides clear visual feedback for currently focused elements.
//   ///
//   /// **Accessibility requirements**:
//   /// - Must be visible with keyboard navigation
//   /// - Should persist while element has focus
//   /// - Required for WCAG compliance
//   focusPrimary(Color(0x1A000000)),

//   /// Pressed state layer for primary color components.
//   ///
//   /// Applies 10% opacity primary color overlay during active press.
//   /// Provides immediate tactile feedback for touch and click interactions,
//   /// confirming that user input has been registered.
//   ///
//   /// **Interaction guidelines**:
//   /// - Show during entire press duration
//   /// - Remove when press is released or cancelled
//   /// - Combine with appropriate haptic feedback
//   pressedPrimary(Color(0x1A000000)),

//   /// Dragged state layer for primary color components.
//   ///
//   /// Applies 16% opacity primary color overlay during drag operations.
//   /// Higher opacity ensures visibility during complex drag interactions
//   /// and provides clear feedback for drag-and-drop operations.
//   ///
//   /// **Usage scenarios**:
//   /// - Sortable list items
//   /// - Draggable cards or components
//   /// - Slider handle interactions
//   draggedPrimary(Color(0x29000000)),

//   // Secondary color family state layers
//   /// Hover state layer for secondary color components.
//   hoverSecondary(Color(0x14000000)),

//   /// Focus state layer for secondary color components.
//   focusSecondary(Color(0x1A000000)),

//   /// Pressed state layer for secondary color components.
//   pressedSecondary(Color(0x1A000000)),

//   /// Dragged state layer for secondary color components.
//   draggedSecondary(Color(0x29000000)),

//   // Tertiary color family state layers
//   /// Hover state layer for tertiary color components.
//   hoverTertiary(Color(0x14000000)),

//   /// Focus state layer for tertiary color components.
//   focusTertiary(Color(0x1A000000)),

//   /// Pressed state layer for tertiary color components.
//   pressedTertiary(Color(0x1A000000)),

//   /// Dragged state layer for tertiary color components.
//   draggedTertiary(Color(0x29000000)),

//   // Surface color family state layers
//   /// Hover state layer for surface color components.
//   ///
//   /// Used on surface-colored interactive elements like cards, containers,
//   /// and background areas that respond to user interaction.
//   hoverSurface(Color(0x14000000)),

//   /// Focus state layer for surface color components.
//   focusSurface(Color(0x1A000000)),

//   /// Pressed state layer for surface color components.
//   pressedSurface(Color(0x1A000000)),

//   /// Dragged state layer for surface color components.
//   draggedSurface(Color(0x29000000)),

//   // Error color family state layers
//   /// Hover state layer for error color components.
//   ///
//   /// Applied to error-state buttons, destructive actions, and other
//   /// error-themed interactive elements during hover interactions.
//   hoverError(Color(0x14000000)),

//   /// Focus state layer for error color components.
//   focusError(Color(0x1A000000)),

//   /// Pressed state layer for error color components.
//   pressedError(Color(0x1A000000)),

//   /// Dragged state layer for error color components.
//   draggedError(Color(0x29000000));

//   /// Creates a state layer token with the specified color value.
//   const M3StateLayerToken(this.value);

//   /// The color value of this state layer token.
//   ///
//   /// Returns the pre-calculated color value with appropriate opacity
//   /// for the specific interaction state and color role combination.
//   @override
//   final Color value;

//   /// Gets the interaction state type for this token.
//   ///
//   /// Returns the interaction state (hover, focus, pressed, dragged)
//   /// associated with this state layer token.
//   M3StateLayerOpacityToken get interactionState {
//     switch (this) {
//       case hoverPrimary:
//       case hoverSecondary:
//       case hoverTertiary:
//       case hoverSurface:
//       case hoverError:
//         return M3StateLayerOpacityToken.hover;
//       case focusPrimary:
//       case focusSecondary:
//       case focusTertiary:
//       case focusSurface:
//       case focusError:
//         return M3StateLayerOpacityToken.focus;
//       case pressedPrimary:
//       case pressedSecondary:
//       case pressedTertiary:
//       case pressedSurface:
//       case pressedError:
//         return M3StateLayerOpacityToken.pressed;
//       case draggedPrimary:
//       case draggedSecondary:
//       case draggedTertiary:
//       case draggedSurface:
//       case draggedError:
//         return M3StateLayerOpacityToken.dragged;
//     }
//   }

//   /// Creates a custom state layer color with the given base color.
//   ///
//   /// Applies the appropriate opacity for this token's interaction state
//   /// to the provided base color, allowing for dynamic color theming
//   /// while maintaining consistent interaction feedback.
//   ///
//   /// ```dart
//   /// // Create custom themed state layer
//   /// Color customHover = M3StateLayerToken.hoverPrimary
//   ///     .withBaseColor(Theme.of(context).colorScheme.primary);
//   /// ```
//   Color withBaseColor(Color baseColor) {
//     return baseColor.withValues(alpha: interactionState.value);
//   }
// }
