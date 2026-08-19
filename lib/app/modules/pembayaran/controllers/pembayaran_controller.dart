import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/home/views/home_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';

class PembayaranController extends GetxController {

  List<dynamic> dataList = [];
  Map data = {};
  String image = "";

  int totalTicketPrice = 0;
  int admin = 0;

  @override
  void onInit() {
    dataList = Get.arguments["dataList"];
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
    totalTicketPrice = Get.arguments["totalTicketPrice"] ?? 0;
    admin = (data["admin_fee"] as int? ?? 0);
    super.onInit();
  }

  Future<void> loadProfile() async {}

  Future<void> pay(BuildContext context) async {
    CustomLoading.showLoadingDialog(context, "Loading...");
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    CustomToast.showSuccessToast("Berhasil memesan tiket", context);
    Get.offAll(() => HomeView());
  }
}
