import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KelolaItemController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  MyConnection myConnection = MyConnection();
  List<dynamic> eventList = [];

  String accessToken = "";
  int creatorId = 0;
  int talentId = 0;

  int eventFilterPosition = 0;

  @override
  void onInit() {
    loadProfile();
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  Future<void> loadProfile() async {
    var preference = await SharedPreferences.getInstance();
    String data = preference.getString("data") ?? "";
    Map dataMap = jsonDecode(data);
    accessToken = preference.getString("access_token") ?? "";
    if(dataMap["has_creator"] != null){
      creatorId = dataMap["has_creator"]["id"];
    }
    loadEvent();
  }

  Future<void> loadEvent() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-by-creator/$creatorId?status=${eventFilterPosition == 0 ? "active" :
          eventFilterPosition == 1 ? "draf" : "completed"}");

      var responseData = response.data;
      eventList = responseData["data"];
      update(["kelola_item"]);
    }
    catch(e){
      print(e);
    }
  }

  void changeFilterPosition(int position){
    eventFilterPosition = position;
    loadEvent();
    update(["kelola_item"]);
  }
}