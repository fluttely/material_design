/// Material Design 3 design tokens foundation system.
///
/// This file implements the Material Design 3 design token hierarchy:
/// - Reference tokens: Raw values (primitives)
/// - System tokens: Semantic tokens derived from reference tokens
/// - Component tokens: Component-specific tokens derived from system tokens
///
/// The token system follows the Material Design 3 specification for
/// consistent design decisions across the entire system.
library;

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

/// Abstract base class for all Material Design 3 tokens.
///
/// Design tokens are named entities that store visual design attributes.
/// They are used to maintain a scalable and consistent visual system.
///
/// The type parameter [T] represents the value type of the token.
///
/// Example:
/// ```dart
/// class ColorToken extends DesignToken<Color> {
///   const ColorToken(super.value, super.name);
/// }
/// ```
@immutable
abstract class DesignToken<T> {
  /// The value stored by this token.
  final T value;

  /// The semantic name of this token.
  final String name;

  /// Optional description of the token's purpose.
  final String? description;

  /// Creates a design token with the given [value], [name], and optional [description].
  const DesignToken(
    this.value,
    this.name, {
    this.description,
  });

  /// Returns the token value.
  T resolve() => value;

  /// Returns a string representation of the token.
  @override
  String toString() => '$runtimeType($name: $value)';

  /// Compares tokens for equality based on name and value.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DesignToken<T> &&
        other.name == name &&
        other.value == value;
  }

  /// Hash code based on name and value.
  @override
  int get hashCode => Object.hash(name, value);
}

/// Reference tokens are the base layer of the design token system.
///
/// These tokens store raw, literal values (primitives) such as:
/// - Color hex values (#FF5722)
/// - Numeric values (16.0, 24.0)
/// - String values ('Roboto')
///
/// Reference tokens are context-agnostic and do not convey semantic meaning.
/// They serve as the foundation for system and component tokens.
///
/// Example:
/// ```dart
/// const orangeRef = ReferenceToken<Color>(
///   Color(0xFFFF5722),
///   'orange.500',
///   description: 'Orange reference color at 500 tonal value',
/// );
/// ```
@immutable
class ReferenceToken<T> extends DesignToken<T> {
  /// Creates a reference token with the given [value] and [name].
  ///
  /// Reference tokens represent raw values without semantic meaning.
  const ReferenceToken(
    super.value,
    super.name, {
    super.description,
  });

  /// Factory constructor for creating reference tokens with validation.
  factory ReferenceToken.create({
    required T value,
    required String name,
    String? description,
  }) {
    assert(name.isNotEmpty, 'Token name cannot be empty');
    return ReferenceToken(value, name, description: description);
  }
}

/// System tokens are semantic tokens derived from reference tokens.
///
/// These tokens convey meaning and context within the design system:
/// - primary.color (derived from a reference color)
/// - spacing.medium (derived from a reference size)
/// - typography.body (derived from reference font properties)
///
/// System tokens create a semantic layer that can adapt to different
/// themes, brands, or contexts while maintaining consistent meaning.
///
/// Example:
/// ```dart
/// const primaryColor = SystemToken<Color>(
///   Color(0xFF6750A4),
///   'color.primary',
///   referenceToken: purpleRef,
///   description: 'Primary brand color used for key components',
/// );
/// ```
@immutable
class SystemToken<T> extends DesignToken<T> {
  /// The reference token this system token is derived from.
  final ReferenceToken<T>? referenceToken;

  /// Creates a system token derived from a reference token.
  ///
  /// System tokens provide semantic meaning to reference values.
  const SystemToken(
    super.value,
    super.name, {
    this.referenceToken,
    super.description,
  });

  /// Factory constructor for creating system tokens from reference tokens.
  factory SystemToken.fromReference(
    ReferenceToken<T> reference, {
    required String systemName,
    String? description,
  }) {
    assert(systemName.isNotEmpty, 'System token name cannot be empty');
    return SystemToken(
      reference.value,
      systemName,
      referenceToken: reference,
      description: description ?? reference.description,
    );
  }

  /// Factory constructor for creating system tokens with custom transformation.
  static SystemToken<T> transform<T, R>(
    ReferenceToken<R> reference, {
    required String systemName,
    required T Function(R) transformer,
    String? description,
  }) {
    assert(systemName.isNotEmpty, 'System token name cannot be empty');
    return SystemToken(
      transformer(reference.value),
      systemName,
      description: description ?? reference.description,
    );
  }

  /// Returns the reference token if available, otherwise null.
  ReferenceToken<T>? getReference() => referenceToken;
}

/// Component tokens are the most specific layer of the design token system.
///
/// These tokens are tied to specific UI components and define their
/// visual properties:
/// - button.primary.background (background color for primary buttons)
/// - card.elevation.resting (elevation for cards in resting state)
/// - textField.border.width (border width for text fields)
///
/// Component tokens inherit from system tokens and can override values
/// for specific component needs while maintaining design system consistency.
///
/// Example:
/// ```dart
/// const buttonHeight = ComponentToken<double>(
///   40.0,
///   'button.common.height',
///   systemToken: spacingLarge,
///   component: 'Button',
///   description: 'Standard height for all button variants',
/// );
/// ```
@immutable
class ComponentToken<T> extends DesignToken<T> {
  /// The system token this component token is derived from.
  final SystemToken<T>? systemToken;

  /// The component this token belongs to.
  final String component;

  /// The specific variant of the component (optional).
  final String? variant;

  /// The state this token applies to (optional).
  final String? state;

  /// Creates a component token for a specific UI component.
  ///
  /// Component tokens provide component-specific customization while
  /// maintaining connection to the broader design system.
  const ComponentToken(
    super.value,
    super.name, {
    this.systemToken,
    required this.component,
    this.variant,
    this.state,
    super.description,
  });

