import 'dart:convert';

import 'package:get/get.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckinEventController extends GetxController {

  MyConnection myConnection = MyConnection();
  List<dynamic> eventList = [];

  Map data = {};
  String image = "";

  String accessToken = "";
  int creatorId = 0;
  int talentId = 0;

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
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/transaction-history-ticket/${data["id"]}");
      var responseData = response.data;
      eventList = responseData["data"];
      update(["checkin_event"]);
    }
    catch(e){
      print(e);
    }
  }
}