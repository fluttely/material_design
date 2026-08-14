part of '../../motion.dart';

/// How fast a spring resolves.
///
/// A speed is a selector, not a value: it names how urgent the motion is, and
/// [M3MotionScheme] turns it into a concrete [M3ESpring].
enum M3MotionSpeed {
  /// Deliberate motion — large surfaces, entrances a user should follow.
  slow,

  /// The default for most transitions.
  standard,

  /// Snappy motion — small controls, immediate feedback.
  fast,
}

/// What a spring is animating: position/size, or color/opacity.
///
/// The M3 physics system splits these because they read differently. A shape
/// that overshoots feels alive; a color that overshoots looks like a bug.
enum M3MotionSpringKind {
  /// Movement, size, orientation, shape. May overshoot and settle.
  spatial,

  /// Color, opacity, elevation tint. Critically damped — never overshoots.
  effects,
}

/// A Material Design 3 spring token — the physics-based motion primitive that
/// M3 Expressive introduced alongside the duration/curve system.
///
/// A spring is described by **damping** (how quickly the bounce dies out; 1.0
/// removes bounce entirely) and **stiffness** (how hard the spring is; higher
/// resolves faster). Unlike a duration, a spring is interruptible and
/// velocity-aware: a gesture handed off mid-flight continues smoothly instead
/// of restarting.
///
/// This is a composite token — you read [damping] and [stiffness] together and
/// never unwrap one — so it is an enum, like [M3Motion] and `M3Elevation`.
///
/// Prefer selecting through [M3MotionScheme] rather than naming a member
/// directly:
///
/// ```dart
/// final spring = M3MotionScheme.expressive.spatial(M3MotionSpeed.fast);
/// AnimationController(vsync: this).animateWith(
///   spring.simulation(start: 0, end: 1),
/// );
/// ```
///
/// Values are the published Material spring parameters. Note that the effects
/// springs are identical in both schemes: expression belongs to movement, not
/// to color.
///
/// Spec: https://m3.material.io/styles/motion/overview/specs
@experimental
enum M3ESpring {
  /// Standard scheme, spatial, deliberate (damping 0.9, stiffness 300).
  standardSpatialSlow(damping: 0.9, stiffness: 300),

  /// Standard scheme, spatial, default (damping 0.9, stiffness 700).
  standardSpatialDefault(damping: 0.9, stiffness: 700),

  /// Standard scheme, spatial, snappy (damping 0.9, stiffness 1400).
  standardSpatialFast(damping: 0.9, stiffness: 1400),

  /// Standard scheme, effects, deliberate (damping 1.0, stiffness 800).
  standardEffectsSlow(damping: 1, stiffness: 800),

  /// Standard scheme, effects, default (damping 1.0, stiffness 1600).
  standardEffectsDefault(damping: 1, stiffness: 1600),

  /// Standard scheme, effects, snappy (damping 1.0, stiffness 3800).
  standardEffectsFast(damping: 1, stiffness: 3800),

  /// Expressive scheme, spatial, deliberate (damping 0.8, stiffness 200).
  expressiveSpatialSlow(damping: 0.8, stiffness: 200),

  /// Expressive scheme, spatial, default (damping 0.8, stiffness 380).
  expressiveSpatialDefault(damping: 0.8, stiffness: 380),

  /// Expressive scheme, spatial, snappy (damping 0.6, stiffness 800).
  ///
  /// The bounciest token in the system — the lowest damping Material ships.
  expressiveSpatialFast(damping: 0.6, stiffness: 800),

  /// Expressive scheme, effects, deliberate (damping 1.0, stiffness 800).
  expressiveEffectsSlow(damping: 1, stiffness: 800),

  /// Expressive scheme, effects, default (damping 1.0, stiffness 1600).
  expressiveEffectsDefault(damping: 1, stiffness: 1600),

  /// Expressive scheme, effects, snappy (damping 1.0, stiffness 3800).
  expressiveEffectsFast(damping: 1, stiffness: 3800);

  const M3ESpring({required this.damping, required this.stiffness});

  /// The damping ratio. 1.0 is critically damped — no overshoot at all.
  final double damping;

  /// The spring constant. Higher resolves the motion faster.
  final double stiffness;

