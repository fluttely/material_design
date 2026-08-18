// Slide deck — run it with:
//
//   cd presentation && flutter run -d chrome
//
// Keys: → / space / PageDown advance · ← / PageUp go back
//       Home / End jump to the ends · T toggles light and dark
//       P toggles presenter mode (the notes, for your own screen)
//
// Two-screen setup: open the app in two browser windows, press P in the one
// on your laptop, and share the other one. They stay on the same slide
// automatically — see deck_sync.dart.
//
// This folder is gitignored and .pubignore'd: it is talk material, not part
// of the package. It does depend on the package, though — the deck is built
// out of the contract it is about.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design/material_design.dart';

import 'deck_sync.dart';
import 'presenter.dart';
import 'slide_kit.dart';
import 'slides.dart';

void main() => runApp(const TalkApp());

class TalkApp extends StatefulWidget {
  const TalkApp({super.key});

  @override
  State<TalkApp> createState() => _TalkAppState();
}

class _TalkAppState extends State<TalkApp> {
  // Dark by default: it is what a projector in a lit room wants.
  Brightness _brightness = Brightness.dark;

  static const _seed = Color(0xFF6750A4);

  @override
  Widget build(BuildContext context) {
    final scheme = M3ColorSchemes.fromSeed(
      seedColor: _seed,
      variant: M3SchemeVariant.expressive,
      brightness: _brightness,
    );

    return MaterialApp(
      title: 'Prompts para contextos técnicos complexos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: scheme, useMaterial3: true),
      home: DeckScreen(
        onToggleBrightness: () => setState(() {
          _brightness = _brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark;
        }),
      ),
    );
  }
}

class DeckScreen extends StatefulWidget {
  const DeckScreen({required this.onToggleBrightness, super.key});

  final VoidCallback onToggleBrightness;

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  int _index = 0;
  final _focus = FocusNode();

  // Which way the deck is moving, so the transition slides with the narrative
  // instead of always coming from the same side.
  bool _forward = true;

  /// This window shows the notes rather than the slides.
  ///
  /// Per-window, deliberately: the whole point is that the two windows show
  /// different things while sitting on the same index.
  bool _presenter = false;

  late final DeckSync _sync = DeckSync(_onRemoteIndex);

  /// Presenter mode has extra pages after the deck — the Q&A cards. The
  /// audience window stops at the last slide.
  int get _lastIndex => (_presenter ? presenterPageCount : deck.length) - 1;

  @override
  void initState() {
    super.initState();
    _focus.requestFocus();
  }

  @override
  void dispose() {
    _sync.dispose();
    _focus.dispose();
    super.dispose();
  }

  /// Another window moved. Follow it, without echoing back.
  void _onRemoteIndex(int index) {
    if (!mounted || index == _index) return;
    setState(() {
      _forward = index > _index;
      _index = index.clamp(0, _lastIndex);
    });
  }

  void _go(int delta) => _jump(_index + delta);

  void _jump(int to) {
    final next = to.clamp(0, _lastIndex);
    if (next == _index) return;
    setState(() {
      _forward = next > _index;
      _index = next;
    });
    _sync.send(next);
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowRight:
      case LogicalKeyboardKey.space:
      case LogicalKeyboardKey.pageDown:
      case LogicalKeyboardKey.enter:
        _go(1);
      case LogicalKeyboardKey.arrowLeft:
      case LogicalKeyboardKey.pageUp:
      case LogicalKeyboardKey.backspace:
        _go(-1);
      case LogicalKeyboardKey.home:
        _jump(0);
      case LogicalKeyboardKey.end:
        _jump(_lastIndex);
      case LogicalKeyboardKey.keyT:
        widget.onToggleBrightness();
      case LogicalKeyboardKey.keyP:
        // Toggling into the slides can leave you past the last one, since
        // presenter mode has the Q&A pages after it.
        setState(() {
          _presenter = !_presenter;
          _index = _index.clamp(0, _lastIndex);
        });
      default:
        return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (_presenter) {
      return Focus(
        focusNode: _focus,
        onKeyEvent: _onKey,
        autofocus: true,
        child: Scaffold(
          backgroundColor: scheme.surface,
          body: SafeArea(child: PresenterView(index: _index)),
        ),
      );
    }

    final slide = deck[_index];
    final progress = (_index + 1) / deck.length;

    return Focus(
      focusNode: _focus,
      onKeyEvent: _onKey,
      autofocus: true,
      child: Scaffold(
        backgroundColor: scheme.surface,
        body: ExpressiveBackdrop(
          child: Stack(
            children: [
              // Click anywhere to advance — handy when the clicker is a mouse.
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapUp: (details) {
                    final width = MediaQuery.sizeOf(context).width;
                    _go(details.globalPosition.dx < width * 0.2 ? -1 : 1);
                  },
                  child: AnimatedSwitcher(
                    duration: M3Motion.emphasized.duration,
                    switchInCurve: M3Motion.emphasizedIncoming.curve,
                    switchOutCurve: M3Motion.emphasizedOutgoing.curve,
                    // Stack the outgoing slide behind the incoming one rather
                    // than letting the switcher centre both: slides are
                    // top-aligned compositions and centring makes them jump.
                    layoutBuilder: (current, previous) => Stack(
                      fit: StackFit.expand,
                      children: [
                        ...previous,
                        if (current != null) current,
                      ],
                    ),
                    transitionBuilder: _transition,
                    child: KeyedSubtree(
                      key: ValueKey(_index),
                      child: slide.build(context),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _Footer(
                  section: slide.section,
                  index: _index,
                  total: deck.length,
                  progress: progress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Incoming and outgoing slides travel along the reading axis.
  ///
  /// `AnimatedSwitcher` hands the outgoing child a reversed animation, so one
  /// builder covers both: the new slide arrives from the direction you are
  /// heading, the old one leaves toward the direction you came from. The
  /// scale is tiny on purpose — the content's own spring entrance is what
  /// carries the transition; this only has to move the eye.
  Widget _transition(Widget child, Animation<double> animation) {
    final travel = _forward ? M3Spacings.s48 : -M3Spacings.s48;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, inner) {
        final t = animation.value;
        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset((1 - t) * travel, 0),
            child: Transform.scale(scale: 0.98 + 0.02 * t, child: inner),
          ),
        );
      },
      child: child,
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.section,
    required this.index,
    required this.total,
    required this.progress,
  });

  final String section;
  final int index;
  final int total;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // A hand-rolled bar rather than LinearProgressIndicator: the pill cap
        // and the eased growth are the whole reason it reads as Expressive.
        M3Padding(
          padding: const M3EdgeInsets.symmetric(horizontal: M3Spacings.s32),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Container(
                  height: M3Spacings.s4,
                  decoration: M3BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: M3BorderRadius.full,
                  ),
                ),
                AnimatedContainer(
                  duration: M3Motion.emphasized.duration,
                  curve: M3Motion.emphasized.curve,
                  height: M3Spacings.s4,
                  width: constraints.maxWidth * progress,
                  decoration: M3BoxDecoration(
                    borderRadius: M3BorderRadius.full,
                    gradient: LinearGradient(
                      colors: [scheme.primary, scheme.tertiary],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        M3Padding(
          padding: const M3EdgeInsets.symmetric(
            horizontal: M3Spacings.s32,
            vertical: M3Spacings.s16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                section,
                style: M3TypeScale.labelLarge.copyWith(
                  color: scheme.onSurfaceVariant,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '${index + 1} / $total',
                style: M3TypeScale.labelLarge.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
