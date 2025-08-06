part of '../../../../material_design.dart';

abstract final class M3ZIndexes {
  /// Background layer z-index (0).
  ///
  /// The foundational layer for elements that should appear behind all other
  /// content. This includes background images, base containers, and elements
  /// that form the visual foundation of the interface.
  ///
  /// **Ideal use cases**:
  /// - Background images and patterns
  /// - Base container elements
  /// - Foundational layout structures
  /// - Elements meant to be behind all other content
  static const int background = 0;

  /// Default content z-index (1).
  ///
  /// The standard layer for most interface content and interactive elements.
  /// This represents the primary content layer where users interact with
  /// the main application functionality.
  ///
  /// **Ideal use cases**:
  /// - Primary content areas
  /// - Standard buttons and form controls
  /// - List items and card components
  /// - Basic interactive elements
  /// - Main application content
  static const int content = 1;

  /// Floating component z-index (10).
  ///
  /// For components that need to appear above standard content but below
  /// navigation and modal elements. This creates a subtle elevation that
  /// indicates special functionality without overwhelming the interface.
  ///
  /// **Ideal use cases**:
  /// - Floating Action Buttons (FABs)
  /// - Hover cards and preview tooltips
  /// - Floating panels and mini-overlays
  /// - Elements that need subtle prominence
  static const int floating = 10;

  /// Navigation drawer z-index (100).
  ///
  /// For temporary overlaying UI elements like navigation drawers, side menus,
  /// and contextual panels that need to appear above floating elements but
  /// below critical modal content.
  ///
  /// **Ideal use cases**:
  /// - Navigation drawers and side panels
  /// - Context menus and dropdown menus
  /// - Slide-out panels and sheets
  /// - Temporary overlay navigation
  static const int drawer = 100;

  /// Modal component z-index (1000).
  ///
  /// For modal components that must appear above all other application content,
  /// creating a clear separation between the modal and the underlying
  /// interface. This ensures user focus is directed to the modal content.
  ///
  /// **Ideal use cases**:
  /// - Dialog boxes and modal windows
  /// - Bottom sheets and action sheets
  /// - Full-screen overlays and lightboxes
  /// - Alert dialogs and confirmation prompts
  static const int modal = 1000;

  /// Snackbar z-index (2000).
  ///
  /// For the most critical top-level elements that must be visible above all
  /// other content, including modals. These elements provide system-level
  /// feedback and should never be obscured.
  ///
  /// **Ideal use cases**:
  /// - Snackbars and toast messages
  /// - System notifications and banners
  /// - Critical alert messages
  /// - Global status indicators
  static const int snackbar = 2000;

  /// Tooltip z-index (9999).
  ///
  /// The highest standard z-index for contextual help elements that should
  /// appear above everything else to ensure visibility. Tooltips provide
  /// essential user guidance and must never be hidden.
  ///
  /// **Ideal use cases**:
  /// - Contextual tooltips and help text
  /// - Interactive guidance overlays
  /// - Accessibility information panels
  /// - Critical user assistance elements
  static const int tooltip = 9999;
}