  /// Whether this spring overshoots its target before settling.
  bool get isBouncy => damping < 1.0;

  /// This token as a Flutter [SpringDescription], with unit mass.
  SpringDescription get description => SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: stiffness,
        ratio: damping,
      );

  /// A simulation running from [start] to [end].
  ///
  /// Pass the gesture's [velocity] when handing off from a drag, which is the
  /// reason to reach for a spring over a duration in the first place.
  ///
  /// ```dart
  /// controller.animateWith(
  ///   M3MotionScheme.expressive.spatial(M3MotionSpeed.fast).simulation(
  ///         start: controller.value,
  ///         end: 1,
  ///         velocity: flingVelocity,
  ///       ),
  /// );
  /// ```
  SpringSimulation simulation({
    required double start,
    required double end,
    double velocity = 0,
  }) =>
      SpringSimulation(description, start, end, velocity);
}

/// The two Material Design 3 motion schemes.
///
/// A scheme is a complete set of springs — pick one for the product, then
/// select within it by [M3MotionSpeed] and [M3MotionSpringKind]. Material's
/// own recommendation is [expressive] for most products and key interactions,
/// and [standard] for utilitarian ones.
///
/// ```dart
/// // Choose once, at the top of the app.
/// const scheme = M3MotionScheme.expressive;
///
/// // Then select by intent, not by number.
/// scheme.spatial(M3MotionSpeed.fast);   // a chip springing into place
/// scheme.effects(M3MotionSpeed.standard); // a color crossfade
/// ```
///
/// Spec: https://m3.material.io/styles/motion/overview
@experimental
enum M3MotionScheme {
  /// Functional motion with minimal bounce, for utilitarian products.
  standard,

  /// Material's opinionated default — springs that overshoot and settle.
  expressive;

  /// The spatial spring at [speed]: position, size, shape.
  M3ESpring spatial(M3MotionSpeed speed) => switch ((this, speed)) {
        (M3MotionScheme.standard, M3MotionSpeed.slow) =>
          M3ESpring.standardSpatialSlow,
        (M3MotionScheme.standard, M3MotionSpeed.standard) =>
          M3ESpring.standardSpatialDefault,
        (M3MotionScheme.standard, M3MotionSpeed.fast) =>
          M3ESpring.standardSpatialFast,
        (M3MotionScheme.expressive, M3MotionSpeed.slow) =>
          M3ESpring.expressiveSpatialSlow,
        (M3MotionScheme.expressive, M3MotionSpeed.standard) =>
          M3ESpring.expressiveSpatialDefault,
        (M3MotionScheme.expressive, M3MotionSpeed.fast) =>
          M3ESpring.expressiveSpatialFast,
      };

  /// The effects spring at [speed]: color, opacity, tint.
  M3ESpring effects(M3MotionSpeed speed) => switch ((this, speed)) {
        (M3MotionScheme.standard, M3MotionSpeed.slow) =>
          M3ESpring.standardEffectsSlow,
        (M3MotionScheme.standard, M3MotionSpeed.standard) =>
          M3ESpring.standardEffectsDefault,
        (M3MotionScheme.standard, M3MotionSpeed.fast) =>
          M3ESpring.standardEffectsFast,
        (M3MotionScheme.expressive, M3MotionSpeed.slow) =>
          M3ESpring.expressiveEffectsSlow,
        (M3MotionScheme.expressive, M3MotionSpeed.standard) =>
          M3ESpring.expressiveEffectsDefault,
        (M3MotionScheme.expressive, M3MotionSpeed.fast) =>
          M3ESpring.expressiveEffectsFast,
      };

  /// The spring for [kind] at [speed].
  M3ESpring spring(M3MotionSpringKind kind, M3MotionSpeed speed) =>
      switch (kind) {
        M3MotionSpringKind.spatial => spatial(speed),
        M3MotionSpringKind.effects => effects(speed),
      };

  /// Every spring belonging to this scheme.
  List<M3ESpring> get springs => <M3ESpring>[
        for (final speed in M3MotionSpeed.values) spatial(speed),
        for (final speed in M3MotionSpeed.values) effects(speed),
      ];
}
