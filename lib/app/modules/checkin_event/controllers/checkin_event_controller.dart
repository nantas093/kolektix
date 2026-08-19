import 'package:get/get.dart';

const _dummyCheckins = [
  {
    "id": 1,
    "invoice_no": "INV-001",
    "buyer_name": "Andi Wijaya",
    "ticket_name": "VIP",
    "status": "checked_in",
    "qty": 2,
  },
  {
    "id": 2,
    "invoice_no": "INV-002",
    "buyer_name": "Siti Rahayu",
    "ticket_name": "Regular",
    "status": "not_checked_in",
    "qty": 1,
  },
  {
    "id": 3,
    "invoice_no": "INV-003",
    "buyer_name": "Rudi Hartono",
    "ticket_name": "Festival",
    "status": "checked_in",
    "qty": 3,
  },
];

class CheckinEventController extends GetxController {

  List<dynamic> eventList = [];
  Map data = {};
  String image = "";
  bool loading = false;

  @override
  void onInit() {
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
    loadEvent();
    super.onInit();
  }

  Future<void> loadProfile() async {}

  Future<void> loadEvent() async {
    loading = true;
    eventList = List<dynamic>.from(_dummyCheckins);
    loading = false;
    update(["checkin_event"]);
  }
}
