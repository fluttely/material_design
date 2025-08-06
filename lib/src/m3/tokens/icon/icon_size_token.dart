part of '../../../../material_design.dart';

abstract final class M3IconSizes {
  const M3IconSizes._();

  /// Dense icon size (20dp).
  ///
  /// Optimized for compact layouts and high-density interfaces where space
  /// is at a premium. This size maintains icon clarity while allowing for
  /// tighter layouts without visual overwhelm.
  ///
  /// **Ideal use cases**:
  /// - Dense list items and table rows
  /// - Chip components and tags
  /// - Compact navigation elements
  /// - Toolbar icons in constrained spaces
  /// - Mobile interfaces with limited screen real estate
  static const double dense = 20;

  /// Standard icon size (24dp).
  ///
  /// The default and most commonly used icon size in Material Design 3.
  /// This size provides optimal balance between visibility and space efficiency
  /// ,
  /// making it suitable for the majority of UI components and interactions.
  ///
  /// **Ideal use cases**:
  /// - App bars and toolbars
  /// - Navigation bars and tabs
  /// - Standard buttons and form controls
  /// - Menu items and lists
  /// - Primary interactive elements
  static const double standard = 24;

  /// Medium icon size (32dp).
  ///
  /// A moderately larger size that provides enhanced visibility and prominence
  /// without dominating the interface. Useful when icons need slightly more
  /// visual weight or importance than standard icons.
  ///
  /// **Ideal use cases**:
  /// - Feature highlights and call-to-action buttons
  /// - Section headers and category indicators
  /// - Enhanced navigation elements
  /// - Medium-priority status indicators
  /// - Tablet and desktop interfaces with more space
  static const double medium = 32;

  /// Large icon size (40dp).
  ///
  /// Designed for prominent display purposes where icons serve as primary
  /// visual elements or need significant visual impact. This size ensures
  /// excellent visibility and user recognition.
  ///
  /// **Ideal use cases**:
  /// - Dialog and modal headers
  /// - Empty state illustrations
  /// - Large list item indicators
  /// - Feature introduction screens
  /// - Primary action buttons in spacious layouts
  static const double large = 40;

  /// Extra large icon size (48dp).
  ///
  /// The largest standard icon size, reserved for key visual elements that
  /// serve as primary focal points or when maximum impact and recognition
  /// are required. Often used for avatar-like representations.
  ///
  /// **Ideal use cases**:
  /// - User avatars and profile pictures
  /// - App launcher icons and branding elements
  /// - Hero sections and primary visual anchors
  /// - Onboarding and welcome screen illustrations
  /// - Large-scale interface elements on wide screens
  static const double extraLarge = 48;
}

/// Material Design 3 icon size tokens for consistent iconography.
///
/// This enum defines standard icon sizes based on the Material Design 3
/// specification. While M3 primarily uses 24dp as the standard size for UI
/// icons,
/// different sizes are used contextually to maintain visual balance, hierarchy,
/// and optimal readability across various components and layouts.
///
/// The icon size system ensures consistent visual weight and proportions
/// throughout the interface, supporting both functional and decorative icon
/// usage.
///
/// ## Usage
///
/// ```dart
/// // Get standard icon size
/// double iconSize = M3IconSizeToken.standard.value; // 24.0
///
/// // Use in Icon widgets
/// Icon(
///   Icons.home,
///   size: M3IconSizeToken.standard.value,
/// )
///
/// // Use with IconButton
/// IconButton(
///   iconSize: M3IconSizeToken.medium.value,
///   onPressed: () {},
///   icon: Icon(Icons.settings),
/// )
/// ```
///
/// ## Size Guidelines
///
/// - **Dense (20dp)**: Compact layouts, dense lists, chips
/// - **Standard (24dp)**: Default UI icons, buttons, navigation
/// - **Medium (32dp)**: Prominent icons, enhanced visibility
/// - **Large (40dp)**: Display icons, dialogs, empty states
/// - **Extra Large (48dp)**: Key visual elements, avatars
///
/// Reference: https://m3.material.io/styles/icons/designing-icons
enum M3IconSizeToken implements IM3Token<double> {
  /// Dense icon size (20dp).
  ///
  /// Optimized for compact layouts and high-density interfaces where space
  /// is at a premium. This size maintains icon clarity while allowing for
  /// tighter layouts without visual overwhelm.
  ///
  /// **Ideal use cases**:
  /// - Dense list items and table rows
  /// - Chip components and tags
  /// - Compact navigation elements
  /// - Toolbar icons in constrained spaces
  /// - Mobile interfaces with limited screen real estate
  dense(M3IconSizes.dense),

  /// Standard icon size (24dp).
  ///
  /// The default and most commonly used icon size in Material Design 3.
  /// This size provides optimal balance between visibility and space efficiency
  /// ,
  /// making it suitable for the majority of UI components and interactions.
  ///
  /// **Ideal use cases**:
  /// - App bars and toolbars
  /// - Navigation bars and tabs
  /// - Standard buttons and form controls
  /// - Menu items and lists
  /// - Primary interactive elements
  standard(M3IconSizes.standard),

  /// Medium icon size (32dp).
  ///
  /// A moderately larger size that provides enhanced visibility and prominence
  /// without dominating the interface. Useful when icons need slightly more
  /// visual weight or importance than standard icons.
  ///
  /// **Ideal use cases**:
  /// - Feature highlights and call-to-action buttons
  /// - Section headers and category indicators
  /// - Enhanced navigation elements
  /// - Medium-priority status indicators
  /// - Tablet and desktop interfaces with more space
  medium(M3IconSizes.medium),

  /// Large icon size (40dp).
  ///
  /// Designed for prominent display purposes where icons serve as primary
  /// visual elements or need significant visual impact. This size ensures
  /// excellent visibility and user recognition.
  ///
  /// **Ideal use cases**:
  /// - Dialog and modal headers
  /// - Empty state illustrations
  /// - Large list item indicators
  /// - Feature introduction screens
  /// - Primary action buttons in spacious layouts
  large(M3IconSizes.large),

  /// Extra large icon size (48dp).
  ///
  /// The largest standard icon size, reserved for key visual elements that
  /// serve as primary focal points or when maximum impact and recognition
  /// are required. Often used for avatar-like representations.
  ///
  /// **Ideal use cases**:
  /// - User avatars and profile pictures
  /// - App launcher icons and branding elements
  /// - Hero sections and primary visual anchors
  /// - Onboarding and welcome screen illustrations
  /// - Large-scale interface elements on wide screens
  extraLarge(M3IconSizes.extraLarge);

  /// Creates an icon size token with the specified value.
  const M3IconSizeToken(this.value);

  /// The icon size value in density-independent pixels (dp).
  @override
  final double value;
}
