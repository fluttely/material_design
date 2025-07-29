import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/showcase_pages/foundations/border_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/breakpoint_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/icon_size_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/opacity_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/spacing_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/visual_density_page.dart';
import 'package:material_design_demo/showcase_pages/foundations/z_index_tokens_page.dart';
import 'package:material_design_demo/showcase_pages/m3_expressive/m3_expressive_page.dart';
import 'package:material_design_demo/showcase_pages/widgets/launch_url_text.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';
import 'showcase_pages/components/utils_page.dart';
import 'showcase_pages/foundations/accessibility_page.dart';
import 'showcase_pages/foundations/adaptive_page.dart';
import 'showcase_pages/styles/color_page.dart';
import 'showcase_pages/styles/elevation_page.dart';
import 'showcase_pages/styles/motion_page.dart';
import 'showcase_pages/styles/shape_page.dart';
import 'showcase_pages/styles/typography_page.dart';
import 'theme_provider.dart';

/// Entry point of the Material Design 3 Token Showcase application.
///
/// This app demonstrates the implementation of Material Design 3 tokens,
/// foundations, and styles using a responsive navigation pattern that
/// adapts between NavigationDrawer (mobile) and NavigationRail (desktop).
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const TokenShowcaseApp(),
    ),
  );
}

/// Main application widget that configures the Material Design 3 theme
/// and provides the showcase interface.
///
/// Features:
/// - Dynamic theme switching (light/dark mode)
/// - Custom seed color support with dynamic color generation
/// - Material Design 3 token demonstration
class TokenShowcaseApp extends StatelessWidget {
  const TokenShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Material Design 3 Token Showcase',
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const ShowcaseHomePage(),
    );
  }
}

/// Home page of the Material Design 3 showcase that demonstrates
/// adaptive navigation patterns following M3 guidelines.
///
/// The page automatically adapts its layout based on screen size:
/// - Small screens (< 600dp): Uses NavigationDrawer with hamburger menu
/// - Large screens (≥ 600dp): Uses NavigationRail with persistent navigation
///
/// This follows Material Design 3 responsive navigation patterns.
class ShowcaseHomePage extends StatefulWidget {
  const ShowcaseHomePage({super.key});

  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

class _ShowcaseHomePageState extends State<ShowcaseHomePage> {
  /// Key for controlling the Scaffold drawer on mobile layouts
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// Currently selected navigation destination index
  int _selectedIndex = 0;

