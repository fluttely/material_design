import 'package:web/web.dart' as web;

/// Opens [url] in a new browser tab.
void openLink(String url) => web.window.open(url, '_blank');