/// Material Design 3 z-index tokens for consistent component layering.
///
/// This enum defines a conventional z-index scale for managing the stacking
/// order of UI components. While Material Design 3 primarily focuses on an
/// elevation system (tonal and shadow elevation) to express depth, z-index
/// values are essential for managing stacking contexts in complex UIs.
///
/// These values provide a practical and standardized approach to component
/// layering, ensuring predictable visual hierarchy and proper user interaction
/// across different interface elements.
///
/// ## Usage
///
/// ```dart
/// // Get z-index for modal components
/// int zIndex = M3ZIndexToken.modal.value; // 1000
///
/// // Use in positioned widgets
/// Positioned(
///   top: 0,
///   left: 0,
///   child: Container(
///     // Custom implementation for z-index
///   ),
/// )
///
/// // Use for overlay ordering
/// showDialog(
///   context: context,
///   builder: (context) => Dialog(
///     // Will appear at modal z-index level
///   ),
/// );
/// ```
///
/// ## Layering Hierarchy
///
/// - **Background (0)**: Base layer, behind all content
/// - **Content (1)**: Default content and interface elements
/// - **Floating (10)**: FABs and floating components
/// - **Drawer (100)**: Navigation drawers and side panels
/// - **Modal (1000)**: Dialogs, bottom sheets, overlays
/// - **Snackbar (2000)**: Toast messages and notifications
/// - **Tooltip (9999)**: Contextual help and information
///
/// **Note**: These are conventional values, not official M3 tokens, but provide
/// consistent layering for complex interface hierarchies.
enum M3ZIndexToken implements IM3Token<int> {
  /// Background layer z-index (0).
  ///
  /// The foundational layer for elements that should appear behind all other
  /// content. This includes background images, base containers, and elements
  /// that form the visual foundation of the interface.
  ///
  /// **Ideal use cases**:
  /// - Background images and patterns
  /// - Base container elements
  /// - Foundational layout structures
  /// - Elements meant to be behind all other content
  background(M3ZIndexes.background),

  /// Default content z-index (1).
  ///
  /// The standard layer for most interface content and interactive elements.
  /// This represents the primary content layer where users interact with
  /// the main application functionality.
  ///
  /// **Ideal use cases**:
  /// - Primary content areas
  /// - Standard buttons and form controls
  /// - List items and card components
  /// - Basic interactive elements
  /// - Main application content
  content(M3ZIndexes.content),

  /// Floating component z-index (10).
  ///
  /// For components that need to appear above standard content but below
  /// navigation and modal elements. This creates a subtle elevation that
  /// indicates special functionality without overwhelming the interface.
  ///
  /// **Ideal use cases**:
  /// - Floating Action Buttons (FABs)
  /// - Hover cards and preview tooltips
  /// - Floating panels and mini-overlays
  /// - Elements that need subtle prominence
  floating(M3ZIndexes.floating),

  /// Navigation drawer z-index (100).
  ///
  /// For temporary overlaying UI elements like navigation drawers, side menus,
  /// and contextual panels that need to appear above floating elements but
  /// below critical modal content.
  ///
  /// **Ideal use cases**:
  /// - Navigation drawers and side panels
  /// - Context menus and dropdown menus
  /// - Slide-out panels and sheets
  /// - Temporary overlay navigation
  drawer(M3ZIndexes.drawer),

  /// Modal component z-index (1000).
  ///
  /// For modal components that must appear above all other application content,
  /// creating a clear separation between the modal and the underlying
  /// interface. This ensures user focus is directed to the modal content.
  ///
  /// **Ideal use cases**:
  /// - Dialog boxes and modal windows
  /// - Bottom sheets and action sheets
  /// - Full-screen overlays and lightboxes
  /// - Alert dialogs and confirmation prompts
  modal(M3ZIndexes.modal),

  /// Snackbar z-index (2000).
  ///
  /// For the most critical top-level elements that must be visible above all
  /// other content, including modals. These elements provide system-level
  /// feedback and should never be obscured.
  ///
  /// **Ideal use cases**:
  /// - Snackbars and toast messages
  /// - System notifications and banners
  /// - Critical alert messages
  /// - Global status indicators
  snackbar(M3ZIndexes.snackbar),

  /// Tooltip z-index (9999).
  ///
  /// The highest standard z-index for contextual help elements that should
  /// appear above everything else to ensure visibility. Tooltips provide
  /// essential user guidance and must never be hidden.
  ///
  /// **Ideal use cases**:
  /// - Contextual tooltips and help text
  /// - Interactive guidance overlays
  /// - Accessibility information panels
  /// - Critical user assistance elements
  tooltip(M3ZIndexes.tooltip);

  /// Creates a z-index token with the specified value.
  const M3ZIndexToken(this.value);

  /// The z-index value for component layering.
  @override
  final int value;
}
