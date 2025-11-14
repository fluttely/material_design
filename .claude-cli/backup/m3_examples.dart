// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';

// /// Example widgets demonstrating Material Design 3 enhanced features.
// class M3Examples {
//   /// Demonstrates adaptive design patterns.
//   static Widget adaptiveExample() {
//     return M3AdaptiveScaffold(
//       appBar: AppBar(title: const Text('Adaptive Design')),
//       destinations: const [
//         NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//         NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
//         NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//       selectedIndex: 0,
//       onDestinationSelected: (index) {},
//       body: const _AdaptiveContent(),
//     );
//   }

//   /// Demonstrates accessibility features.
//   static Widget accessibilityExample() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Accessibility Features')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(M3Spacing.space16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // High contrast button
//             M3Accessibility.accessibleButton(
//               onPressed: () {},
//               semanticLabel: 'Accessible button with high contrast',
//               tooltip: 'This button meets accessibility standards',
//               child: const Text('Accessible Button'),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Accessible text field
//             M3Accessibility.accessibleTextField(
//               label: 'Email Address',
//               hint: 'Enter your email',
//               required: true,
//               keyboardType: TextInputType.emailAddress,
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Focus indicator example
//             M3Accessibility.focusIndicator(
//               child: Container(
//                 padding: const EdgeInsets.all(M3Spacing.space12),
//                 child: const Text('Focus on me!'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Demonstrates enhanced typography features.
//   static Widget typographyExample() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Enhanced Typography')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(M3Spacing.space16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Responsive display text
//             Builder(
//               builder: (context) => Text(
//                 'Responsive Display',
//                 style: M3TypeScale.responsiveDisplay(context),
//               ),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Enhanced readability text
//             Text(
//               'This text has enhanced readability for accessibility',
//               style: M3TypeScale.enhancedReadability(M3TypeScale.bodyLarge),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // High contrast text
//             Text(
//               'High Contrast Text',
//               style: M3TypeScale.highContrast(M3TypeScale.headlineMedium),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Monospace variant
//             Text(
//               'function main() {\n  print("Hello, World!");\n}',
//               style: M3TypeScale.monoVariant(M3TypeScale.bodyMedium),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Demonstrates color system enhancements.
//   static Widget colorSystemExample() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Enhanced Color System')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(M3Spacing.space16),
//         child: Column(
//           children: [
//             // Color roles demonstration
//             _ColorRoleCard(
//                 'Primary', M3SysColor.primary, M3SysColor.onPrimary),
//             _ColorRoleCard(
//                 'Secondary', M3SysColor.secondary, M3SysColor.onSecondary),
//             _ColorRoleCard(
//                 'Tertiary', M3SysColor.tertiary, M3SysColor.onTertiary),
//             _ColorRoleCard('Error', M3SysColor.error, M3SysColor.onError),

//             const SizedBox(height: M3Spacer.pane),

//             // Surface colors with elevation
//             Builder(
//               builder: (context) => Column(
//                 children: [
//                   _SurfaceCard('Surface Level 0', 0),
//                   _SurfaceCard('Surface Level 1', 1),
//                   _SurfaceCard('Surface Level 2', 3),
//                   _SurfaceCard('Surface Level 3', 6),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Demonstrates motion and animation patterns.
//   static Widget motionExample() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Motion Patterns')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(M3Spacing.space16),
//         child: Column(
//           children: [
//             // Fade in animation
//             M3MotionUtils.fadeIn(
//               child: const Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(M3Spacing.space16),
//                   child: Text('Fade In Animation'),
//                 ),
//               ),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Slide up animation
//             M3MotionUtils.slideUp(
//               child: const Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(M3Spacing.space16),
//                   child: Text('Slide Up Animation'),
//                 ),
//               ),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Scale in animation
//             M3MotionUtils.scaleIn(
//               child: const Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(M3Spacing.space16),
//                   child: Text('Scale In Animation'),
//                 ),
//               ),
//             ),

//             const SizedBox(height: M3Spacing.space16),