  /// Pages corresponding to each navigation destination.
  ///
  /// Organized by Material Design 3 categories:
  /// - Foundations: Basic building blocks (spacing, density, etc.)
  /// - Styles: Visual styling elements (color, typography, etc.)
  /// - Components: Interactive UI elements (buttons, cards, etc.)
  final List<Widget> _pages = [
    // Foundations - Core design tokens and layout principles
    const SpacingPage(),
    const VisualDensityPage(),
    const BreakpointTokensPage(),
    const ZIndexTokensPage(),
    const BorderTokensPage(),
    const IconSizeTokensPage(),
    const OpacityTokensPage(),
    const AccessibilityPage(),
    const AdaptivePage(),

    // Styles - Visual design elements
    const ColorPage(),
    const TypographyPage(),
    const ElevationPage(),
    const ShapePage(),
    const MotionPage(),

    // Components and Utilities
    const UtilsPage(),
    const M3ExpressivePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Use Material Design 3 medium breakpoint (600dp) for responsive layout
    final isSmallScreen =
        MediaQuery.of(context).size.width < M3BreakpointToken.medium.value;

    // Mobile layout: NavigationDrawer with hamburger menu
    if (isSmallScreen) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: _buildScrollableNavigationDrawer(context),
        body: Stack(
          children: [
            _pages[_selectedIndex],
            // Floating hamburger menu button positioned according to M3 specs
            Positioned(
              top: M3SpacingToken.space8.value,
              left: M3SpacingToken.space16.value,
              child: IconButton(
                tooltip: 'Open navigation menu',
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: const Icon(Icons.menu),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.8),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Desktop layout: NavigationRail with persistent navigation
    return Scaffold(
      body: Row(
        children: [
          _buildScrollableNavigationRail(context),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }

  /// Creates navigation destinations for Material Design 3 Foundation tokens.
  ///
  /// These represent the core building blocks of the design system:
  /// spacing, density, breakpoints, elevation layers, borders, icons,
  /// opacity values, accessibility features, and adaptive design patterns.
  List<NavigationRailDestination> _buildFoundationNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.straighten_outlined),
        selectedIcon: Icon(Icons.straighten),
        label: Text('Spacing'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.density_medium_outlined),
        selectedIcon: Icon(Icons.density_medium),
        label: Text('Density'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.aspect_ratio_outlined),
        selectedIcon: Icon(Icons.aspect_ratio),
        label: Text('Breakpoints'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.layers_outlined),
        selectedIcon: Icon(Icons.layers),
        label: Text('Z-Indexes'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.border_style_outlined),
        selectedIcon: Icon(Icons.border_style),
        label: Text('Borders'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.photo_size_select_small_outlined),
        selectedIcon: Icon(Icons.photo_size_select_small),
        label: Text('Icon Sizes'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.opacity_outlined),
        selectedIcon: Icon(Icons.opacity),
        label: Text('Opacities'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.accessibility_outlined),
        selectedIcon: Icon(Icons.accessibility),
        label: Text('A11y'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.devices_outlined),
        selectedIcon: Icon(Icons.devices),
        label: Text('Adaptive'),
      ),
    ];
  }

  /// Creates navigation destinations for Material Design 3 Style tokens.
  ///
  /// These represent the visual styling elements of the design system:
  /// color palettes, typography scales, elevation shadows, shape tokens,
  /// and motion/animation specifications.
  List<NavigationRailDestination> _buildStylesNavigationRailDestinations() {
    return const [
      NavigationRailDestination(
        icon: Icon(Icons.format_paint_outlined),
        selectedIcon: Icon(Icons.format_paint),
        label: Text('Color'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.text_fields_outlined),
        selectedIcon: Icon(Icons.text_fields),
        label: Text('Typography'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.copy_outlined),
        selectedIcon: Icon(Icons.copy),
        label: Text('Elevation'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.rounded_corner_outlined),
        selectedIcon: Icon(Icons.rounded_corner),
        label: Text('Shape'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.animation_outlined),
        selectedIcon: Icon(Icons.animation),
        label: Text('Motion'),
      ),
      // NavigationRailDestination(
      //   icon: Icon(Icons.widgets_outlined),
      //   selectedIcon: Icon(Icons.widgets),
      //   label: Text('Components'),
      // ),
      NavigationRailDestination(
        icon: Icon(Icons.auto_awesome_outlined),
        selectedIcon: Icon(Icons.auto_awesome),
        label: Text('Utils'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.local_activity_outlined),
        selectedIcon: Icon(Icons.local_activity),
        label: Text('Expressive'),
      ),
    ];
  }

  /// Builds a scrollable NavigationDrawer for mobile layouts.
  ///
  /// Features Material Design 3 specifications:
  /// - Organized sections with dividers
  /// - Theme controls at the bottom
  /// - Proper spacing using M3 tokens
  /// - Links to official Material Design documentation
  Widget _buildScrollableNavigationDrawer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final textTheme = Theme.of(context).textTheme;
    final foundationDestinations = _buildFoundationNavigationRailDestinations();
    final styleDestinations = _buildStylesNavigationRailDestinations();

    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
          Navigator.of(context).pop();
        });
      },
      children: [
        M3Padding.fromLTRB(
          M3SpacingToken.space28,
          M3SpacingToken.space16,
          M3SpacingToken.space16,
          M3SpacingToken.space12,
          child: Text(
            'Material Design 3',
            style: textTheme.titleSmall,
          ),
        ),
        M3Padding.symmetric(
          horizontal: M3SpacingToken.space28,
          child: Divider(),
        ),

        // Foundations Section
        M3Padding.fromLTRB(
          M3SpacingToken.space28,
          M3SpacingToken.space16,
          M3SpacingToken.space16,
          M3SpacingToken.space12,
          child: Text('Foundations', style: textTheme.titleSmall),
        ),
        ...foundationDestinations.map(
          (d) => NavigationDrawerDestination(
            icon: d.icon,
            label: d.label,
            selectedIcon: d.selectedIcon,
          ),
        ),

        M3Padding.symmetric(
          horizontal: M3SpacingToken.space28,
          child: Divider(),
        ),

        // Styles Section
        M3Padding.fromLTRB(
          M3SpacingToken.space28,
          M3SpacingToken.space16,
          M3SpacingToken.space16,
          M3SpacingToken.space12,
          child: Text('Styles', style: textTheme.titleSmall),
        ),
        ...styleDestinations.map(
          (d) => NavigationDrawerDestination(
            icon: d.icon,
            label: d.label,
            selectedIcon: d.selectedIcon,
          ),
        ),

        M3Padding.symmetric(
          horizontal: M3SpacingToken.space28,
          child: Divider(),
        ),

        // Theme Controls
        M3Padding.fromLTRB(
          M3SpacingToken.space28,
          M3SpacingToken.space16,
          M3SpacingToken.space16,
          M3SpacingToken.space12,
          child: Text('Theme', style: textTheme.titleSmall),
        ),
        M3Padding.symmetric(
          horizontal: M3SpacingToken.space16,
          child: Row(
            children: [
              const Text('Dark Mode'),
              const Spacer(),
              Switch(
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeProvider.changeThemeMode(
                      value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
        ),
        M3Padding.symmetric(
          horizontal: M3SpacingToken.space16,
          child: Row(
            children: [
              const Text('Seed Color'),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.color_lens, color: themeProvider.seedColor),
                onPressed: () async {
                  final newColor = await showColorPickerDialog(context);
                  if (newColor != null) {
                    themeProvider.changeSeedColor(newColor);
                  }
                },
              ),
            ],
          ),
        ),
        const M3Gap(M3SpacingToken.space8),
        M3Padding.symmetric(
          horizontal: M3SpacingToken.space16,
          child: const LaunchURLText(
            label: 'Flutter M3 Demo',
            m3Url: 'https://flutterweb-wasm.web.app/',
          ),
        ),
      ],
    );
  }

