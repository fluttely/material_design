// import 'package:flutter/material.dart';
// import 'package:material_design/material_design.dart';
// import 'package:material_design_example/showcase_pages/widgets/launch_url_text.dart';

// /// Page showcasing Material Design 3 components with applied tokens
// class ComponentsShowcasePage extends StatefulWidget {
//   const ComponentsShowcasePage({super.key});

//   @override
//   State<ComponentsShowcasePage> createState() => _ComponentsShowcasePageState();
// }

// class _ComponentsShowcasePageState extends State<ComponentsShowcasePage>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   bool _isDarkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const LaunchURLText(
//           label: 'Components Showcase',
//           m3Url: 'https://m3.material.io/components',
//         ),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
//             onPressed: () {
//               setState(() {
//                 _isDarkMode = !_isDarkMode;
//               });
//             },
//           ),
//         ],
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: const [
//             Tab(icon: Icon(Icons.smart_button), text: 'Buttons'),
//             Tab(icon: Icon(Icons.article), text: 'Cards'),
//             Tab(icon: Icon(Icons.input), text: 'Inputs'),
//             Tab(icon: Icon(Icons.navigation), text: 'Navigation'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildButtonsShowcase(),
//           _buildCardsShowcase(),
//           _buildInputsShowcase(),
//           _buildNavigationShowcase(),
//         ],
//       ),
//     );
//   }

//   Widget _buildButtonsShowcase() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionHeader(
//               'Button Types', 'Different button types with M3 styling'),

//           // Standard buttons
//           _buildButtonSection('Standard Buttons', [
//             ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
//             FilledButton(onPressed: () {}, child: const Text('Filled')),
//             OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
//             TextButton(onPressed: () {}, child: const Text('Text')),
//           ]),

//           // Buttons with icons
//           _buildButtonSection('Buttons with Icons', [
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.favorite),
//               label: const Text('Elevated'),
//             ),
//             FilledButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.star),
//               label: const Text('Filled'),
//             ),
//             OutlinedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.bookmark),
//               label: const Text('Outlined'),
//             ),
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.share),
//               label: const Text('Text'),
//             ),
//           ]),

//           // Disabled buttons
//           _buildButtonSection('Disabled States', [
//             const ElevatedButton(onPressed: null, child: Text('Elevated')),
//             const FilledButton(onPressed: null, child: Text('Filled')),
//             const OutlinedButton(onPressed: null, child: Text('Outlined')),
//             const TextButton(onPressed: null, child: Text('Text')),
//           ]),

//           // Icon buttons
//           _buildSectionHeader('Icon Buttons', 'Various icon button styles'),
//           Wrap(
//             spacing: M3Spacing.space8,
//             runSpacing: M3Spacing.space8,
//             children: [
//               IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
//               IconButton.filled(onPressed: () {}, icon: const Icon(Icons.star)),
//               IconButton.outlined(
//                   onPressed: () {}, icon: const Icon(Icons.bookmark)),
//               IconButton.filledTonal(
//                   onPressed: () {}, icon: const Icon(Icons.share)),
//             ],
//           ),

//           const SizedBox(height: M3Spacing.space24),

//           // FAB
//           _buildSectionHeader('Floating Action Buttons', 'FAB variations'),
//           Wrap(
//             spacing: M3Spacing.space16,
//             runSpacing: M3Spacing.space16,
//             children: [
//               FloatingActionButton.small(
//                 onPressed: () {},
//                 child: const Icon(Icons.add),
//               ),
//               FloatingActionButton(
//                 onPressed: () {},
//                 child: const Icon(Icons.add),
//               ),
//               FloatingActionButton.extended(
//                 onPressed: () {},
//                 icon: const Icon(Icons.add),
//                 label: const Text('Extended'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCardsShowcase() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionHeader(
//               'Card Types', 'Different card styles with M3 elevation'),

