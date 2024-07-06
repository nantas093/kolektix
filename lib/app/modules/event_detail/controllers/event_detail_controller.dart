import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  int tabPosition = 0;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  void changeTabPosition(int position){
    tabPosition = position;
    update(["event_detail"]);
  }
}
