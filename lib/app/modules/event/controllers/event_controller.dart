import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _dummyEvents = [
  {
    "id": 1,
    "name": "Java Jazz Festival 2026",
    "description": "Festival jazz tahunan terbesar di Asia Tenggara.",
    "term_condition": "Dilarang membawa kamera profesional.",
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
    "description": "Pertemuan para kreator konten terbaik Indonesia.",
    "term_condition": "Peserta wajib membawa ID.",
    "location": "Bali Nusa Dua Convention Center",
    "image_url": "",
    "status": "active",
    "admin_fee": 3000,
    "max_buy_ticket": 3,
    "start_date": "2026-10-10",
    "end_date": "2026-10-11",
    "creator_id": 1,
  },
];

const _dummyDraft = [
  {
    "id": 3,
    "name": "Night Market Bandung",
    "description": "Pasar malam dengan berbagai kuliner dan hiburan.",
    "term_condition": "-",
    "location": "Bandung",
    "image_url": "",
    "status": "draft",
    "admin_fee": 2000,
    "max_buy_ticket": 10,
    "start_date": "2026-11-01",
    "end_date": "2026-11-01",
    "creator_id": 1,
  },
];

const _dummyCompleted = [
  {
    "id": 4,
    "name": "Soundrenaline 2025",
    "description": "Festival musik rock Indonesia.",
    "term_condition": "Usia minimum 17 tahun.",
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

class EventController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<dynamic> eventList = [];
  List<dynamic> draftList = [];
  List<dynamic> completedList = [];

  bool loading = false;
  bool draftLoading = false;
  bool completedLoading = false;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    loadEvent();
    loadDraftEvent();
    loadCompletedEvent();
    super.onInit();
  }

  Future<void> loadProfile() async {}

  Future<void> loadEvent() async {
    loading = true;
    eventList = List<dynamic>.from(_dummyEvents);
    loading = false;
    update(["event"]);
  }

  Future<void> loadDraftEvent() async {
    draftLoading = true;
    draftList = List<dynamic>.from(_dummyDraft);
    draftLoading = false;
    update(["event"]);
  }

  Future<void> loadCompletedEvent() async {
    completedLoading = true;
    completedList = List<dynamic>.from(_dummyCompleted);
    completedLoading = false;
    update(["event"]);
  }
}