//           // Basic cards
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(M3Spacing.space16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Basic Card',
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const SizedBox(height: M3Spacing.space8),
//                   Text(
//                       'This is a basic card with default elevation and styling.',
//                       style: Theme.of(context).textTheme.bodyMedium),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           // Elevated card
//           Card(
//             elevation: 6.0,
//             child: Padding(
//               padding: const EdgeInsets.all(M3Spacing.space16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Elevated Card',
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const SizedBox(height: M3Spacing.space8),
//                   Text('This card has higher elevation (6dp) for emphasis.',
//                       style: Theme.of(context).textTheme.bodyMedium),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           // Interactive card with actions
//           Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(M3Spacing.space16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Interactive Card',
//                           style: Theme.of(context).textTheme.titleMedium),
//                       const SizedBox(height: M3Spacing.space8),
//                       Text(
//                           'Cards can contain actions and interactive elements.',
//                           style: Theme.of(context).textTheme.bodyMedium),
//                     ],
//                   ),
//                 ),
//                 OverflowBar(
//                   alignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(onPressed: () {}, child: const Text('Action 1')),
//                     TextButton(onPressed: () {}, child: const Text('Action 2')),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space24),

//           // List cards
//           _buildSectionHeader('List Cards', 'Cards with list items'),
//           Card(
//             child: Column(
//               children: [
//                 ListTile(
//                   leading: const Icon(Icons.person),
//                   title: const Text('List Item 1'),
//                   subtitle: const Text('Subtitle text'),
//                   trailing: const Icon(Icons.arrow_forward_ios),
//                   onTap: () {},
//                 ),
//                 const Divider(height: 1),
//                 ListTile(
//                   leading: const Icon(Icons.email),
//                   title: const Text('List Item 2'),
//                   subtitle: const Text('Another subtitle'),
//                   trailing: const Icon(Icons.arrow_forward_ios),
//                   onTap: () {},
//                 ),
//                 const Divider(height: 1),
//                 ListTile(
//                   leading: const Icon(Icons.phone),
//                   title: const Text('List Item 3'),
//                   subtitle: const Text('Final subtitle'),
//                   trailing: const Icon(Icons.arrow_forward_ios),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInputsShowcase() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionHeader(
//               'Input Fields', 'Various input styles and states'),

//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Standard TextField',
//               helperText: 'Helper text goes here',
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'With Icon',
//               prefixIcon: Icon(Icons.person),
//               suffixIcon: Icon(Icons.visibility),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Error State',
//               errorText: 'This field has an error',
//               prefixIcon: Icon(Icons.error),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space24),

//           _buildSectionHeader('Selections', 'Checkboxes, switches, and chips'),

//           CheckboxListTile(
//             title: const Text('Checkbox'),
//             subtitle: const Text('This is a checkbox'),
//             value: true,
//             onChanged: (value) {},
//           ),

//           SwitchListTile(
//             title: const Text('Switch'),
//             subtitle: const Text('This is a switch'),
//             value: true,
//             onChanged: (value) {},
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           // Chips
//           Wrap(
//             spacing: M3Spacing.space8,
//             children: [
//               Chip(
//                 label: const Text('Chip'),
//                 onDeleted: () {},
//               ),
//               FilterChip(
//                 label: const Text('Filter'),
//                 selected: true,
//                 onSelected: (selected) {},
//               ),
//               ChoiceChip(
//                 label: const Text('Choice'),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavigationShowcase() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(M3Spacing.space16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionHeader(
//               'Navigation Components', 'Different navigation patterns'),

//           // Bottom navigation preview
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(M3Spacing.space16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Bottom Navigation Bar',
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const SizedBox(height: M3Spacing.space16),
//                   Container(
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.surfaceContainerHighest,
//                       borderRadius: BorderRadius.circular(M3Radius.medium),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _buildNavItem(Icons.home, 'Home', true),
//                         _buildNavItem(Icons.search, 'Search', false),
//                         _buildNavItem(Icons.favorite, 'Favorites', false),
//                         _buildNavItem(Icons.person, 'Profile', false),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           // Navigation rail preview
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(M3Spacing.space16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Navigation Rail',
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const SizedBox(height: M3Spacing.space16),
//                   Row(
//                     children: [
//                       Container(
//                         width: 80,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.surfaceContainerHighest,
//                           borderRadius: BorderRadius.circular(M3Radius.medium),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             _buildRailItem(Icons.home, true),
//                             _buildRailItem(Icons.search, false),
//                             _buildRailItem(Icons.favorite, false),
//                             _buildRailItem(Icons.person, false),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: M3Spacing.space16),
//                       Expanded(
//                         child: Container(
//                           height: 200,
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).colorScheme.surface,
//                             borderRadius:
//                                 BorderRadius.circular(M3Radius.medium),
//                             border: Border.all(
//                                 color: Theme.of(context).colorScheme.outline),
//                           ),
//                           child: const Center(
//                             child: Text('Content Area'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const SizedBox(height: M3Spacing.space16),

//           // Breadcrumbs
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(M3Spacing.space16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Breadcrumbs',
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const SizedBox(height: M3Spacing.space16),
//                   Row(
//                     children: [
//                       TextButton(onPressed: () {}, child: const Text('Home')),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                       TextButton(
//                           onPressed: () {}, child: const Text('Category')),
//                       const Icon(Icons.arrow_forward_ios, size: 16),
//                       Text('Current Page',
//                           style: Theme.of(context).textTheme.bodyMedium),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title, String description) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: Theme.of(context).textTheme.headlineSmall),
//         const SizedBox(height: M3Spacing.space4),
//         Text(description,
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: Theme.of(context).colorScheme.onSurfaceVariant,
//                 )),
//         const SizedBox(height: M3Spacing.space16),
//       ],
//     );
//   }

//   Widget _buildButtonSection(String title, List<Widget> buttons) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: Theme.of(context).textTheme.titleMedium),
//         const SizedBox(height: M3Spacing.space12),
//         Wrap(
//           spacing: M3Spacing.space8,
//           runSpacing: M3Spacing.space8,
//           children: buttons,
//         ),
//         const SizedBox(height: M3Spacing.space24),
//       ],
//     );
//   }

//   Widget _buildNavItem(IconData icon, String label, bool isSelected) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: isSelected
//                 ? Theme.of(context).colorScheme.secondaryContainer
//                 : null,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Icon(
//             icon,
//             color: isSelected
//                 ? Theme.of(context).colorScheme.onSecondaryContainer
//                 : Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: isSelected
//                 ? Theme.of(context).colorScheme.onSurface
//                 : Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRailItem(IconData icon, bool isSelected) {
//     return Container(
//       width: 56,
//       height: 32,
//       decoration: BoxDecoration(
//         color: isSelected
//             ? Theme.of(context).colorScheme.secondaryContainer
//             : null,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Icon(
//         icon,
//         color: isSelected
//             ? Theme.of(context).colorScheme.onSecondaryContainer
//             : Theme.of(context).colorScheme.onSurfaceVariant,
//       ),
//     );
//   }
// }
