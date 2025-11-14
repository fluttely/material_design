part of '../design_tokens.dart';

/// Breakpoints defining responsive layout ranges.

/// Contains screen size ranges for responsive layouts.
class BreakpointTokens extends Equatable {
  const BreakpointTokens({
    DesignBreakpoint? mobile,
    DesignBreakpoint? tablet,
    DesignBreakpoint? desktop,
    DesignBreakpoint? infinity,
  }) : mobile =
           mobile ??
           const DesignBreakpoint(
             maxWidth: ExtendedValues.x599,
           ),
       tablet =
           tablet ??
           const DesignBreakpoint(
             minWidth: ExtendedValues.x600,
             maxWidth: ExtendedValues.x1023,
           ),
       desktop =
           desktop ??
           const DesignBreakpoint(
             minWidth: MaterialDimensions.x1024,
             maxWidth: ExtendedValues.x1439,
           ),
       infinity =
           infinity ??
           const DesignBreakpoint(
             minWidth: ExtendedValues.x1440,
           );
  factory BreakpointTokens.fromMap(Map<String, dynamic> map) {
    DesignBreakpoint? parseBreakpoint(String key) {
      final value = map[key];
      if (value is Map<String, dynamic>) {
        return DesignBreakpoint(
          minWidth: (value['minWidth'] as num?)?.toDouble() ?? 0,
          maxWidth: (value['maxWidth'] as num?)?.toDouble() ?? double.infinity,
        );
      }
      return null;
    }

    return BreakpointTokens(
      mobile: parseBreakpoint('mobile'),
      tablet: parseBreakpoint('tablet'),
      desktop: parseBreakpoint('desktop'),
      infinity: parseBreakpoint('infinity'),
    );
  }

  final DesignBreakpoint mobile;
  final DesignBreakpoint tablet;
  final DesignBreakpoint desktop;
  final DesignBreakpoint infinity;

  @override
  List<Object?> get props => [mobile, tablet, desktop, infinity];

  @override
  String toString() =>
      '''
BreakpointTokens(
  mobile: $mobile,
  tablet: $tablet,
  desktop: $desktop,
  infinity: $infinity,
)''';
}

class DesignBreakpoint {
  const DesignBreakpoint({this.minWidth = 0, this.maxWidth = double.infinity});
  final double minWidth;
  final double maxWidth;

  bool matches(Size size) => size.width >= minWidth && size.width <= maxWidth;

  @override
  String toString() =>
      'DesignBreakpoint(minWidth: $minWidth, maxWidth: $maxWidth)';
}
