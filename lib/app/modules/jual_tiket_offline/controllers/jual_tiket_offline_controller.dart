import 'dart:convert';

import 'package:get/get.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JualTiketOfflineController extends GetxController {

  MyConnection myConnection = MyConnection();
  List<dynamic> eventList = [];

  Map data = {};
  String image = "";

  String accessToken = "";

  int creatorId = 0;
  int talentId = 0;
  int grandTotal = 0;

  bool loading = false;

  @override
  void onInit() {
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
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
    loadEvent();
  }

  Future<void> loadEvent() async {
    loading = true;
    eventList.clear();
    update(["jual_tiket"]);

    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/list-transaction-by-event?event_id=${data["id"]}&type_transaction=offline");
      var responseData = response.data;
      grandTotal = responseData["grand_total"] ?? 0;
      eventList = responseData["data"];
      loading = false;
      update(["jual_tiket"]);
    }
    catch(e){
      loading = false;
      update(["jual_tiket"]);
    }
  }
}