import 'package:flutter/material.dart';

/// Material Design 3 Reference Typeface Tokens.
///
/// This class contains the reference typography definitions from Material
/// Design 3 specification. These reference typefaces define the typographic
/// foundation for the entire design system.
///
/// According to M3 guidelines, the reference typeface system includes:
/// - Font family definitions (brand font, plain font, code font)
/// - Font weight variations from thin to black
/// - Base font sizes and measurements
/// - OpenType features and font settings
///
/// The reference typeface tokens are then used by system typography tokens
/// to create the complete type scale with semantic roles like headline,
/// body, label, display, and title styles.
///
/// Reference: https://m3.material.io/styles/typography/type-scale-tokens
abstract class _M3RefTypeface {
  // Font Family Definitions
  
  /// Brand font family - Primary typeface for brand expression
  /// Used for display and headline text where brand personality is desired
  static const String brandFont = 'Roboto';
  
  /// Plain font family - Default typeface for body text and UI elements
  /// Used for general text content and interface elements
  static const String plainFont = 'Roboto';
  
  /// Code font family - Monospace typeface for code and technical content
  /// Used for code blocks, technical documentation, and data display
  static const String codeFont = 'Roboto Mono';

  // Font Weight Definitions
  
  /// Thin font weight (100) - Lightest weight available
  /// Used sparingly for very large display text
  static const FontWeight thin = FontWeight.w100;
  
  /// Extra light font weight (200) - Very light weight
  /// Used for large display text when emphasis is not needed
  static const FontWeight extraLight = FontWeight.w200;
  
  /// Light font weight (300) - Light weight for subtle emphasis
  /// Used for secondary text and less important content
  static const FontWeight light = FontWeight.w300;
  
  /// Regular font weight (400) - Default weight for body text
  /// Standard weight for most text content and paragraphs
  static const FontWeight regular = FontWeight.w400;
  
  /// Medium font weight (500) - Medium emphasis weight
  /// Used for emphasized text, labels, and interactive elements
  static const FontWeight medium = FontWeight.w500;
  
  /// Semi bold font weight (600) - Strong emphasis weight
  /// Used for headings and important information
  static const FontWeight semiBold = FontWeight.w600;
  
  /// Bold font weight (700) - Bold emphasis for headings
  /// Used for titles, headings, and high-emphasis content
  static const FontWeight bold = FontWeight.w700;
  
  /// Extra bold font weight (800) - Very bold emphasis
  /// Used for large headings and strong brand elements
  static const FontWeight extraBold = FontWeight.w800;
  
  /// Black font weight (900) - Heaviest weight available
  /// Used for display text and maximum emphasis
  static const FontWeight black = FontWeight.w900;

  // Base Type Scale Measurements
  
  /// Display large base size - 57sp
  /// Used for the largest display text
  static const double displayLargeSize = 57.0;
  
  /// Display medium base size - 45sp
  /// Used for medium display text
  static const double displayMediumSize = 45.0;
  
  /// Display small base size - 36sp
  /// Used for small display text
  static const double displaySmallSize = 36.0;
  
  /// Headline large base size - 32sp
  /// Used for large headlines
  static const double headlineLargeSize = 32.0;
  
  /// Headline medium base size - 28sp
  /// Used for medium headlines
  static const double headlineMediumSize = 28.0;
  
  /// Headline small base size - 24sp
  /// Used for small headlines
  static const double headlineSmallSize = 24.0;
  
  /// Title large base size - 22sp
  /// Used for large titles
  static const double titleLargeSize = 22.0;
  
  /// Title medium base size - 16sp
  /// Used for medium titles
  static const double titleMediumSize = 16.0;
  
  /// Title small base size - 14sp
  /// Used for small titles
  static const double titleSmallSize = 14.0;
  
  /// Body large base size - 16sp
  /// Used for large body text
  static const double bodyLargeSize = 16.0;
  
  /// Body medium base size - 14sp
  /// Used for medium body text
  static const double bodyMediumSize = 14.0;
  
  /// Body small base size - 12sp
  /// Used for small body text
  static const double bodySmallSize = 12.0;
  
  /// Label large base size - 14sp
  /// Used for large labels
  static const double labelLargeSize = 14.0;
  
  /// Label medium base size - 12sp
  /// Used for medium labels
  static const double labelMediumSize = 12.0;
  
  /// Label small base size - 11sp
  /// Used for small labels
  static const double labelSmallSize = 11.0;

  // Font Feature Settings
  
  /// OpenType features for optimal text rendering
  /// Enables contextual alternates and ligatures
  static const List<FontFeature> defaultFeatures = [
    FontFeature.contextualAlternates(),
    FontFeature.enable('liga'),
  ];
  
  /// Tabular figures feature for consistent number alignment
  /// Used for data tables and numeric content
  static const List<FontFeature> tabularFeatures = [
    FontFeature.tabularFigures(),
  ];
  
  /// Proportional figures feature for natural text flow
  /// Used for body text with numbers
  static const List<FontFeature> proportionalFeatures = [
    FontFeature.proportionalFigures(),
  ];

  // Utility Methods
  
  /// Validates if a font family is available on the current platform
  /// Returns true if the font is available, false otherwise
  static bool isFontAvailable(String fontFamily) {
    // Note: This is a placeholder implementation
    // In a real implementation, this would check platform font availability
    switch (fontFamily) {
      case 'Roboto':
      case 'Roboto Mono':
        return true;
      default:
        return false;
    }
  }
  
  /// Gets the fallback font family for the given font
  /// Returns a system font if the requested font is not available
  static String getFallback(String fontFamily) {
    if (isFontAvailable(fontFamily)) {
      return fontFamily;
    }
    
    // Return platform-appropriate fallbacks
    return plainFont; // Roboto as default fallback
  }
}