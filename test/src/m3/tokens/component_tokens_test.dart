import 'package:flutter_test/flutter_test.dart';
import 'package:material_design/material_design.dart';

void main() {
  group('M3ButtonHeights', () {
    test('the five Expressive size classes', () {
      expect(M3ButtonHeights.extraSmall, 32);
      expect(M3ButtonHeights.small, 40);
      expect(M3ButtonHeights.medium, 56);
      expect(M3ButtonHeights.large, 96);
      expect(M3ButtonHeights.extraLarge, 136);
    });

    test('values is complete and ascending', () {
      expect(M3ButtonHeights.values, hasLength(5));
      for (var i = 1; i < M3ButtonHeights.values.length; i++) {
        expect(
          M3ButtonHeights.values[i],
          greaterThan(M3ButtonHeights.values[i - 1]),
        );
      }
    });

    test('the two smallest sizes sit below the 48dp touch target', () {
      // Not a defect in the scale — a documented consequence of it. The M3
      // button heights are *visual* heights; extraSmall (32dp) and small
      // (40dp) are both under the 48dp mobile minimum, which is why Material
      // expands the tap area around them rather than growing the button.
      // Flutter does this with MaterialTapTargetSize.padded; a custom control
      // at these heights has to do the same.
      expect(
        M3ButtonHeights.extraSmall,
        lessThan(M3Accessibility.minTouchTargetMobile),
      );
      expect(
        M3ButtonHeights.small,
        lessThan(M3Accessibility.minTouchTargetMobile),
      );
      expect(
        M3ButtonHeights.extraSmall,
        M3Accessibility.minTouchTargetDesktop,
      );

      for (final height in [
        M3ButtonHeights.medium,
        M3ButtonHeights.large,
        M3ButtonHeights.extraLarge,
      ]) {
        expect(
          height,
          greaterThanOrEqualTo(M3Accessibility.minTouchTargetMobile),
        );
      }
    });
  });

  group('M3FabSizes', () {
    test('spec values', () {
      expect(M3FabSizes.small, 40);
      expect(M3FabSizes.standard, 56);
      expect(M3FabSizes.large, 96);
      expect(M3FabSizes.values, hasLength(3));
    });

    test('the standard FAB matches the medium button height', () {
      expect(M3FabSizes.standard, M3ButtonHeights.medium);
    });
  });

  group('M3AppBarHeights', () {
    test('spec values', () {
      expect(M3AppBarHeights.small, 64);
      expect(M3AppBarHeights.medium, 112);
      expect(M3AppBarHeights.large, 152);
      expect(M3AppBarHeights.bottom, 80);
    });

    test('values covers only the top app bar, ascending', () {
      expect(M3AppBarHeights.values, hasLength(3));
      expect(M3AppBarHeights.values, isNot(contains(M3AppBarHeights.bottom)));
      expect(
        M3AppBarHeights.values,
        orderedEquals(<Object>[
          M3AppBarHeights.small,
          M3AppBarHeights.medium,
          M3AppBarHeights.large,
        ]),
      );
    });
  });

  group('M3NavigationSizes', () {
    test('spec values', () {
      expect(M3NavigationSizes.barHeight, 80);
      expect(M3NavigationSizes.railWidth, 80);
      expect(M3NavigationSizes.extendedRailWidth, 256);
      expect(M3NavigationSizes.drawerWidth, 360);
      expect(M3NavigationSizes.indicatorHeight, 32);
      expect(M3NavigationSizes.indicatorWidth, 56);
      expect(M3NavigationSizes.railDestinationHeight, 56);
    });

    test('the active indicator is the 56x32dp pill from the spec', () {
      // Only the height was tokenised before 1.7.0, so every caller drawing a
      // rail destination invented the width.
      expect(
        M3NavigationSizes.indicatorWidth,
        greaterThan(M3NavigationSizes.indicatorHeight),
      );
      expect(
        M3NavigationSizes.indicatorWidth,
        lessThan(M3NavigationSizes.railWidth),
      );
    });

    test('the drawer is as wide as the standard layout pane', () {
      expect(M3NavigationSizes.drawerWidth, M3LayoutWidths.pane);
    });

    test('M3ResponsiveNavigation reads the tokens', () {
      // Regression: these were inlined magic numbers before 1.6.0.
      expect(
        M3ResponsiveNavigation.getRailWidth(extended: false),
        M3NavigationSizes.railWidth,
      );
      expect(
        M3ResponsiveNavigation.getRailWidth(extended: true),
        M3NavigationSizes.extendedRailWidth,
      );
    });
  });

  group('M3ListItemHeights', () {
    test('spec values, ascending by line count', () {
      expect(M3ListItemHeights.oneLine, 56);
      expect(M3ListItemHeights.twoLine, 72);
      expect(M3ListItemHeights.threeLine, 88);
      expect(M3ListItemHeights.values, hasLength(3));
    });

    test('each extra line adds 16dp', () {
      expect(
        M3ListItemHeights.twoLine - M3ListItemHeights.oneLine,
        M3Spacings.s16,
      );
      expect(
        M3ListItemHeights.threeLine - M3ListItemHeights.twoLine,
        M3Spacings.s16,
      );
    });
  });

  group('the component layer stays on the contract', () {
    test('every component value is a multiple of 4', () {
      final all = <double>[
        ...M3ButtonHeights.values,
        ...M3FabSizes.values,
        ...M3AppBarHeights.values,
        M3AppBarHeights.bottom,
        M3NavigationSizes.barHeight,
        M3NavigationSizes.railWidth,
        M3NavigationSizes.extendedRailWidth,
        M3NavigationSizes.drawerWidth,
        M3NavigationSizes.indicatorHeight,
        ...M3ListItemHeights.values,
      ];

      for (final value in all) {
        expect(value % 4, 0, reason: '$value is off the 4dp grid');
      }
    });
  });
}
