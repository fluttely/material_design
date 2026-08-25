// Opens a URL in a new browser tab.
//
// The web implementation calls `window.open`; everything else (the VM, so
// `flutter test`) gets a no-op, which is why this is a conditional export —
// same pattern as `deck_sync.dart`.
export 'open_link_stub.dart' if (dart.library.js_interop) 'open_link_web.dart';
