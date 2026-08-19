import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/pembayaran/views/pembayaran_view.dart';

const _dummyTickets = [
  {
    "id": 1,
    "name": "VIP",
    "price": 250000,
    "ticket_date": "2026-09-01",
    "ticket_end": "2026-09-03",
    "ticket_type": "Berbayar",
    "ticket_category": "Festival",
    "qty": 100,
    "description": "Akses VIP ke semua area",
  },
  {
    "id": 2,
    "name": "Regular",
    "price": 150000,
    "ticket_date": "2026-09-01",
    "ticket_end": "2026-09-03",
    "ticket_type": "Berbayar",
    "ticket_category": "Festival",
    "qty": 500,
    "description": "Akses regular ke area utama",
  },
  {
    "id": 3,
    "name": "Festival Pass",
    "price": 100000,
    "ticket_date": "2026-09-01",
    "ticket_end": "2026-09-03",
    "ticket_type": "Berbayar",
    "ticket_category": "Festival",
    "qty": 1000,
    "description": "Akses 3 hari festival",
  },
];

class JualTiketOfflineListController extends GetxController {

  int selectedIndex = 0;

  List<dynamic> dateLists = [];
  List<dynamic> selectedTicketList = [];

  Map data = {};
  String image = "";

  int totalPrice = 0;
  int max_buy_ticket = 0;
  int totalOrderedTickets = 0;

  String ticketName = "";
  int ticketPrice = 0;
  int ticketQuantity = 0;

  @override
  void onInit() {
    data = Get.arguments["data"];
    image = data["image_url"] ?? "";
    max_buy_ticket = data["max_buy_ticket"] ?? 5;
    loadDate();
    super.onInit();
  }

  Future<void> loadProfile() async {}

  void changeIndexPosition(int index) {
    selectedIndex = index;
    ticketName = dateLists[selectedIndex]["name"];
    ticketPrice = dateLists[selectedIndex]["price"];
    ticketQuantity = dateLists[selectedIndex]["ticket_quantity"];
    update(["jual_tiket_offline"]);
  }

  void setMinMaxTicket(int from) {
    if (from == 1) {
      if (dateLists[selectedIndex]["ticket_quantity"] > 0) {
        dateLists[selectedIndex]["ticket_quantity"]--;
      }
    } else {
      if (dateLists[selectedIndex]["ticket_quantity"] < max_buy_ticket) {
        dateLists[selectedIndex]["ticket_quantity"]++;
      }
    }

    ticketQuantity = dateLists[selectedIndex]["ticket_quantity"];

    totalOrderedTickets = 0;
    totalPrice = 0;

    for (int i = 0; i < dateLists.length; i++) {
      totalOrderedTickets += (dateLists[i]["ticket_quantity"] as int);
      totalPrice += (dateLists[i]["ticket_quantity"] as int) *
          (dateLists[i]["price"] as int);
    }

    update(["jual_tiket_offline"]);
  }

  Future<void> loadDate() async {
    dateLists = _dummyTickets.map((t) => Map<String, dynamic>.from(t)..["ticket_quantity"] = 0).toList();

    if (dateLists.isNotEmpty) {
      ticketName = dateLists[0]["name"];
      ticketPrice = dateLists[0]["price"];
      ticketQuantity = dateLists[0]["ticket_quantity"];
    }

    update(["jual_tiket_offline"]);
  }

  void goToPembayaran(BuildContext context) {
    selectedTicketList.clear();
    for (int i = 0; i < dateLists.length; i++) {
      if (dateLists[i]["ticket_quantity"] > 0) {
        selectedTicketList.add(dateLists[i]);
      }
    }

    if (selectedTicketList.isEmpty) {
      CustomToast.showToast("Pilih tiket terlebih dahulu", context);
      return;
    }

    Get.to(() => PembayaranView(),
        arguments: {
          "dataList": selectedTicketList,
          "data": data,
          "totalTicketPrice": totalPrice
        });
  }
}
