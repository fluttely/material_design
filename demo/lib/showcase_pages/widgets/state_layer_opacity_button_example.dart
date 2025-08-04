import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class M3StateLayerOpacityButtonExample extends StatelessWidget {
  const M3StateLayerOpacityButtonExample({super.key});

  Widget _buildButtonArea({
    required String title,
    required void Function()? onPressed,
  }) {
    return Column(
      children: [
        Text(title),
        const M3Gap(M3SpacingToken.space12),
        CustomButton(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_shopping_cart),
              const M3Gap(M3SpacingToken.space8),
              Text('Add to Cart'),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _buildButtonArea(title: 'Enabled State:', onPressed: () {}),
        const M3Gap(M3SpacingToken.space12),
        _buildButtonArea(title: 'Disabled State:', onPressed: null),
      ],
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isEnabled => widget.onPressed != null;

  M3ElevationToken get _elevation {
    if (!_isEnabled) return M3ElevationToken.level0;
    if (_isPressed) return M3ElevationToken.level1;
    if (_isHovered) return M3ElevationToken.level2;
    return M3ElevationToken.level1;
  }

  double get _stateLayerOpacity {
    if (!_isEnabled) return 0.0;
    if (_isPressed) return M3StateLayerOpacityToken.pressed.value;
    if (_isHovered) return M3StateLayerOpacityToken.hover.value;
    return 0.0;
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (!_isEnabled) {
      return colorScheme.onSurface.withValues(
        alpha: M3OpacityToken.disabledContainer.value,
      );
    }

    return _elevation.surfaceColor(context);
  }

  Color _getContentColor(ColorScheme colorScheme) {
    if (!_isEnabled) {
      return colorScheme.onSurface.withValues(
        alpha: M3OpacityToken.disabledContent.value,
      );
    }
    return colorScheme.primary;
  }

  Color _getStateLayerColor(ColorScheme colorScheme) {
    return colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final contentColor = _getContentColor(colorScheme);
    final stateLayerColor = _getStateLayerColor(colorScheme);
    final backgroundColor = _getBackgroundColor(colorScheme);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor:
          _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: M3MotionDurations.short3,
          child: Material(
            type: MaterialType.canvas,
            elevation: _elevation.value,
            color: backgroundColor,
            shape: const StadiumBorder(),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DefaultTextStyle(
                  style: textTheme.labelLarge!.copyWith(
                    color: contentColor,
                  ),
                  child: IconTheme(
                    data: IconThemeData(color: contentColor, size: 18),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: M3SpacingToken.space24.value,
                        vertical: 6,
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: M3MotionDurations.short3,
                    decoration: M3BoxDecoration(
                      color: stateLayerColor.withValues(
                        alpha: _stateLayerOpacity,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
