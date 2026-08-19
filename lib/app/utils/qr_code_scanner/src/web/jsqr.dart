@JS()
library jsqr;

import 'dart:js_interop';

@JS('jsQR')
external Code? jsQR(JSAny data, int? width, int? height);

@JS()
extension type Code._(JSObject _) implements JSObject {
  external String get data;
}
