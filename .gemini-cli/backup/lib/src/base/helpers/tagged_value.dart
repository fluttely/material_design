part of 'helpers.dart';

/// Associates a [name] to a given [value].
class TaggedValue<T> extends Equatable {
  const TaggedValue(this.name, this.value);

  final String name;
  final T value;

  @override
  List<Object?> get props => [
    value,
  ];

  @override
  String toString() => '<$name>($value)';
}

extension NamedExtension<T> on T {
  TaggedValue<T> tagged(String name) => TaggedValue<T>(name, this);
}
