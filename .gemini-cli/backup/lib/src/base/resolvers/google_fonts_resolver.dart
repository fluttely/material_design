part of 'resolvers.dart';

/// Helper for accessing fonts from the Google Fonts package.

/// Provides utilities for retrieving Google Fonts and their names.
class GoogleFontsResolver extends Equatable {
  const GoogleFontsResolver();

  TextStyle font(String familyName, {TextStyle? textStyle}) {
    return GoogleFonts.getFont(familyName, textStyle: textStyle);
  }

  static List<String> get availableFontFamilies {
    return GoogleFonts.asMap().keys.toList();
  }

  @override
  List<Object?> get props => [];

  @override
  String toString() => 'GoogleFontsResolver()';
}
