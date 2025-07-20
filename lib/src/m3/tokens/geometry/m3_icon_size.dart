// Copyright 2024 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';

/// Defines standard icon sizes based on the Material Design 3 specification.
///
/// While M3 primarily uses a standard size of 24dp for UI icons, other sizes
/// are used contextually to maintain visual balance and clarity. This class
/// provides a set of common, recommended sizes.
///
/// Reference: https://m3.material.io/styles/icons/designing-icons
@immutable
abstract class M3IconSize {
  /// Dense icon size (20dp).
  ///
  /// Used in compact layouts or components where the standard 24dp icon
  /// would be too large, such as in dense list items or chips.
  static const double dense = 20;

  /// Standard icon size (24dp).
  ///
  /// This is the default and most common size for icons in UI components
  /// like app bars, navigation bars, and buttons.
  static const double standard = 24;

  /// Medium icon size (32dp).
  ///
  /// A slightly larger size for when an icon needs more prominence but is not
  /// a primary illustrative element.
  static const double medium = 32;

  /// Large icon size (40dp).
  ///
  /// Often used for more prominent display icons, such as in dialogs,
  /// empty states, or as part of larger list items.
  static const double large = 40;

  /// Extra large icon size (48dp).
  ///
  /// Suitable for avatars or when an icon serves as a key visual element
  /// on a page.
  static const double extraLarge = 48;
}
