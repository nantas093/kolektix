import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/modules/home/views/home_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranController extends GetxController {
  MyConnection myConnection = MyConnection();

  List<dynamic> dataList = [];
  Map data = {};
  String image = "";

  int totalTicketPrice = 0;
  int admin = 0;

  String accessToken = "";

  int creatorId = 0;
  int talentId = 0;

  @override
  void onInit() {
    dataList = Get.arguments["dataList"];
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
    totalTicketPrice = Get.arguments["totalTicketPrice"] ?? 0;
    admin =  (data["admin_fee"] as int);
    loadProfile();
    super.onInit();
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

  Future<void> pay(BuildContext context) async {
    CustomLoading.showLoadingDialog(context, "Loading...");

    Map body = {};
    body["event_id"] = data["id"];
    body["payment_method"] = 2;
    body["admin_fee"] = admin;

    List<Map> tickets = [];

    for(int i = 0; i < dataList.length; i++){
      Map ticketBody = {};
      ticketBody["event_id"] = data["id"];
      ticketBody["event_ticket_id"] = dataList[i]["id"];
      ticketBody["price"] = dataList[i]["price"];
      ticketBody["subtotal_price"] = (dataList[i]["price"] as int) * (
          dataList[i]["ticket_quantity"] as int);
      ticketBody["qty_ticket"] = dataList[i]["ticket_quantity"];
      ticketBody["payment_status"] = "verified";
      tickets.add(ticketBody);
    }

    body["tickets"] = tickets;

    try{
      await myConnection.getDioConnection("").post("/api/transaction-offline", data: body);
      Get.back();
      CustomToast.showSuccessToast("Berhasil memesan tiket", context);
      Get.offAll(()=> HomeView());
    }
    catch(e){
      Get.back();
      if(e is DioError){
        var data = e.response;
        if(data != null){
          String message = "";
          String errors = "";
          String error = "";

          if(data.data["message"] != null){
            message = data.data["message"].toString();
          }

          if(data.data["errors"] != null){
            errors = data.data["errors"].toString();
          }

          if(data.data["error"] != null){
            error = data.data["error"].toString();
          }
          CustomToast.showToast("$message $errors $error", context);
        }
        else{
          CustomToast.showToast("Something went wrong, try again later", context);
        }
      }
      else{
        CustomToast.showToast("Something went wrong, try again later", context);
      }
    }
  }
}