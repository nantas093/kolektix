import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/modules/pembayaran/views/pembayaran_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JualTiketOfflineListController extends GetxController {

  int selectedIndex = 0;

  MyConnection myConnection = MyConnection();

  List<dynamic> dateLists = [];
  List<dynamic> selectedTicketList = [];

  Map data = {};
  String image = "";

  String accessToken = "";

  int creatorId = 0;
  int talentId = 0;

  int totalPrice = 0;

  int max_buy_ticket = 0;
  int totalOrderedTickets = 0;

  String ticketName = "";
  int ticketPrice = 0;
  int ticketQuantity = 0;

  @override
  void onInit() {
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
    max_buy_ticket = data["max_buy_ticket"] ?? 0;
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
    loadDate();
  }

  void changeIndexPosition(int index){
    selectedIndex = index;
    ticketName = dateLists[selectedIndex]["name"];
    ticketPrice = dateLists[selectedIndex]["price"];
    ticketQuantity = dateLists[selectedIndex]["ticket_quantity"];
    update(["jual_tiket_offline"]);
  }

  void setMinMaxTicket(int from){
    if(from == 1){
      if(dateLists[selectedIndex]["ticket_quantity"] > 0){
        dateLists[selectedIndex]["ticket_quantity"]--;
      }
    }
    else{
      if(dateLists[selectedIndex]["ticket_quantity"] < max_buy_ticket){
        dateLists[selectedIndex]["ticket_quantity"]++;
      }
    }

    ticketQuantity = dateLists[selectedIndex]["ticket_quantity"];

    totalOrderedTickets = 0;
    totalPrice = 0;

    for(int i = 0 ; i < dateLists.length; i++){
      totalOrderedTickets = totalOrderedTickets + (dateLists[i][
      "ticket_quantity"] as int);
      totalPrice = totalPrice + ((dateLists[i][
      "ticket_quantity"] as int) * (dateLists[i][
      "price"] as int));
    }

    update(["jual_tiket_offline"]);
  }

  Future<void> loadDate() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-ticket/${data["id"]}");
      var responseData = response.data;
      dateLists = responseData["data"];

      for(int i = 0; i < dateLists.length; i++){
        dateLists[i]["ticket_quantity"] = 0;
      }

      if(dateLists.isNotEmpty){
        ticketName = dateLists[0]["name"];
        ticketPrice = dateLists[0]["price"];
        ticketQuantity = dateLists[0]["ticket_quantity"];
      }

      update(["jual_tiket_offline"]);
    }
    catch(e){
      print(e);
    }
  }

  void goToPembayaran(BuildContext context){
    selectedTicketList.clear();
    for(int i = 0; i < dateLists.length; i++){
      if(dateLists[i]["ticket_quantity"] > 0){
        selectedTicketList.add(dateLists[i]);
      }
    }

    if(selectedTicketList.isEmpty){
      CustomToast.showToast("Pilih tiket terlebih dahulu", context);
      return;
    }

    Get.to(()=> PembayaranView(), arguments: {"dataList"
        : selectedTicketList, "data" : data, "totalTicketPrice"
        : totalPrice});
  }
}