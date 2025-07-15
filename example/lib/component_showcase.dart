import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

class ComponentShowcase extends StatelessWidget {
  const ComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(MaterialSpacing.space16),
      children: const [
        _SectionTitle('Buttons'),
        _ButtonShowcase(),
        _SectionTitle('Cards'),
        _CardShowcase(),
        _SectionTitle('Chips'),
        _ChipShowcase(),
        _SectionTitle('Text Fields'),
        _TextFieldShowcase(),
        _SectionTitle('Selection Controls'),
        _SelectionControlsShowcase(),
        _SectionTitle('Sliders'),
        _SliderShowcase(),
        _SectionTitle('Progress Indicators'),
        _ProgressIndicatorShowcase(),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MaterialSpacing.space24,
        bottom: MaterialSpacing.space16,
      ),
      child: Text(title, style: MaterialTypeScale.headlineSmall),
    );
  }
}

// --- Showcases ---

class _ButtonShowcase extends StatelessWidget {
  const _ButtonShowcase();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MaterialSpacing.space16,
      runSpacing: MaterialSpacing.space16,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
        FilledButton(onPressed: () {}, child: const Text('Filled')),
        FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
        TextButton(onPressed: () {}, child: const Text('Text')),
      ],
    );
  }
}

class _CardShowcase extends StatelessWidget {
  const _CardShowcase();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MaterialSpacing.space16,
      runSpacing: MaterialSpacing.space16,
      children: [
        _DemoCard(
          style: CardStyle.elevated,
          child: const Text('Elevated Card'),
        ),
        _DemoCard(style: CardStyle.filled, child: const Text('Filled Card')),
        _DemoCard(
          style: CardStyle.outlined,
          child: const Text('Outlined Card'),
        ),
      ],
    );
  }
}

class _ChipShowcase extends StatelessWidget {
  const _ChipShowcase();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MaterialSpacing.space16,
      runSpacing: MaterialSpacing.space16,
      children: [
        // const AssistChip(label: Text('Assist'), onPressed: () {}),
        const FilterChip(
          label: Text('Filter'),
          selected: true,
          onSelected: null,
        ),
        const InputChip(label: Text('Input'), onDeleted: null),
        // const SuggestionChip(label: Text('Suggestion'), onSelected: null),
      ],
    );
  }
}

class _TextFieldShowcase extends StatelessWidget {
  const _TextFieldShowcase();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Outlined Text Field',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: MaterialSpacing.space16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Filled Text Field',
            filled: true,
            border: UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class _SelectionControlsShowcase extends StatefulWidget {
  const _SelectionControlsShowcase();

  @override
  State<_SelectionControlsShowcase> createState() =>
      _SelectionControlsShowcaseState();
}

class _SelectionControlsShowcaseState
    extends State<_SelectionControlsShowcase> {
  bool _isChecked = true;
  bool _isSwitchOn = true;
  int? _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MaterialSpacing.space16,
      runSpacing: MaterialSpacing.space16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (v) => setState(() => _isChecked = v!),
        ),
        Switch(
          value: _isSwitchOn,
          onChanged: (v) => setState(() => _isSwitchOn = v),
        ),
        Radio<int>(
          value: 1,
          groupValue: _radioValue,
          onChanged: (v) => setState(() => _radioValue = v),
        ),
        Radio<int>(
          value: 2,
          groupValue: _radioValue,
          onChanged: (v) => setState(() => _radioValue = v),
        ),
      ],
    );
  }
}

class _SliderShowcase extends StatefulWidget {
  const _SliderShowcase();

  @override
  State<_SliderShowcase> createState() => _SliderShowcaseState();
}

class _SliderShowcaseState extends State<_SliderShowcase> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _sliderValue,
      onChanged: (v) => setState(() => _sliderValue = v),
    );
  }
}

class _ProgressIndicatorShowcase extends StatelessWidget {
  const _ProgressIndicatorShowcase();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(width: MaterialSpacing.space24),
        Expanded(child: LinearProgressIndicator()),
      ],
    );
  }
}

// --- Helper Widgets ---

enum CardStyle { elevated, filled, outlined }

class _DemoCard extends StatelessWidget {
  final Widget child;
  final CardStyle style;

  const _DemoCard({required this.child, this.style = CardStyle.elevated});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Card(
        elevation: style == CardStyle.elevated ? 1 : 0,
        color: style == CardStyle.filled
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : null,
        shape: style == CardStyle.outlined
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: MaterialBorder.thin,
                ),
                borderRadius: BorderRadius.circular(MaterialRadius.medium),
              )
            : null,
        child: Center(child: child),
      ),
    );
  }
}
