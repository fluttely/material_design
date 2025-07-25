/// Material Design 3 Design Tokens Export.
///
/// This is the main barrel file for all Material Design 3 design tokens.
/// It provides a complete token system organized in the three-tier hierarchy:
///
/// 1. **Reference Tokens (ref/)**: The foundational values
///    - Color palettes, typefaces, and base measurements
///    - Platform-agnostic primitive values
///
/// 2. **System Tokens (sys/)**: Semantic design decisions  
///    - Role-based tokens that give meaning to reference tokens
///    - Context-aware tokens like primary color, body text, etc.
///
/// 3. **Component Tokens (comp/)**: Component-specific tokens
///    - Tokens that define the appearance of specific UI components
///    - Built on top of system tokens for consistency
///
/// This token hierarchy ensures consistency, maintainability, and
/// scalability across the entire design system.
///
/// Reference: https://m3.material.io/foundations/design-tokens/overview
library;

export 'ref/ref.dart';
export 'sys/sys.dart';

// TODO: Export component tokens when implemented
// export 'comp/comp.dart';