//             // Slide and fade animation
//             M3MotionUtils.slideAndFade(
//               child: const Card(
//                 child: Padding(
//                   padding: EdgeInsets.all(M3Spacing.space16),
//                   child: Text('Slide and Fade Animation'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Demonstrates shape system enhancements.
//   static Widget shapeExample() {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Enhanced Shape System')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(M3Spacing.space16),
//         child: Wrap(
//           spacing: M3Spacing.space16,
//           runSpacing: M3Spacing.space16,
//           children: [
//             // Different shape styles
//             _ShapeCard('None', M3ShapeUtils.squared()),
//             _ShapeCard(
//                 'Extra Small', M3ShapeUtils.rounded(M3Radius.extraSmall)),
//             _ShapeCard('Small', M3ShapeUtils.rounded(M3Radius.small)),
//             _ShapeCard('Medium', M3ShapeUtils.rounded(M3Radius.medium)),
//             _ShapeCard('Large', M3ShapeUtils.rounded(M3Radius.large)),
//             _ShapeCard(
//                 'Extra Large', M3ShapeUtils.rounded(M3Radius.extraLarge)),

//             // Asymmetric shapes
//             _ShapeCard('Top Rounded', M3ShapeUtils.topRounded(M3Radius.large)),
//             _ShapeCard(
//                 'Bottom Rounded', M3ShapeUtils.bottomRounded(M3Radius.large)),

//             // Brand shapes
//             _ShapeCard(
//                 'Playful',
//                 M3ShapeUtils.brandShape(
//                   primary: M3Radius.large,
//                   style: BrandShapeStyle.playful,
//                 )),
//             _ShapeCard(
//                 'Modern',
//                 M3ShapeUtils.brandShape(
//                   primary: M3Radius.large,
//                   style: BrandShapeStyle.modern,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Helper widgets for examples

// class _AdaptiveContent extends StatelessWidget {
//   const _AdaptiveContent();

//   @override
//   Widget build(BuildContext context) {
//     return M3Adaptive.responsiveLayout(
//       context: context,
//       compact: const _CompactLayout(),
//       medium: const _MediumLayout(),
//       expanded: const _ExpandedLayout(),
//     );
//   }
// }

// class _CompactLayout extends StatelessWidget {
//   const _CompactLayout();

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.phone_android, size: 64),
//           SizedBox(height: M3Spacing.space16),
//           Text('Compact Layout\n(Mobile Portrait)',
//               textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class _MediumLayout extends StatelessWidget {
//   const _MediumLayout();

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.tablet_android, size: 64),
//           SizedBox(height: M3Spacing.space16),
//           Text('Medium Layout\n(Tablet/Mobile Landscape)',
//               textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class _ExpandedLayout extends StatelessWidget {
//   const _ExpandedLayout();

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.desktop_windows, size: 64),
//           SizedBox(height: M3Spacing.space16),
//           Text('Expanded Layout\n(Desktop)', textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class _ColorRoleCard extends StatelessWidget {
//   final String name;
//   final Color backgroundColor;
//   final Color textColor;

//   const _ColorRoleCard(this.name, this.backgroundColor, this.textColor);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       margin: const EdgeInsets.only(bottom: M3Spacing.space8),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(M3Radius.medium),
//       ),
//       child: Text(
//         name,
//         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//               color: textColor,
//             ),
//       ),
//     );
//   }
// }

// class _SurfaceCard extends StatelessWidget {
//   final String label;
//   final double elevation;

//   const _SurfaceCard(this.label, this.elevation);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       margin: const EdgeInsets.only(bottom: M3Spacing.space8),
//       decoration: BoxDecoration(
//         color: M3TonalColor.surfaceAt(context, elevation),
//         borderRadius: BorderRadius.circular(M3Radius.medium),
//         boxShadow: M3Shadow.fromElevation(elevation),
//       ),
//       child: Text(
//         '$label (${elevation}dp)',
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//     );
//   }
// }

// class _ShapeCard extends StatelessWidget {
//   final String label;
//   final BorderRadius borderRadius;

//   const _ShapeCard(this.label, this.borderRadius);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       height: 80,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.primaryContainer,
//         borderRadius: borderRadius,
//       ),
//       child: Center(
//         child: Text(
//           label,
//           style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                 color: Theme.of(context).colorScheme.onPrimaryContainer,
//               ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
