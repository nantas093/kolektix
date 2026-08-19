import 'package:get/get.dart';

const _dummyTransactions = [
  {
    "id": 1,
    "invoice_no": "INV-001",
    "buyer_name": "Andi Wijaya",
    "ticket_name": "VIP",
    "total_price": 500000,
    "qty": 2,
    "payment_status": "verified",
  },
  {
    "id": 2,
    "invoice_no": "INV-002",
    "buyer_name": "Siti Rahayu",
    "ticket_name": "Regular",
    "total_price": 150000,
    "qty": 1,
    "payment_status": "verified",
  },
  {
    "id": 3,
    "invoice_no": "INV-003",
    "buyer_name": "Rudi Hartono",
    "ticket_name": "Festival",
    "total_price": 300000,
    "qty": 3,
    "payment_status": "verified",
  },
];

class JualTiketOfflineController extends GetxController {

  List<dynamic> eventList = [];
  Map data = {};
  String image = "";
  int grandTotal = 950000;
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
    eventList = List<dynamic>.from(_dummyTransactions);
    loading = false;
    update(["jual_tiket"]);
  }
}
