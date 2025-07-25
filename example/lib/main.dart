import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// Entry point of the Material Design 3 Demo application.
///
/// This demo showcases the comprehensive Material Design 3 token system,
/// including foundations, styles, and components with proper responsive
/// design patterns and adaptive theming capabilities.
void main() {
  runApp(const MaterialDesignDemo());
}

/// Root application widget that demonstrates Material Design 3 capabilities.
///
/// Features:
/// - Dynamic color theming with seed color customization
/// - Light/dark mode switching with proper M3 color schemes
/// - Responsive layout patterns following M3 breakpoint guidelines
/// - Comprehensive showcase of M3 tokens, components, and patterns
class MaterialDesignDemo extends StatefulWidget {
  const MaterialDesignDemo({super.key});

  @override
  State<MaterialDesignDemo> createState() => _MaterialDesignDemoState();
}

class _MaterialDesignDemoState extends State<MaterialDesignDemo>
    with TickerProviderStateMixin {
  /// Current theme mode (light/dark)
  ThemeMode _themeMode = ThemeMode.light;

  /// Seed color for dynamic color generation
  Color _seedColor = Colors.blue;

  /// Animation controller for theme transitions
  late AnimationController _themeAnimationController;

  @override
  void initState() {
    super.initState();
    _themeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _themeAnimationController.dispose();
    super.dispose();
  }

  /// Toggles between light and dark theme with smooth animation
  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
    _themeAnimationController.forward().then((_) {
      _themeAnimationController.reverse();
    });
  }

  /// Changes the seed color for dynamic theming
  void _changeSeedColor(Color color) {
    setState(() {
      _seedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeAnimationController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Material Design 3 Demo',
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: _themeMode,
          debugShowCheckedModeBanner: false,
          home: DemoHomePage(
            onThemeToggle: _toggleTheme,
            onSeedColorChange: _changeSeedColor,
            currentSeedColor: _seedColor,
            isDark: _themeMode == ThemeMode.dark,
            themeAnimationValue: _themeAnimationController.value,
          ),
        );
      },
    );
  }

  /// Builds the light theme with M3 specifications
  ThemeData _buildLightTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(
      // Enhanced M3 component themes
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainer,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: M3BorderRadiusToken.medium.value,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: M3BorderRadiusToken.full.value,
          ),
        ),
      ),
    );
  }

  /// Builds the dark theme with M3 specifications
  ThemeData _buildDarkTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(
      // Enhanced M3 component themes for dark mode
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainer,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: M3BorderRadiusToken.medium.value,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: M3BorderRadiusToken.full.value,
          ),
        ),
      ),
    );
  }
}

