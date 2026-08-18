import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Broadcasts the current slide to every other window of the deck.
///
/// `BroadcastChannel` reaches all same-origin tabs and windows, so the notes
/// window and the projector window stay in step no matter which one you press
/// the arrow key in. Echoes of your own message are ignored — the sender
/// stamps a per-window id.
class DeckSync {
  DeckSync(void Function(int index) onIndex) {
    _channel.onmessage = (web.MessageEvent event) {
      final data = event.data;
      if (data == null) return;
      final parts = (data.dartify()! as String).split(':');
      if (parts.length != 2 || parts[0] == _id) return;
      final index = int.tryParse(parts[1]);
      if (index != null) onIndex(index);
    }.toJS;
  }

  final web.BroadcastChannel _channel = web.BroadcastChannel('m3-talk-deck');

  /// A per-window id, so a window ignores the echo of its own message.
  /// `hashCode` of a fresh object is unique enough for two windows.
  late final String _id = Object().hashCode.toString();

  void send(int index) => _channel.postMessage('$_id:$index'.toJS);

  void dispose() => _channel.close();
}
