import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';

class EventController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  MyConnection myConnection = MyConnection();
  List<dynamic> eventList = [];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    loadEvent();
    super.onInit();
  }

  Future<void> loadEvent() async {
    try{
      var response = await myConnection.getDioConnection("").get(
          MyConstant.EVENT);
      var responseData = response.data;
      eventList = responseData["data"];
      update(["event"]);
    }
    catch(e){
      print(e);
    }
  }
}