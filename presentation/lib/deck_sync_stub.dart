/// No-op sync, used off the web (notably under `flutter test`).
class DeckSync {
  DeckSync(void Function(int index) onIndex);

  /// Broadcasts that this window moved to [index]. Does nothing here.
  void send(int index) {}

  void dispose() {}
}
