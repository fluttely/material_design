import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

/// A comprehensive page demonstrating Material Design 3 accessibility features and best practices.
/// Shows practical examples of WCAG compliance, touch targets, semantic labels, and more.
class AccessibilityPage extends StatefulWidget {
  const AccessibilityPage({super.key});

  @override
  State<AccessibilityPage> createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage>
    with TickerProviderStateMixin {
  // Form state
  bool _acceptTerms = false;
  bool _enableNotifications = true;

  // Animation controllers for demonstrations
  late AnimationController _pulseController;
  late AnimationController _focusController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _focusController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _focusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Showcase'),
        backgroundColor: colorScheme.surface,
        automaticallyImplyLeading: false,
        actions: [
          Semantics(
            label: 'Open accessibility information',
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _showAccessibilityInfo(),
              tooltip: 'Learn about accessibility features',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroCard(),
            SizedBox(height: M3SpacingToken.space24.value),
            _buildSection(
              icon: Icons.touch_app,
              title: 'Touch Targets & Sizing',
              subtitle:
                  'Minimum 48x48dp touch targets for all interactive elements.',
              content: _buildTouchTargetsShowcase(),
            ),
            _buildSection(
              icon: Icons.label,
              title: 'Semantic Labels',
              subtitle: 'Clear descriptions for screen readers.',
              content: _buildSemanticsShowcase(),
            ),
            _buildSection(
              icon: Icons.contrast,
              title: 'Color Contrast',
              subtitle: 'WCAG AA (4.5:1) and AAA (7:1) compliance examples.',
              content: _buildContrastShowcase(),
            ),
            _buildSection(
              icon: Icons.center_focus_strong,
              title: 'Focus Management',
              subtitle: 'Visual focus indicators and keyboard navigation.',
              content: _buildFocusShowcase(),
            ),
            _buildSection(
              icon: Icons.text_fields,
              title: 'Text Scaling Support',
              subtitle: 'Responsive text that adapts to user preferences.',
              content: _buildTextScalingShowcase(),
            ),
            _buildSection(
              icon: Icons.edit_note,
              title: 'Accessible Forms',
              subtitle: 'Proper labels, hints, and error handling.',
              content: _buildFormShowcase(),
            ),
            _buildSection(
              icon: Icons.settings_accessibility,
              title: 'System Accessibility Settings',
              subtitle: 'How your app responds to system preferences.',
              content: _buildSystemSettingsShowcase(),
            ),
            _buildSection(
              icon: Icons.animation,
              title: 'Motion & Animations',
              subtitle: 'Respecting reduced motion preferences.',
              content: _buildMotionShowcase(),
            ),
            SizedBox(height: M3SpacingToken.space32.value),
          ],
        ),
      ),
    );
  }

  // --- Showcase Widgets ---

  Widget _buildIntroCard() {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space20.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.accessibility_new,
                  size: 32,
                  color: colorScheme.onPrimaryContainer,
                ),
                SizedBox(width: M3SpacingToken.space12.value),
                Expanded(
                  child: Text(
                    'Material Design 3 Accessibility',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: M3SpacingToken.space16.value),
            Text(
              'This page demonstrates how to implement accessibility features following the WCAG 2.1 AA guidelines. '
              'Each section shows practical examples and comparisons between accessible and non-accessible implementations.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
            ),
            SizedBox(height: M3SpacingToken.space12.value),
            _buildQuickStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        _buildStatChip('WCAG 2.1 AA', Icons.verified, colorScheme.tertiary),
        SizedBox(width: M3SpacingToken.space8.value),
        _buildStatChip('48dp Touch', Icons.touch_app, colorScheme.secondary),
        SizedBox(width: M3SpacingToken.space8.value),
        _buildStatChip(
            'Screen Reader', Icons.record_voice_over, colorScheme.tertiary),
      ],
    );
  }

  Widget _buildStatChip(String label, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: M3SpacingToken.space8.value,
          vertical: M3SpacingToken.space4.value),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: M3IconSizeToken.dense.value, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTouchTargetsShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All interactive elements should have a minimum touch target of at least 48x48dp for easier interaction.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildComparisonExample(
          title: '✅ Correct - 48x48dp Touch Target',
          isGood: true,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () => _showSnackBar('Adequate touch target!'),
              icon: const Icon(Icons.thumb_up, size: 24),
              tooltip: 'Button with an adequate touch target',
            ),
          ),
          description: '48x48dp touch target - easy to tap for all users.',
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildComparisonExample(
          title: '❌ Incorrect - Small Touch Target',
          isGood: false,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: InkWell(
              onTap: () => _showSnackBar('Hard to tap!'),
              child: const Icon(Icons.thumb_down, size: 16),
            ),
          ),
          description:
              'Only a 24x24dp touch target - difficult to tap accurately.',
        ),
        SizedBox(height: M3SpacingToken.space20.value),
        _buildInteractiveDemo(
          title: 'Interactive Test',
          child: Column(
            children: [
              Text(
                'Try tapping the buttons below and notice the difference:',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: M3SpacingToken.space12.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.errorContainer,
                      shape: M3ShapeToken.large.value,
                    ),
                    child: InkWell(
                      onTap: () => _showSnackBar('32dp - Too small!'),
                      borderRadius: BorderRadius.circular(16),
                      child: const Icon(Icons.close, size: 16),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: M3ShapeToken.largeIncreased.value,
                    ),
                    child: InkWell(
                      onTap: () => _showSnackBar('48dp - Perfect!'),
                      borderRadius: BorderRadius.circular(24),
                      child: const Icon(Icons.check, size: 24),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      shape: M3ShapeToken.extraLarge.value,
                    ),
                    child: InkWell(
                      onTap: () => _showSnackBar('56dp - Excellent!'),
                      borderRadius: BorderRadius.circular(28),
                      child: const Icon(Icons.star, size: 28),
                    ),
                  ),
                ],
              ),
              SizedBox(height: M3SpacingToken.space8.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('32dp\n(Small)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('48dp\n(Minimum)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('56dp\n(Ideal)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSemanticsShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Semantic labels help screen readers understand the purpose of each element.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildComparisonExample(
          title: '✅ With Semantic Label',
          isGood: true,
          child: Semantics(
            label: 'Add product to favorites',
            hint: 'Double-tap to add',
            child: IconButton(
              onPressed: () => _showSnackBar('Added to favorites!'),
              icon: const Icon(Icons.favorite_border),
              tooltip: 'Add to favorites',
            ),
          ),
          description:
              'Screen reader will read: "Add product to favorites, button, double-tap to add".',
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildComparisonExample(
          title: '❌ Without Semantic Label',
          isGood: false,
          child: IconButton(
            onPressed: () => _showSnackBar('Unknown function'),
            icon: const Icon(Icons.favorite_border),
          ),
          description:
              'Screen reader will only read: "Button" - the function is unclear.',
        ),
        SizedBox(height: M3SpacingToken.space20.value),
        _buildInteractiveDemo(
          title: 'Varied Examples',
          child: Column(
            children: [
              Semantics(
                label: 'Loading user data',
                value: '75% complete',
                child: Column(
                  children: [
                    const LinearProgressIndicator(value: 0.75),
                    SizedBox(height: M3SpacingToken.space8.value),
                    Text('Loading... 75%',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              SizedBox(height: M3SpacingToken.space16.value),
              Semantics(
                label: _enableNotifications
                    ? 'Notifications enabled'
                    : 'Notifications disabled',
                hint: 'Double-tap to toggle',
                child: SwitchListTile(
                  title: const Text('Notifications'),
                  value: _enableNotifications,
                  onChanged: (value) =>
                      setState(() => _enableNotifications = value),
                  secondary: Icon(_enableNotifications
                      ? Icons.notifications
                      : Icons.notifications_off),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormShowcase() {
    return Column(
      children: [
        M3Accessibility.accessibleTextField(
          label: 'Email Address',
          hint: 'Enter your email',
          required: true,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        M3Accessibility.accessibleTextField(
          label: 'Message',
          hint: 'Optional message',
          maxLines: 3,
          onChanged: (value) {},
        ),
        SizedBox(height: M3SpacingToken.space8.value),
        M3Accessibility.accessibleCheckbox(
          value: _acceptTerms,
          label: 'I accept the terms and conditions',
          onChanged: (value) => setState(() => _acceptTerms = value ?? false),
        ),
      ],
    );
  }

  Widget _buildFocusShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tap or use a keyboard (Tab key) to see the focus indicators on these interactive elements.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        Row(
          children: [
            Expanded(
              child: M3Accessibility.focusIndicator(
                child: Card(
                  margin: EdgeInsets.zero,
                  child: ListTile(
                    title: const Text('Focus Target 1'),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            SizedBox(width: M3SpacingToken.space8.value),
            M3Accessibility.focusIndicator(
              // isCircle: true, // TODO(kevin): now
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContrastShowcase() {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        _buildContrastCard(
          label: 'Good Contrast (AA)',
          backgroundColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
        ),
        _buildContrastCard(
          label: 'Enhanced Contrast (AAA)',
          backgroundColor: colorScheme.inverseSurface,
          textColor: colorScheme.onInverseSurface,
        ),
        _buildContrastCard(
          label: 'Low Contrast (Fail)',
          backgroundColor: colorScheme.surfaceContainer,
          textColor: colorScheme.onSurfaceVariant.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildSystemSettingsShowcase() {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _buildSettingTile(
          icon: Icons.text_increase_rounded,
          settingName: 'Text Scale Factor',
          settingValue:
              '${mediaQuery.textScaler.scale(1.0).toStringAsFixed(2)}x',
          demo: Text('Sample', style: textTheme.bodyMedium),
        ),
        _buildSettingTile(
          icon: Icons.contrast_rounded,
          settingName: 'High Contrast',
          settingValue: mediaQuery.highContrast.toString(),
          demo: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: ShapeDecoration(
              color: mediaQuery.highContrast
                  ? Colors.black
                  : Theme.of(context).colorScheme.primary,
              shape: M3ShapeToken.extraSmall.value,
            ),
            child: Text(
              'Demo',
              style: TextStyle(
                color: mediaQuery.highContrast
                    ? Colors.white
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        _buildSettingTile(
          icon: Icons.format_bold_rounded,
          settingName: 'Bold Text',
          settingValue: mediaQuery.boldText.toString(),
          demo: Text(
            'Sample',
            style: TextStyle(
                fontWeight:
                    mediaQuery.boldText ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        _buildSettingTile(
          icon: Icons.motion_photos_off_rounded,
          settingName: 'Disable Animations',
          settingValue: mediaQuery.disableAnimations.toString(),
        ),
      ],
    );
  }

  Widget _buildTextScalingShowcase() {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;
    final textScale = mediaQuery.textScaler.scale(1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The app should adapt to the user\'s text size preferences.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildInteractiveDemo(
          title: 'Text Scaling Demonstration',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current scale factor: ${textScale.toStringAsFixed(2)}x',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: M3SpacingToken.space16.value),
              for (final scale in [0.8, 1.0, 1.2, 1.4, 1.8]) ...[
                Container(
                  padding: EdgeInsets.all(M3SpacingToken.space12.value),
                  margin: EdgeInsets.only(bottom: M3SpacingToken.space8.value),
                  decoration: ShapeDecoration(
                    color: scale == textScale
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainer,
                    shape: M3ShapeToken.small.value,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          '${scale}x',
                          style: textTheme.labelSmall,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Example of scaled text',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: textTheme.bodyMedium!.fontSize! * scale,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(height: M3SpacingToken.space12.value),
              Text(
                'Go to Settings > Accessibility > Font Size to test different scales.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMotionShowcase() {
    final mediaQuery = MediaQuery.of(context);
    final disableAnimations = mediaQuery.disableAnimations;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The app should respect the user\'s preference for reduced animations.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: M3SpacingToken.space16.value),
        _buildInteractiveDemo(
          title: 'Motion Demonstration',
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    disableAnimations
                        ? Icons.animation_outlined
                        : Icons.animation,
                    color: disableAnimations
                        ? Theme.of(context).colorScheme.outline
                        : Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: M3SpacingToken.space8.value),
                  Expanded(
                    child: Text(
                      'Animations ${disableAnimations ? 'disabled' : 'enabled'} by the system',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: M3SpacingToken.space20.value),
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  final animationValue = disableAnimations
                      ? 1.0
                      : (0.8 + 0.2 * _pulseController.value);

                  return Transform.scale(
                    scale: animationValue,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        shape: M3ShapeToken.extraExtraLarge.value,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: M3IconSizeToken.large.value,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: M3SpacingToken.space16.value),
              Text(
                disableAnimations
                    ? 'Animations are disabled - the element remains static.'
                    : 'Animations are enabled - the element pulses gently.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: M3SpacingToken.space12.value),
              Text(
                'Go to Settings > Accessibility > Remove animations to test this feature.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Helper and Builder Widgets ---

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget content,
    String? subtitle,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: M3SpacingToken.space16.value),
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                SizedBox(width: M3SpacingToken.space12.value),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleLarge),
                      if (subtitle != null) ...[
                        SizedBox(height: M3SpacingToken.space4.value),
                        Text(
                          subtitle,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: M3SpacingToken.space32.value),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonExample({
    required String title,
    required bool isGood,
    required Widget child,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(M3SpacingToken.space16.value),
      decoration: BoxDecoration(
        color: isGood
            ? colorScheme.secondaryContainer.withValues(alpha: 0.3)
            : colorScheme.errorContainer.withValues(alpha: 0.3),
        borderRadius: M3BorderRadiusToken.medium.value,
        border: Border.all(
          color: isGood ? colorScheme.secondary : colorScheme.error,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isGood ? colorScheme.secondary : colorScheme.error,
                ),
          ),
          SizedBox(height: M3SpacingToken.space12.value),
          Center(child: child),
          SizedBox(height: M3SpacingToken.space12.value),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveDemo({
    required String title,
    required Widget child,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(M3SpacingToken.space20.value),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: M3BorderRadiusToken.large.value,
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.play_circle_outline,
                color: colorScheme.primary,
                size: M3IconSizeToken.dense.value,
              ),
              SizedBox(width: M3SpacingToken.space8.value),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          SizedBox(height: M3SpacingToken.space16.value),
          child,
        ],
      ),
    );
  }

  Widget _buildContrastCard({
    required String label,
    required Color backgroundColor,
    required Color textColor,
  }) {
    final contrast = M3ColorUtils.calculateContrast(backgroundColor, textColor);
    final meetsAA = contrast >= 4.5;
    final meetsAAA = contrast >= 7.0;

    return Card(
      color: backgroundColor,
      elevation: M3ElevationToken.level0.dp,
      shape: RoundedRectangleBorder(
        borderRadius: M3BorderRadiusToken.medium.value,
        side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: EdgeInsets.all(M3SpacingToken.space16.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: textColor)),
            SizedBox(height: M3SpacingToken.space4.value),
            Text(
              'Ratio: ${contrast.toStringAsFixed(2)}:1 | WCAG AA: ${meetsAA ? '✓ Pass' : '✗ Fail'} | AAA: ${meetsAAA ? '✓ Pass' : '✗ Fail'}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String settingName,
    required String settingValue,
    Widget? demo,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(settingName),
      subtitle: Text(settingValue),
      trailing: demo,
      contentPadding: EdgeInsets.zero,
    );
  }

  void _showAccessibilityInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Accessibility'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'This page demonstrates practical accessibility implementations following the WCAG 2.1 AA guidelines.',
              ),
              SizedBox(height: M3SpacingToken.space16.value),
              Text('Features demonstrated:'),
              SizedBox(height: M3SpacingToken.space8.value),
              Text('• Minimum 48x48dp touch targets'),
              Text('• Semantic labels for screen readers'),
              Text('• Adequate color contrast'),
              Text('• Visible focus indicators'),
              Text('• Text scaling support'),
              Text('• Accessible forms'),
              Text('• Adapting to system settings'),
              Text('• Respecting motion preferences'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got It'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: M3ShapeToken.small.value,
      ),
    );
  }
}
