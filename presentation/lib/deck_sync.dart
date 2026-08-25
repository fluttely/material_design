// Keeps two windows of the deck on the same slide.
//
// The talk runs on two screens: the projector shows the slides, the laptop
// shows the speaker notes. Both are the same app in two browser windows, and
// advancing either has to advance both — pressing the arrow key twice, once
// per window, is exactly the kind of thing that goes wrong on stage.
//
// The web implementation uses BroadcastChannel; everything else (the VM, so
// `flutter test`) gets a no-op, which is why this is a conditional export.
export 'deck_sync_stub.dart' if (dart.library.js_interop) 'deck_sync_web.dart';
