import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifikasiItemController extends GetxController with GetTickerProviderStateMixin {

  late TabController tabController;

  List<String> tabs = [];
  int merchandiseTabIndex = 0;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    initTabs();
    super.onInit();
  }

  void initTabs(){
    tabs.add("Semua");
    tabs.add("Pesanan Baru");
    tabs.add("Siap Dikirim");
    tabs.add("Sedang Dikirim");
    tabs.add("Pesanan Selesai");
    tabs.add("Dikomplain");
  }

  void changeMerchandiseTabIndex(int index){
    merchandiseTabIndex = index;
    update(["notifikasi"]);
  }
}