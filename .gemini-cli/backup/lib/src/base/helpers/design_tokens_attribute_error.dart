part of 'helpers.dart';

/// Error messages used when accessing unsupported design token attributes.

enum DesignTokensAttributeError {
  unsupportedError;

  String message({
    required String attribute,
    required String location,
  }) {
    switch (this) {
      case DesignTokensAttributeError.unsupportedError:
        return '''
        Access to $attribute has been intentionally blocked in tokens.$location. 
        This property should not be used or accessed directly, as its usage has been deprecated or is reserved for internal purposes only. 
        Please review your implementation to avoid relying on this property and ensure your application's compatibility with future changes.
        ''';
    }
  }
}