  /// Builds a custom scrollable NavigationRail for desktop layouts.
  ///
  /// This implementation provides:
  /// - Scrollable content area for many navigation items
  /// - Fixed header and footer sections
  /// - Custom M3-compliant navigation items with indicators
  /// - Theme controls positioned at the bottom
  /// - Links to Material Design documentation
  Widget _buildScrollableNavigationRail(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final foundationDestinations = _buildFoundationNavigationRailDestinations();
    final styleDestinations = _buildStylesNavigationRailDestinations();

    return Container(
      width: 80,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header with M3 link - Fixed at top
          const LaunchURLText(
            label: 'M3',
            m3Url: 'https://m3.material.io/',
          ),

          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Foundations section
                  Divider(
                      indent: M3SpacingToken.space8.value,
                      endIndent: M3SpacingToken.space8.value),
                  const LaunchURLText(
                    label: 'Foundations',
                    fontSize: 12,
                    m3Url: 'https://m3.material.io/foundations',
                  ),

                  // Foundations navigation items
                  ...foundationDestinations.asMap().entries.map((entry) {
                    final index = entry.key;
                    final destination = entry.value;
                    return _buildNavigationRailItem(
                      destination: destination,
                      index: index,
                      isSelected: _selectedIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    );
                  }),

                  Divider(
                      indent: M3SpacingToken.space8.value,
                      endIndent: M3SpacingToken.space8.value),

                  // Styles section
                  const LaunchURLText(
                    label: 'Styles',
                    fontSize: 12,
                    m3Url: 'https://m3.material.io/styles',
                  ),

                  // Styles navigation items
                  ...styleDestinations.asMap().entries.map((entry) {
                    final index = entry.key + foundationDestinations.length;
                    final destination = entry.value;
                    return _buildNavigationRailItem(
                      destination: destination,
                      index: index,
                      isSelected: _selectedIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    );
                  }),

                  const M3Gap(M3SpacingToken.space24),
                ],
              ),
            ),
          ),

          // Fixed bottom controls
          Container(
            padding: M3EdgeInsets.symmetric(vertical: M3SpacingToken.space8),
            child: Column(
              children: [
                Divider(
                    indent: M3SpacingToken.space8.value,
                    endIndent: M3SpacingToken.space8.value),

                // Dark mode switch
                Column(
                  children: [
                    Switch(
                      value: themeProvider.themeMode == ThemeMode.dark,
                      onChanged: (isDark) {
                        themeProvider.changeThemeMode(
                          isDark ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                    const M3Gap(M3SpacingToken.space4),
                    const Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const M3Gap(M3SpacingToken.space12),

                // Color picker
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.color_lens,
                        color: themeProvider.seedColor,
                        size: 20,
                      ),
                      onPressed: () async {
                        final newColor = await showColorPickerDialog(context);
                        if (newColor != null) {
                          themeProvider.changeSeedColor(newColor);
                        }
                      },
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const M3Gap(M3SpacingToken.space12),

                // Demo link
                const LaunchURLText(
                  label: 'Demo',
                  fontSize: 10,
                  m3Url: 'https://flutterweb-wasm.web.app/',
                ),

                const M3Gap(M3SpacingToken.space8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a custom navigation rail item following Material Design 3 specifications.
  ///
  /// Features:
  /// - M3-compliant visual indicator for selected state
  /// - Hover animation with state layer overlay
  /// - Proper color theming with primary/secondary containers
  /// - 56dp touch target height as per M3 guidelines
  /// - Rounded 16dp corners following M3 shape tokens
  /// - Semantic icon and label positioning
  Widget _buildNavigationRailItem({
    required NavigationRailDestination destination,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return _NavigationRailItem(
      destination: destination,
      index: index,
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}

/// Custom NavigationRail item with Material Design 3 hover animations.
///
/// This stateful widget provides proper hover feedback matching the official
/// Material Design specifications, including state layer animations.
class _NavigationRailItem extends StatefulWidget {
  final NavigationRailDestination destination;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationRailItem({
    required this.destination,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavigationRailItem> createState() => _NavigationRailItemState();
}

class _NavigationRailItemState extends State<_NavigationRailItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _hoverAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _hoverAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() {
        _isHovered = isHovered;
      });

      if (isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return M3Padding.symmetric(
      vertical: M3SpacingToken.space4,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          width: 72,
          height: 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon container with M3 indicator and hover
              MouseRegion(
                onEnter: (_) => _handleHover(true),
                onExit: (_) => _handleHover(false),
                child: AnimatedBuilder(
                  animation: _hoverAnimation,
                  builder: (context, child) {
                    return Container(
                      width: 56,
                      height: 32,
                      decoration: BoxDecoration(
                        color: widget.isSelected
                            ? colorScheme.secondaryContainer
                            : !widget.isSelected
                                ? colorScheme.onSurface.withValues(
                                    alpha: 0.08 * _hoverAnimation.value,
                                  )
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        widget.isSelected
                            ? (widget.destination.selectedIcon as Icon).icon
                            : (widget.destination.icon as Icon).icon,
                        color: widget.isSelected
                            ? colorScheme.onSecondaryContainer
                            : colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),
              const M3Gap(M3SpacingToken.space4),
              // Label
              Text(
                (widget.destination.label as Text).data!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected
                      ? colorScheme.onSurface
                      : colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
