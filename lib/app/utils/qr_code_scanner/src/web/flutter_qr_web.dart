// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:js_interop';
import 'dart:ui' as ui;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import '../../qr_code_scanner.dart';
import 'jsqr.dart';
import 'media.dart';

class WebQrView extends StatefulWidget {
  final QRViewCreatedCallback onPlatformViewCreated;
  final PermissionSetCallback? onPermissionSet;
  final CameraFacing? cameraFacing;

  const WebQrView(
      {Key? key,
      required this.onPlatformViewCreated,
      this.onPermissionSet,
      this.cameraFacing = CameraFacing.front})
      : super(key: key);

  @override
  _WebQrViewState createState() => _WebQrViewState();

  static web.HTMLDivElement vidDiv = web.HTMLDivElement();

  static Future<bool> cameraAvailable() async {
    final devices = await web.window.navigator.mediaDevices
        .enumerateDevices()
        .toDart;
    for (final e in devices.toDart) {
      if (e.kind == 'videoinput') return true;
    }
    return false;
  }
}

class _WebQrViewState extends State<WebQrView> {
  web.MediaStream? _localStream;
  bool _currentlyProcessing = false;
  QRViewControllerWeb? _controller;

  late Size _size = const Size(0, 0);
  String? _errorMsg;
  web.HTMLVideoElement video = web.HTMLVideoElement();
  String viewID = 'QRVIEW-${DateTime.now().millisecondsSinceEpoch}';

  final StreamController<Barcode> _scanUpdateController =
      StreamController<Barcode>();
  late CameraFacing facing;

  Timer? _frameIntervall;

  @override
  void initState() {
    super.initState();
    facing = widget.cameraFacing ?? CameraFacing.front;
    WebQrView.vidDiv.appendChild(video);
    ui_web.platformViewRegistry
        .registerViewFactory(viewID, (int id) => WebQrView.vidDiv);
    Timer(const Duration(milliseconds: 500), () {
      start();
    });
  }

  Future start() async {
    await _makeCall();
    _frameIntervall?.cancel();
    _frameIntervall =
        Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _captureFrame();
    });
  }

  void cancel() {
    _frameIntervall?.cancel();
    if (_currentlyProcessing) {
      _stopStream();
    }
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }

  Future<void> _makeCall() async {
    if (_localStream != null) return;
    try {
      var constraints = UserMediaOptions(
          video: VideoOptions(
        facingMode: (facing == CameraFacing.front ? 'user' : 'environment'),
      ));
      if (_controller == null) {
        _controller = QRViewControllerWeb(this);
        widget.onPlatformViewCreated(_controller!);
      }
      final stream = await getUserMedia(constraints).toDart;
      _localStream = stream as web.MediaStream;
      widget.onPermissionSet?.call(_controller!, true);
      video.srcObject = _localStream;
      video.setAttribute('playsinline', 'true');
      await video.play().toDart;
    } catch (e) {
      cancel();
      if (e.toString().contains('NotAllowedError')) {
        widget.onPermissionSet?.call(_controller!, false);
      }
      setState(() {
        _errorMsg = e.toString();
      });
      return;
    }
    if (!mounted) return;
    setState(() {
      _currentlyProcessing = true;
    });
  }

  Future<void> _stopStream() async {
    try {
      _localStream?.getTracks().toDart.forEach((track) {
        if (track.readyState == 'live') track.stop();
      });
      video.srcObject = null;
      _localStream = null;
    } catch (e) {}
  }

  Future<dynamic> _captureFrame() async {
    if (_localStream == null) return null;
    final canvas = web.HTMLCanvasElement()
      ..width = video.videoWidth
      ..height = video.videoHeight;
    final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;
    ctx.drawImage(video, 0, 0);
    final imgData = ctx.getImageData(0, 0, canvas.width, canvas.height);

    final size = Size(canvas.width.toDouble(), canvas.height.toDouble());
    if (size != _size) {
      setState(() => _size = size);
    }

    final code = jsQR(imgData.data as JSAny, canvas.width, canvas.height);
    if (code != null) {
      _scanUpdateController
          .add(Barcode(code.data, BarcodeFormat.qrcode, code.data.codeUnits));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMsg != null) {
      return Center(child: Text(_errorMsg!));
    }
    if (_localStream == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        var zoom = 1.0;
        if (_size.height != 0) zoom = constraints.maxHeight / _size.height;
        if (_size.width != 0) {
          final hz = constraints.maxWidth / _size.width;
          if (hz > zoom) zoom = hz;
        }
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Center(
            child: SizedBox.fromSize(
              size: _size,
              child: Transform.scale(
                alignment: Alignment.center,
                scale: zoom,
                child: HtmlElementView(viewType: viewID),
              ),
            ),
          ),
        );
      },
    );
  }
}

class QRViewControllerWeb implements QRViewController {
  final _WebQrViewState _state;

  QRViewControllerWeb(this._state);

  @override
  void dispose() => _state.cancel();

  @override
  Future<CameraFacing> flipCamera() async {
    _state.facing = _state.facing == CameraFacing.front
        ? CameraFacing.back
        : CameraFacing.front;
    await _state.start();
    return _state.facing;
  }

  @override
  Future<CameraFacing> getCameraInfo() async => _state.facing;

  @override
  Future<bool?> getFlashStatus() async => false;

  @override
  Future<SystemFeatures> getSystemFeatures() => throw UnimplementedError();

  @override
  bool get hasPermissions => throw UnimplementedError();

  @override
  Future<void> pauseCamera() => throw UnimplementedError();

  @override
  Future<void> resumeCamera() => throw UnimplementedError();

  @override
  Stream<Barcode> get scannedDataStream => _state._scanUpdateController.stream;

  @override
  Future<void> stopCamera() => throw UnimplementedError();

  @override
  Future<void> toggleFlash() async => {};

  @override
  Future<void> scanInvert(bool isScanInvert) => throw UnimplementedError();
}

Widget createWebQrView(
        {onPlatformViewCreated, onPermissionSet, CameraFacing? cameraFacing}) =>
    WebQrView(
      onPlatformViewCreated: onPlatformViewCreated,
      onPermissionSet: onPermissionSet,
      cameraFacing: cameraFacing,
    );