  /// Factory constructor for creating component tokens from system tokens.
  factory ComponentToken.fromSystem(
    SystemToken<T> system, {
    required String component,
    required String tokenName,
    String? variant,
    String? state,
    String? description,
  }) {
    assert(component.isNotEmpty, 'Component name cannot be empty');
    assert(tokenName.isNotEmpty, 'Token name cannot be empty');

    final fullName = _buildComponentTokenName(
      component: component,
      variant: variant,
      state: state,
      tokenName: tokenName,
    );

    return ComponentToken(
      system.value,
      fullName,
      systemToken: system,
      component: component,
      variant: variant,
      state: state,
      description: description ?? system.description,
    );
  }

  /// Factory constructor for creating component tokens with custom transformation.
  static ComponentToken<T> transform<T, R>(
    SystemToken<R> system, {
    required String component,
    required String tokenName,
    required T Function(R) transformer,
    String? variant,
    String? state,
    String? description,
  }) {
    assert(component.isNotEmpty, 'Component name cannot be empty');
    assert(tokenName.isNotEmpty, 'Token name cannot be empty');

    final fullName = _buildComponentTokenName(
      component: component,
      variant: variant,
      state: state,
      tokenName: tokenName,
    );

    return ComponentToken(
      transformer(system.value),
      fullName,
      component: component,
      variant: variant,
      state: state,
      description: description ?? system.description,
    );
  }

  /// Returns the system token if available, otherwise null.
  SystemToken<T>? getSystemToken() => systemToken;

  /// Returns the reference token through the system token hierarchy.
  ReferenceToken<T>? getReferenceToken() => systemToken?.getReference();

  /// Returns the full token hierarchy as a list.
  List<DesignToken<T>> getTokenHierarchy() {
    final hierarchy = <DesignToken<T>>[this];
    
    if (systemToken != null) {
      hierarchy.add(systemToken!);
      
      final reference = systemToken!.getReference();
      if (reference != null) {
        hierarchy.add(reference);
      }
    }
    
    return hierarchy;
  }

  /// Helper method to build component token names.
  static String _buildComponentTokenName({
    required String component,
    required String tokenName,
    String? variant,
    String? state,
  }) {
    final parts = <String>[component.toLowerCase()];
    
    if (variant != null && variant.isNotEmpty) {
      parts.add(variant.toLowerCase());
    }
    
    if (state != null && state.isNotEmpty) {
      parts.add(state.toLowerCase());
    }
    
    parts.add(tokenName.toLowerCase());
    
    return parts.join('.');
  }
}

/// Token resolver utility for managing and resolving design tokens.
///
/// This class provides utilities for working with the token system,
/// including validation, hierarchy traversal, and token resolution.
class TokenResolver {
  TokenResolver._();

  /// Validates that a token has a non-empty name.
  static bool validateTokenName(String name) {
    return name.trim().isNotEmpty;
  }

  /// Resolves a token to its final value, following the hierarchy if needed.
  static T resolveToken<T>(DesignToken<T> token) {
    return token.resolve();
  }

  /// Returns the complete token hierarchy for a component token.
  static List<DesignToken<T>> getHierarchy<T>(ComponentToken<T> token) {
    return token.getTokenHierarchy();
  }

  /// Finds the reference token in a token hierarchy.
  static ReferenceToken<T>? findReference<T>(DesignToken<T> token) {
    if (token is ReferenceToken<T>) return token;
    if (token is SystemToken<T>) return token.getReference();
    if (token is ComponentToken<T>) return token.getReferenceToken();
    return null;
  }

  /// Creates a token collection map for efficient lookups.
  static Map<String, DesignToken<T>> createTokenMap<T>(
    List<DesignToken<T>> tokens,
  ) {
    return {
      for (final token in tokens) token.name: token,
    };
  }

  /// Validates that a token hierarchy is properly connected.
  static bool validateHierarchy<T>(ComponentToken<T> token) {
    final systemToken = token.getSystemToken();
    if (systemToken == null) return true; // Valid if no system token

    final referenceToken = systemToken.getReference();
    if (referenceToken == null) return true; // Valid if no reference token

    // Check that values are consistent through hierarchy
    return token.value == systemToken.value || 
           systemToken.value == referenceToken.value;
  }
}

/// Collection of utility functions for working with design tokens.
extension DesignTokenExtensions<T> on DesignToken<T> {
  /// Returns true if this is a reference token.
  bool get isReference => this is ReferenceToken<T>;

  /// Returns true if this is a system token.
  bool get isSystem => this is SystemToken<T>;

  /// Returns true if this is a component token.
  bool get isComponent => this is ComponentToken<T>;

  /// Returns the token type as a string.
  String get tokenType {
    if (isReference) return 'Reference';
    if (isSystem) return 'System';
    if (isComponent) return 'Component';
    return 'Unknown';
  }

  /// Returns a debug representation of the token.
  String toDebugString() {
    final buffer = StringBuffer()
      ..writeln('$tokenType Token: $name')
      ..writeln('Value: $value')
      ..writeln('Type: $T');
    
    if (description != null) {
      buffer.writeln('Description: $description');
    }

    if (this is ComponentToken<T>) {
      final componentToken = this as ComponentToken<T>;
      buffer.writeln('Component: ${componentToken.component}');
      
      if (componentToken.variant != null) {
        buffer.writeln('Variant: ${componentToken.variant}');
      }
      
      if (componentToken.state != null) {
        buffer.writeln('State: ${componentToken.state}');
      }
    }

    return buffer.toString().trim();
  }
}