/// Main demo page showcasing Material Design 3 tokens and components.
///
/// Implements responsive design patterns following M3 breakpoint guidelines:
/// - Compact: < 600dp (mobile portrait)
/// - Medium: 600-839dp (mobile landscape, small tablet)
/// - Expanded: 840-1199dp (tablet, small desktop)
/// - Large: 1200-1599dp (desktop)
/// - Extra Large: ≥ 1600dp (large desktop)
class DemoHomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final Function(Color) onSeedColorChange;
  final Color currentSeedColor;
  final bool isDark;
  final double themeAnimationValue;

  const DemoHomePage({
    super.key,
    required this.onThemeToggle,
    required this.onSeedColorChange,
    required this.currentSeedColor,
    required this.isDark,
    required this.themeAnimationValue,
  });

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage>
    with TickerProviderStateMixin {
  /// Current elevation value for demonstration
  double _elevation = 1.0;

  /// Current visual density setting
  VisualDensity _visualDensity = M3VisualDensityToken.standard.value;

  /// Animation controller for page transitions
  late AnimationController _pageAnimationController;

  /// Animation controller for component demonstrations
  late AnimationController _componentAnimationController;

  /// Current selected navigation index
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _componentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Start with a subtle entrance animation
    _pageAnimationController.forward();
  }

  @override
  void dispose() {
    _pageAnimationController.dispose();
    _componentAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final breakpoint = _getCurrentBreakpoint(screenSize.width);

    return AnimatedBuilder(
      animation: _pageAnimationController,
      builder: (context, child) {
        return Scaffold(
          appBar: _buildAppBar(context, colorScheme),
          body: _buildResponsiveBody(context, breakpoint),
          floatingActionButton: _buildFloatingActionButton(context),
          bottomNavigationBar: breakpoint == M3WindowSizeClass.compact
              ? _buildBottomNavigationBar(context)
              : null,
        );
      },
    );
  }

  /// Determines the current M3 breakpoint based on screen width
  M3WindowSizeClass _getCurrentBreakpoint(double width) {
    if (width < M3BreakpointToken.medium.value)
      return M3WindowSizeClass.compact;
    if (width < M3BreakpointToken.expanded.value)
      return M3WindowSizeClass.medium;
    if (width < M3BreakpointToken.large.value)
      return M3WindowSizeClass.expanded;
    if (width < M3BreakpointToken.extraLarge.value)
      return M3WindowSizeClass.large;
    return M3WindowSizeClass.extraLarge;
  }

  /// Builds the responsive app bar with M3 specifications
  PreferredSizeWidget _buildAppBar(
      BuildContext context, ColorScheme colorScheme) {
    return AppBar(
      title: AnimatedOpacity(
        opacity: 1.0 - (widget.themeAnimationValue * 0.3),
        duration: const Duration(milliseconds: 300),
        child: const Text('Material Design 3 Demo'),
      ),
      actions: [
        AnimatedRotation(
          turns: widget.themeAnimationValue * 0.5,
          duration: const Duration(milliseconds: 300),
          child: IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeToggle,
            tooltip: 'Toggle theme mode',
          ),
        ),
        _ColorPickerButton(
          currentColor: widget.currentSeedColor,
          onColorChanged: widget.onSeedColorChange,
        ),
        SizedBox(width: M3SpacingToken.space8.value),
      ],
    );
  }

  /// Builds the responsive body layout based on current breakpoint
  Widget _buildResponsiveBody(
      BuildContext context, M3WindowSizeClass breakpoint) {
    switch (breakpoint) {
      case M3WindowSizeClass.compact:
        return _buildCompactLayout(context);
      case M3WindowSizeClass.medium:
      case M3WindowSizeClass.expanded:
        return _buildMediumLayout(context);
      case M3WindowSizeClass.large:
      case M3WindowSizeClass.extraLarge:
        return _buildLargeLayout(context);
    }
  }

  /// Compact layout for mobile devices
  Widget _buildCompactLayout(BuildContext context) {
    return _buildMainContent(context, padding: M3SpacingToken.space16.value);
  }

  /// Medium layout for tablets and small desktops
  Widget _buildMediumLayout(BuildContext context) {
    return Row(
      children: [
        _buildNavigationRail(context),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child:
              _buildMainContent(context, padding: M3SpacingToken.space24.value),
        ),
      ],
    );
  }

  /// Large layout for desktop devices
  Widget _buildLargeLayout(BuildContext context) {
    return Row(
      children: [
        _buildNavigationRail(context),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          flex: 2,
          child:
              _buildMainContent(context, padding: M3SpacingToken.space32.value),
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: _buildSidePanel(context),
        ),
      ],
    );
  }

  /// Builds the navigation rail for larger screens
  Widget _buildNavigationRail(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.selected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.foundation_outlined),
          selectedIcon: Icon(Icons.foundation),
          label: Text('Foundations'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.style_outlined),
          selectedIcon: Icon(Icons.style),
          label: Text('Styles'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.widgets_outlined),
          selectedIcon: Icon(Icons.widgets),
          label: Text('Components'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.tune_outlined),
          selectedIcon: Icon(Icons.tune),
          label: Text('Interactive'),
        ),
      ],
    );
  }

  /// Builds the bottom navigation bar for compact screens
  Widget _buildBottomNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.foundation_outlined),
          selectedIcon: Icon(Icons.foundation),
          label: 'Foundations',
        ),
        NavigationDestination(
          icon: Icon(Icons.style_outlined),
          selectedIcon: Icon(Icons.style),
          label: 'Styles',
        ),
        NavigationDestination(
          icon: Icon(Icons.widgets_outlined),
          selectedIcon: Icon(Icons.widgets),
          label: 'Components',
        ),
        NavigationDestination(
          icon: Icon(Icons.tune_outlined),
          selectedIcon: Icon(Icons.tune),
          label: 'Interactive',
        ),
      ],
    );
  }

  /// Builds the main content area
  Widget _buildMainContent(BuildContext context, {required double padding}) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: FadeTransition(
        opacity: _pageAnimationController,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _pageAnimationController,
            curve: Curves.easeOutCubic,
          )),
          child: _buildSelectedSection(),
        ),
      ),
    );
  }

  /// Builds the selected section based on navigation index
  Widget _buildSelectedSection() {
    switch (_selectedIndex) {
      case 0:
        return _buildFoundationsContent();
      case 1:
        return _buildStylesContent();
      case 2:
        return _buildComponentsContent();
      case 3:
        return _buildInteractiveContent();
      default:
        return _buildFoundationsContent();
    }
  }

  /// Builds the side panel for large screens
  Widget _buildSidePanel(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(M3SpacingToken.space16.value),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(context),
          SizedBox(height: M3SpacingToken.space16.value),
          _buildQuickActions(context),
        ],
      ),
    );
  }

  /// Builds the floating action button with M3 styling
  Widget? _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        _componentAnimationController.forward().then((_) {
          _componentAnimationController.reverse();
        });
      },
      icon: AnimatedRotation(
        turns: _componentAnimationController.value,
        duration: const Duration(milliseconds: 200),
        child: const Icon(Icons.refresh),
      ),
      label: const Text('Refresh Demo'),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Material Design 3 Library Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            Text(
              'This demo showcases the key features of the Material Design 3 library, including design tokens, components, and utilities.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: M3SpacingToken.space12.value),
            Wrap(
              spacing: M3SpacingToken.space8.value,
              children: [
                Chip(
                  label: Text(
                      'Screen: ${MediaQuery.of(context).size.width.toInt()}px'),
                  avatar: const Icon(Icons.aspect_ratio, size: 16),
                ),
                Chip(
                  label: Text('Breakpoint: ${_getCurrentBreakpointName()}'),
                  avatar: const Icon(Icons.devices, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentBreakpointName() {
    final width = MediaQuery.of(context).size.width;
    if (width < M3BreakpointToken.medium.value) return 'Compact';
    if (width < M3BreakpointToken.expanded.value) return 'Medium';
    if (width < M3BreakpointToken.large.value) return 'Expanded';
    if (width < M3BreakpointToken.extraLarge.value) return 'Large';
    return 'Extra Large';
  }

  String _getDensityName(VisualDensity density) {
    if (density == M3VisualDensityToken.standard.value) return 'Standard';
    if (density == M3VisualDensityToken.comfortable.value) return 'Comfortable';
    if (density == M3VisualDensityToken.compact.value) return 'Compact';
    if (density == M3VisualDensityToken.adaptivePlatformDensity.value)
      return 'Adaptive';
    return 'Custom';
  }

  Widget _buildSpacingDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spacing Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            M3SpacingToken.space4,
            M3SpacingToken.space8,
            M3SpacingToken.space12,
            M3SpacingToken.space16,
            M3SpacingToken.space24,
            M3SpacingToken.space32,
          ].map((token) => _SpacingExample(token: token)).toList(),
        ),
      ],
    );
  }

  Widget _buildVisualDensityDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Visual Density', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          children: [
            M3VisualDensityToken.standard,
            M3VisualDensityToken.comfortable,
            M3VisualDensityToken.compact,
            M3VisualDensityToken.adaptivePlatformDensity,
          ]
              .map(
                (density) => FilterChip(
                  label: Text(_getDensityName(density.value)),
                  selected: _visualDensity == density.value,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _visualDensity = density.value);
                    }
                  },
                ),
              )
              .toList(),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        Card(
          color: Theme.of(context).colorScheme.onPrimary,
          child: ListTile(
            title: Text(
                'List item with ${_getDensityName(_visualDensity)} density'),
            subtitle: Text('Density value: $_visualDensity'),
            leading: const Icon(Icons.density_medium),
            visualDensity: _visualDensity,
          ),
        ),
      ],
    );
  }

  Widget _buildOpacityDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Opacity Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          spacing: M3SpacingToken.space16.value,
          children: [
            _OpacityExample(
                token: M3StateLayerOpacityToken.hover, label: 'Hover'),
            _OpacityExample(
                token: M3StateLayerOpacityToken.focus, label: 'Focus'),
            _OpacityExample(
                token: M3StateLayerOpacityToken.pressed, label: 'Pressed'),
            _OpacityExample(
                token: M3StateLayerOpacityToken.dragged, label: 'Dragged'),
          ],
        ),
      ],
    );
  }

  Widget _buildBorderDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Border Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          spacing: M3SpacingToken.space16.value,
          children: [
            M3BorderToken.thin,
            M3BorderToken.thick,
            M3BorderToken.extraThick,
          ]
              .map((token) => Expanded(
                    child: Container(
                      padding: EdgeInsets.all(M3SpacingToken.space12.value),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: token.value,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        borderRadius: M3BorderRadiusToken.small.value,
                      ),
                      child: Text(
                        '${token.name}\n${token.value}px',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildColorDemo(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color Scheme', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            _ColorSwatch(color: colorScheme.primary, label: 'Primary'),
            _ColorSwatch(color: colorScheme.secondary, label: 'Secondary'),
            _ColorSwatch(color: colorScheme.tertiary, label: 'Tertiary'),
            _ColorSwatch(color: colorScheme.error, label: 'Error'),
            _ColorSwatch(color: colorScheme.surface, label: 'Surface'),
            _ColorSwatch(
                color: colorScheme.surfaceContainer,
                label: 'Surface Container'),
          ],
        ),
      ],
    );
  }

  Widget _buildTypographyDemo(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Typography Scale',
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Display Large', style: textTheme.displayLarge),
            Text('Headline Large', style: textTheme.headlineLarge),
            Text('Title Large', style: textTheme.titleLarge),
            Text('Body Large', style: textTheme.bodyLarge),
            Text('Label Large', style: textTheme.labelLarge),
          ],
        ),
      ],
    );
  }

  Widget _buildShapeDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shape Tokens', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          spacing: M3SpacingToken.space16.value,
          children: [
            M3ShapeToken.none,
            M3ShapeToken.small,
            M3ShapeToken.medium,
            M3ShapeToken.large,
            M3ShapeToken.extraLarge,
          ]
              .map((token) => Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: M3BorderRadiusToken.values
                            .firstWhere((r) => r.name == token.name)
                            .value,
                      ),
                      child: Center(
                        child: Text(
                          token.name,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildElevationDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Elevation', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Text('Current elevation: ${_elevation.toInt()}'),
        Slider(
          value: _elevation,
          min: 0,
          max: 5,
          divisions: 5,
          onChanged: (value) => setState(() => _elevation = value),
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        Card(
          elevation: _elevation,
          child: Padding(
            padding: EdgeInsets.all(M3SpacingToken.space16.value),
            child: Text('Card with elevation ${_elevation.toInt()}'),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buttons', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cards', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Row(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Elevated Card',
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text('Default Material 3 card with elevation',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: M3SpacingToken.space8.value),
            Expanded(
              child: Card.outlined(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Outlined Card',
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: M3SpacingToken.space8.value),
                      Text('Card with outline border',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChipsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chips', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            const Chip(
              label: Text('Assist Chip'),
              avatar: Icon(Icons.star, size: 16),
            ),
            FilterChip(
              label: const Text('Filter Chip'),
              selected: true,
              onSelected: (value) {},
            ),
            InputChip(
              label: const Text('Input Chip'),
              onDeleted: () {},
            ),
            ActionChip(
              label: const Text('Action Chip'),
              onPressed: () {},
              avatar: const Icon(Icons.settings, size: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Navigation', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        const Text('Navigation components adapt based on screen size:'),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          runSpacing: M3SpacingToken.space8.value,
          children: [
            const Chip(
              label: Text('NavigationRail (≥ Medium)'),
              avatar: Icon(Icons.view_sidebar, size: 16),
            ),
            const Chip(
              label: Text('NavigationBar (Compact)'),
              avatar: Icon(Icons.navigation, size: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quick Actions',
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: M3SpacingToken.space12.value),
            FilledButton.icon(
              onPressed: widget.onThemeToggle,
              icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
              label: Text(widget.isDark ? 'Light Mode' : 'Dark Mode'),
            ),
            SizedBox(height: M3SpacingToken.space8.value),
            OutlinedButton.icon(
              onPressed: () {
                _componentAnimationController.forward().then((_) {
                  _componentAnimationController.reverse();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Theme Controls', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Toggle between light and dark themes'),
          value: widget.isDark,
          onChanged: (value) => widget.onThemeToggle(),
        ),
      ],
    );
  }

  Widget _buildSeedColorPicker(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Seed Colors', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        Wrap(
          spacing: M3SpacingToken.space8.value,
          children: [
            Colors.blue,
            Colors.red,
            Colors.green,
            Colors.purple,
            Colors.orange,
            Colors.teal,
          ]
              .map((color) => _AnimatedColorSwatch(
                    color: color,
                    isSelected: widget.currentSeedColor == color,
                    onTap: () => widget.onSeedColorChange(color),
                    outlineColor: colorScheme.outline,
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildAnimationDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Animations', style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: M3SpacingToken.space8.value),
        AnimatedBuilder(
          animation: _componentAnimationController,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (_componentAnimationController.value * 0.1),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(M3SpacingToken.space16.value),
                  child: Row(
                    children: [
                      Icon(
                        Icons.animation,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: M3SpacingToken.space8.value),
                      const Text('Animated component demo'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  /// Builds the foundations content section
  Widget _buildFoundationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(context),
        SizedBox(height: M3SpacingToken.space24.value),
        _SectionCard(
          title: 'Foundations',
          subtitle: 'Design tokens and system foundations',
          children: [
            _buildSpacingDemo(),
            SizedBox(height: M3SpacingToken.space16.value),
            _buildVisualDensityDemo(),
            SizedBox(height: M3SpacingToken.space16.value),
            _buildOpacityDemo(),
            SizedBox(height: M3SpacingToken.space16.value),
            _buildBorderDemo(),
          ],
        ),
      ],
    );
  }

  /// Builds the styles content section
  Widget _buildStylesContent() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return _SectionCard(
      title: 'Styles',
      subtitle: 'Colors, typography, shapes, and elevation',
      children: [
        _buildColorDemo(colorScheme),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildTypographyDemo(textTheme),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildShapeDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildElevationDemo(),
      ],
    );
  }

  /// Builds the components content section
  Widget _buildComponentsContent() {
    return _SectionCard(
      title: 'Components',
      subtitle: 'Material Design 3 components showcase',
      children: [
        _buildButtonsDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildCardsDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildChipsDemo(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildNavigationDemo(),
      ],
    );
  }

  /// Builds the interactive content section
  Widget _buildInteractiveContent() {
    final colorScheme = Theme.of(context).colorScheme;

    return _SectionCard(
      title: 'Interactive Demo',
      subtitle: 'Test theme switching and adaptive behavior',
      children: [
        _buildThemeControls(),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildSeedColorPicker(colorScheme),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildAnimationDemo(),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: M3SpacingToken.space16.value),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _AnimatedColorSwatch extends StatefulWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  final Color outlineColor;

  const _AnimatedColorSwatch({
    required this.color,
    required this.isSelected,
    required this.onTap,
    required this.outlineColor,
  });

  @override
  State<_AnimatedColorSwatch> createState() => _AnimatedColorSwatchState();
}

class _AnimatedColorSwatchState extends State<_AnimatedColorSwatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
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
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                  border: widget.isSelected
                      ? Border.all(color: widget.outlineColor, width: 3)
                      : _isHovered
                          ? Border.all(color: widget.outlineColor, width: 1)
                          : null,
                  boxShadow: _isHovered || widget.isSelected
                      ? [
                          BoxShadow(
                            color: widget.color.withValues(alpha: 0.3),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorSwatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: M3BorderRadiusToken.small.value,
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _SpacingExample extends StatelessWidget {
  final M3SpacingToken token;

  const _SpacingExample({required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: token.value,
          height: 20,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          '${token.name}\n${token.value}px',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _OpacityExample extends StatelessWidget {
  final M3StateLayerOpacityToken token;
  final String label;

  const _OpacityExample({required this.token, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: token.value),
            borderRadius: M3BorderRadiusToken.small.value,
          ),
        ),
        SizedBox(height: M3SpacingToken.space4.value),
        Text(
          '$label\n${(token.value * 100).toInt()}%',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ColorPickerButton extends StatelessWidget {
  final Color currentColor;
  final Function(Color) onColorChanged;

  const _ColorPickerButton({
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      icon: Icon(Icons.color_lens, color: currentColor),
      tooltip: 'Change seed color',
      onSelected: onColorChanged,
      itemBuilder: (context) => [
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.purple,
        Colors.orange,
        Colors.teal,
        Colors.pink,
        Colors.indigo,
      ]
          .map((color) => PopupMenuItem(
                value: color,
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outlineVariant,
                          width: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
