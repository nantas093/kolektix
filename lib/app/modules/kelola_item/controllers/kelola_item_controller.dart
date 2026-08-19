import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _allDummyEvents = [
  {
    "id": 1,
    "name": "Java Jazz Festival 2026",
    "location": "Jakarta Convention Center",
    "image_url": "",
    "status": "active",
    "admin_fee": 5000,
    "max_buy_ticket": 5,
    "start_date": "2026-09-01",
    "end_date": "2026-09-03",
    "creator_id": 1,
  },
  {
    "id": 2,
    "name": "Kolektix Creators Summit",
    "location": "Bali Nusa Dua Convention Center",
    "image_url": "",
    "status": "active",
    "admin_fee": 3000,
    "max_buy_ticket": 3,
    "start_date": "2026-10-10",
    "end_date": "2026-10-11",
    "creator_id": 1,
  },
  {
    "id": 3,
    "name": "Night Market Bandung",
    "location": "Bandung",
    "image_url": "",
    "status": "draft",
    "admin_fee": 2000,
    "max_buy_ticket": 10,
    "start_date": "2026-11-01",
    "end_date": "2026-11-01",
    "creator_id": 1,
  },
  {
    "id": 4,
    "name": "Soundrenaline 2025",
    "location": "Gelora Bung Karno, Jakarta",
    "image_url": "",
    "status": "completed",
    "admin_fee": 10000,
    "max_buy_ticket": 5,
    "start_date": "2025-08-20",
    "end_date": "2025-08-21",
    "creator_id": 1,
  },
];

class KelolaItemController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<dynamic> eventList = [];
  int eventFilterPosition = 0;

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    loadEvent();
    super.onInit();
  }

  Future<void> loadProfile() async {}

  Future<void> loadEvent() async {
    String status = eventFilterPosition == 0
        ? "active"
        : eventFilterPosition == 1
            ? "draft"
            : "completed";
    eventList = _allDummyEvents
        .where((e) => e["status"] == status)
        .toList();
    update(["kelola_item"]);
  }

  void changeFilterPosition(int position) {
    eventFilterPosition = position;
    loadEvent();
    update(["kelola_item"]);
  }
}
