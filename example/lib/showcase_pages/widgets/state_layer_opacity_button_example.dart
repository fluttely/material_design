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
        const SizedBox(height: M3Spacing.space12),
        CustomButton(
          onPressed: onPressed,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_shopping_cart),
              SizedBox(width: M3Spacing.space8),
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
        SizedBox(width: M3Spacing.space12),
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

  double get _elevation {
    if (!_isEnabled) return 0.0;
    if (_isPressed) return 1.0;
    if (_isHovered) return 3.0;
    return 1.0;
  }

  double get _stateLayerOpacity {
    if (!_isEnabled) return 0.0;
    if (_isPressed) return M3StateLayerOpacity.pressed;
    if (_isHovered) return M3StateLayerOpacity.hover;
    return 0.0;
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (!_isEnabled) {
      return colorScheme.onSurface.withValues(
        alpha: M3StateLayerOpacity.disabledContainer,
      );
    }

    return M3TonalColor.fromElevation(
      context,
      _elevation,
    );
  }

  Color _getContentColor(ColorScheme colorScheme) {
    if (!_isEnabled) {
      return colorScheme.onSurface.withValues(
        alpha: M3StateLayerOpacity.disabledContent,
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
      cursor: _isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: M3MotionDuration.short3,
          child: Material(
            type: MaterialType.canvas,
            elevation: _elevation,
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
                        horizontal: M3Spacing.space24,
                        vertical: 6,
                      ),
                      child: widget.child,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: AnimatedContainer(
                    duration: M3MotionDuration.short3,
                    decoration: BoxDecoration(
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
