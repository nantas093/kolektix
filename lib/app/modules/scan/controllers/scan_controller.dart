import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/callback/scan_callback.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:kolektix/app/utils/qr_code_scanner/qr_code_scanner.dart';

const _dummyTicketData = {
  "invoice_no": "INV-001",
  "buyer_name": "Andi Wijaya",
  "ticket_name": "VIP",
  "event_name": "Java Jazz Festival 2026",
  "qty": 2,
  "status": "verified",
};

class ScanController extends GetxController {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController editingController = TextEditingController();

  Barcode? result;
  QRViewController? controller;

  int tabPosition = 1;

  bool scanned = false;

  BuildContext? buildContext;

  Map? ticketData;
  bool loading = false;

  String code = "";

  ScanCallback? scanCallback;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> loadProfile() async {}

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (buildContext != null) {
        if (scanData.code != null) {
          if (!scanned) {
            scanned = true;
            code = scanData.code!;
            checkIn(buildContext!, scanCallback!);
          }
        }
      }
    });
  }

  void changeTabPosition(int position) {
    tabPosition = position;
    update(["scan"]);
  }

  Future<void> searchTicket(String search) async {
    ticketData = null;
    update(["scan"]);
    if (search.isNotEmpty) {
      ticketData = Map<String, dynamic>.from(_dummyTicketData);
      code = ticketData!["invoice_no"] ?? "";
      loading = false;
      update(["scan"]);
    }
  }

  Future<void> checkIn(BuildContext context, ScanCallback scanCallback) async {
    CustomLoading.showLoadingDialog(context, "Loading...");
    await Future.delayed(const Duration(seconds: 1));
    ticketData = Map<String, dynamic>.from(_dummyTicketData);
    Get.back();
    scanCallback.success(ticketData!, context);
  }
}
