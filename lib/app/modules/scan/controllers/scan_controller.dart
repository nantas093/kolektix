import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/callback/scan_callback.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanController extends GetxController {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController editingController = TextEditingController();

  Barcode? result;
  QRViewController? controller;

  int tabPosition = 1;

  MyConnection myConnection = MyConnection();

  String accessToken = "";

  int creatorId = 0;
  int talentId = 0;

  bool scanned = false;

  BuildContext? buildContext;

  Map? ticketData;
  bool loading = false;

  String code = "";

  ScanCallback? scanCallback;

  @override
  void onInit() {
    loadProfile();
    super.onInit();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> loadProfile() async {
    var preference = await SharedPreferences.getInstance();
    String data = preference.getString("data") ?? "";
    Map dataMap = jsonDecode(data);
    accessToken = preference.getString("access_token") ?? "";
    if(dataMap["has_creator"] != null) {
      creatorId = dataMap["has_creator"]["id"];
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(buildContext != null){
        if(scanData.code != null){
          if(!scanned){
            scanned = true;
            code = scanData.code!;
            checkIn(buildContext!, scanCallback!);
          }
        }
      }
    });
  }

  void changeTabPosition(int position){
    tabPosition = position;
    update(["scan"]);
  }

  Future<void> searchTicket(String search) async {
    ticketData = null;
    update(["scan"]);
    if(!loading){
      try{
        var response = await myConnection.getDioConnection(accessToken).get(
            "/api/search-invoice-number?invoice_no=$search");
        var responseData = response.data;
        if(responseData["data"] != null){
          ticketData = responseData["data"];
          code = ticketData!["invoice_no"] ?? "";
          loading = false;
          update(["scan"]);
        }
      }
      catch(e){
        loading = false;
      }
    }
  }

  Future<void> checkIn(BuildContext context, ScanCallback scanCallback) async {
    CustomLoading.showLoadingDialog(context, "Loading...");
    Map body = {};
    body["invoice_no"] = code;

    try{
      var response = await myConnection.getDioConnection(accessToken).post(
          "/api/transaction-scan-ticket", data: body);
      var responseData = response.data;
      ticketData = responseData["data"];
      Get.back();
      scanCallback.success(ticketData!, context);
    }
    catch(e){
      Get.back();
      scanCallback.failed(ticketData!, context);
    }
  }
}