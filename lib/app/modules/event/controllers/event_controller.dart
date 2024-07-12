import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  MyConnection myConnection = MyConnection();

  List<dynamic> eventList = [];
  List<dynamic> draftList = [];
  List<dynamic> completedList = [];

  String accessToken = "";
  int creatorId = 0;
  int talentId = 0;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    loadEvent();
    loadProfile();
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
    loadDraftEvent();
    loadCompletedEvent();
  }

  Future<void> loadEvent() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-by-creator/$creatorId?status=active");

      var responseData = response.data;
      eventList = responseData["data"];
      update(["event"]);
    }
    catch(e){
      print(e);
    }
  }

  Future<void> loadDraftEvent() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-by-creator/$creatorId?status=draft");

      var responseData = response.data;
      draftList = responseData["data"];
      update(["event"]);
    }
    catch(e){
      print(e);
    }
  }

  Future<void> loadCompletedEvent() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-by-creator/$creatorId?status=completed");

      var responseData = response.data;
      completedList = responseData["data"];
      update(["event"]);
    }
    catch(e){
      print(e);
    }
  }
}