// The whole spring system is M3 Expressive and still @experimental upstream.
// ignore_for_file: experimental_member_use

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Springs destination.
class SpringRecipes extends StatelessWidget {
  const SpringRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipePage(
      title: 'Springs',
      summary: 'M3 Expressive added physics alongside durations. A spring is '
          'interruptible and velocity-aware, so a gesture handed off '
          'mid-flight continues instead of restarting — which a duration '
          'cannot do.',
      groups: [
        RecipeGroup(
          title: 'M3MotionScheme',
          url: 'https://m3.material.io/styles/motion/overview/specs',
          recipes: [
            CodeRecipe(
              title: 'Pick a scheme once, then select by intent',
              summary: 'Expressive is Material\'s own default; standard is the '
                  'utilitarian one. Never name a stiffness at a call site.',
              code: '''
const scheme = M3MotionScheme.expressive;

scheme.spatial(M3MotionSpeed.fast);     // a chip springing into place
scheme.effects(M3MotionSpeed.standard); // a colour crossfade
''',
              preview: _SpringDemo(),
            ),
            CodeRecipe(
              title: 'Spatial moves, effects colour',
              summary: 'Spatial springs may overshoot and settle — that reads '
                  'as alive. Effects springs are critically damped, because a '
                  'colour that overshoots reads as a bug.',
              code: '''
// spatial: position, size, shape. May bounce.
scheme.spatial(M3MotionSpeed.slow);

// effects: colour, opacity, elevation tint. Never bounces.
scheme.effects(M3MotionSpeed.fast);

// Or select the kind as a value:
scheme.spring(M3MotionSpringKind.spatial, M3MotionSpeed.standard);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'M3ESpring',
          url: 'https://m3.material.io/styles/motion/overview',
          recipes: [
            CodeRecipe(
              title: 'Drive a controller with a simulation',
              summary: 'This is the reason to reach for a spring at all: hand '
                  'in the fling velocity and the motion carries on from where '
                  'the finger left it.',
              code: '''
final spring = M3MotionScheme.expressive.spatial(M3MotionSpeed.fast);

controller.animateWith(
  spring.simulation(
    start: controller.value,
    end: 1,
    velocity: details.primaryVelocity ?? 0,
  ),
);
''',
            ),
            CodeRecipe(
              title: 'Or hand the description to a physics widget',
              summary: 'description is a plain SpringDescription, so anything '
                  'in Flutter that already takes one accepts an M3 token.',
              code: '''
final spring = M3MotionScheme.standard.spatial(M3MotionSpeed.standard);

spring.description; // SpringDescription, unit mass
spring.damping;     // 0.9
spring.stiffness;   // 700
spring.isBouncy;    // false — damping is 1.0 or higher
''',
            ),
            CodeRecipe(
              title: 'The twelve tokens, if you must name one',
              summary: 'Two schemes × two kinds × three speeds. Selecting '
                  'through the scheme is preferred; these exist so the set is '
                  'enumerable.',
              code: '''
M3ESpring.expressiveSpatialFast;  // damping 0.6 — the bounciest
M3ESpring.standardSpatialDefault; // damping 0.9, stiffness 700
M3ESpring.expressiveEffectsSlow;  // damping 1.0 — no overshoot

M3MotionScheme.expressive.springs; // all six of that scheme
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// A box flung between two positions on an expressive spatial spring.
class _SpringDemo extends StatefulWidget {
  const _SpringDemo();

  @override
  State<_SpringDemo> createState() => _SpringDemoState();
}

class _SpringDemoState extends State<_SpringDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: M3MotionDuration.long2,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    final spring = M3MotionScheme.expressive.spatial(M3MotionSpeed.fast);
    _controller.animateWith(
      spring.simulation(
        start: _controller.value,
        end: _controller.value > 0.5 ? 0 : 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: M3Spacings.s48,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Align(
              // The value overshoots past 1 and settles back — that is the
              // spring, and it is why the alignment is not clamped.
              alignment: Alignment(_controller.value * 2 - 1, 0),
              child: child,
            ),
            child: Container(
              width: M3Spacings.s48,
              height: M3Spacings.s48,
              decoration: M3ShapeDecoration(
                shape: M3Shape.full,
                color: colorScheme.secondaryContainer,
              ),
            ),
          ),
        ),
        const M3Gap(M3Spacings.s12),
        FilledButton.tonal(
          onPressed: _toggle,
          child: const Text('Fling'),
        ),
      ],
    );
  }
}
