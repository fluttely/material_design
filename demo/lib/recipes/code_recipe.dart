import 'package:flutter/widgets.dart';

/// One answer to "how do I actually write this?".
///
/// A recipe is deliberately small: a name, one line saying why you would reach
/// for it, the code, and the code *running*. The showcase pages answer "what
/// does this token look like"; recipes answer "what do I type", and they are
/// only useful if a reader can take one in at a glance.
@immutable
class CodeRecipe {
  const CodeRecipe({
    required this.title,
    required this.summary,
    required this.code,
    this.preview,
  });

  /// What the recipe does, in a few words.
  final String title;

  /// One sentence on when to reach for it. Not a restatement of the title —
  /// the reason, or the trap it avoids.
  final String summary;

  /// The snippet, ready to paste.
  ///
  /// Kept to a dozen lines or so. A recipe that needs more than that is two
  /// recipes, or belongs in the showcase page rather than here.
  final String code;

  /// [code] running, for the reader to compare against.
  ///
  /// Null when the API produces no visual of its own — a `bool` answer, a
  /// theme wiring, a layout that only makes sense at full window size. Those
  /// recipes show the code alone rather than a decorative stand-in.
  final Widget? preview;
}

/// A titled run of recipes, linking to the spec page behind them.
///
/// Groups map one-to-one onto the sections of the matching showcase page, so
/// a reader who switches from Visual to Code lands on the same structure.
@immutable
class RecipeGroup {
  const RecipeGroup({
    required this.title,
    required this.recipes,
    this.url,
  });

  /// The API family this group covers — normally a class name.
  final String title;

  /// The M3 spec page behind it, when there is a single one.
  final String? url;

  /// The recipes, in reading order: the common case first.
  final List<CodeRecipe> recipes;
}
