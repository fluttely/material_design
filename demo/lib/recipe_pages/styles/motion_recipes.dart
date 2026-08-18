import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';
import 'package:material_design_demo/recipes/code_recipe.dart';
import 'package:material_design_demo/recipes/recipe_page.dart';

/// The Code half of the Motion destination.
class MotionRecipes extends StatelessWidget {
  const MotionRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipePage(
      title: 'Motion',
      summary: 'A duration without its curve is half a decision. M3Motion is a '
          'composite token that carries both, so the two never drift apart at '
          'a call site.',
      groups: [
        RecipeGroup(
          title: 'M3Motion',
          url: 'https://m3.material.io/styles/motion/'
              'easing-and-duration/tokens-specs',
          recipes: [
            CodeRecipe(
              title: 'Animate with a scheme',
              summary: 'Seven schemes, each pairing the duration and the '
                  'easing the spec assigns it. Pick by what the element is '
                  'doing, not by how many milliseconds feels right.',
              code: '''
AnimatedContainer(
  duration: M3Motion.emphasized.duration, // 500ms
  curve: M3Motion.emphasized.curve,
  width: expanded ? 240 : 120,
)
''',
              preview: _MotionDemo(),
            ),
            CodeRecipe(
              title: 'The seven schemes',
              summary: 'Emphasized for things the user should follow, standard '
                  'for everything else; incoming and outgoing for elements '
                  'arriving and leaving.',
              code: '''
M3Motion.emphasized;          // 500ms — on screen throughout
M3Motion.emphasizedIncoming;  // 450ms — entering
M3Motion.emphasizedOutgoing;  // 150ms — leaving
M3Motion.standard;            // 300ms
M3Motion.standardIncoming;    // 250ms
M3Motion.standardOutgoing;    // 200ms
M3Motion.linear;              // 150ms
''',
            ),
            CodeRecipe(
              title: 'In a const context',
              summary: 'M3Motion.emphasized.duration is a field access, so it '
                  'is not a compile-time constant. The flat aliases are, for '
                  'the places that need one.',
              code: '''
const duration = M3Motion.emphasizedDuration;
const curve = M3Motion.emphasizedCurve;

const AnimatedSize(duration: M3Motion.standardDuration, child: child);
''',
            ),
          ],
        ),
        RecipeGroup(
          title: 'Selectors & raw scales',
          url: 'https://m3.material.io/styles/motion/'
              'easing-and-duration/applying-easing-and-duration',
          recipes: [
            CodeRecipe(
              title: 'Choose by distance and by transition type',
              summary: 'A thing that travels further should take longer. These '
                  'two selectors make that decision without you naming a '
                  'number.',
              code: '''
M3Motion.durationFor(M3MotionDistance.long);  // long2 — 500ms
M3Motion.curveFor(M3MotionType.incoming);     // emphasizedDecelerate

// M3MotionDistance: short, medium, long, extraLong
// M3MotionType: incoming, outgoing, persistent, standard
''',
            ),
            CodeRecipe(
              title: 'The raw scales, when you need one',
              summary: 'Sixteen durations from 50ms to 1000ms, and the seven '
                  'official cubics. Reach for these when you are building the '
                  'thing a scheme would otherwise describe.',
              code: '''
M3MotionDuration.short2;     //  100ms
M3MotionDuration.medium2;    //  300ms
M3MotionDuration.extraLong4; // 1000ms

M3MotionCurve.emphasized;
M3MotionCurve.emphasizedDecelerate;
M3MotionCurve.standardAccelerate;
M3MotionCurve.linear;
''',
            ),
            CodeRecipe(
              title: 'As a tween',
              summary: 'asTween chains the scheme\'s curve onto a Tween, so an '
                  'explicit animation gets the same easing an implicit one '
                  'would.',
              code: '''
final slide = M3Motion.emphasized.asTween<Offset>(
  begin: const Offset(0, 0.2),
  end: Offset.zero,
).animate(controller);
''',
            ),
          ],
        ),
      ],
    );
  }
}

/// A box that moves and resizes on the emphasized scheme.
class _MotionDemo extends StatefulWidget {
  const _MotionDemo();

  @override
  State<_MotionDemo> createState() => _MotionDemoState();
}

class _MotionDemoState extends State<_MotionDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: _expanded ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: M3Motion.emphasized.duration,
            curve: M3Motion.emphasized.curve,
            width: _expanded ? M3Spacings.s128 : M3Spacings.s64,
            height: M3Spacings.s48,
            decoration: M3ShapeDecoration(
              shape: M3Shape.medium,
              color: colorScheme.secondaryContainer,
            ),
          ),
        ),
        const M3Gap(M3Spacings.s12),
        FilledButton.tonal(
          onPressed: () => setState(() => _expanded = !_expanded),
          child: const Text('Run'),
        ),
      ],
    );
  }
}
