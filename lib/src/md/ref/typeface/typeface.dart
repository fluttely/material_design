import 'package:flutter/material.dart';

/// Reference typeface tokens for Material Design 3.
/// 
/// These define the base typeface properties that are used to build
/// the typescale system tokens.
/// 
/// Specification: https://m3.material.io/styles/typography/tokens
abstract class MdRefTypeface {
  /// The primary brand font family used throughout the interface.
  /// 
  /// Token: md.ref.typeface.brand
  static const String brand = 'Roboto';

  /// The plain font family used for standard text content.
  /// 
  /// Token: md.ref.typeface.plain
  static const String plain = 'Roboto';

  /// The weight used for regular text.
  /// 
  /// Token: md.ref.typeface.weight.regular
  static const FontWeight weightRegular = FontWeight.w400;

  /// The weight used for medium emphasis text.
  /// 
  /// Token: md.ref.typeface.weight.medium
  static const FontWeight weightMedium = FontWeight.w500;

  /// The weight used for bold text.
  /// 
  /// Token: md.ref.typeface.weight.bold
  static const FontWeight weightBold = FontWeight.w700;
}