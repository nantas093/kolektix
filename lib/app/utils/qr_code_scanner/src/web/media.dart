@JS('navigator.mediaDevices')
library media_devices;

import 'dart:js_interop';

@JS('getUserMedia')
external JSPromise<JSAny> getUserMedia(UserMediaOptions constraints);

extension type UserMediaOptions._(JSObject _) implements JSObject {
  external factory UserMediaOptions({VideoOptions? video});
  external VideoOptions get video;
}

extension type VideoOptions._(JSObject _) implements JSObject {
  external factory VideoOptions({String? facingMode, DeviceIdOptions? deviceId});
  external String get facingMode;
}

extension type DeviceIdOptions._(JSObject _) implements JSObject {
  external factory DeviceIdOptions({String? exact});
  external String get exact;
}
