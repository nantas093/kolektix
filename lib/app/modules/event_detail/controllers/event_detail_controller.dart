import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';

const _dummyPemesanan = [
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
];

class EventDetailController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  int tabPosition = 0;

  Map data = {};

  int detailIndex = 1;
  int ticketIndex = 1;

  String strDetail = "";

  List<dynamic> ticketList = [
    {
      "id": 1,
      "name": "VIP",
      "price": 250000,
      "qty": 100,
      "description": "Akses VIP ke semua area",
      "ticket_date": "2026-09-01",
      "ticket_end": "2026-09-03",
      "ticket_type": "Berbayar",
      "ticket_category": "Festival",
    },
    {
      "id": 2,
      "name": "Regular",
      "price": 150000,
      "qty": 500,
      "description": "Akses regular ke area utama",
      "ticket_date": "2026-09-01",
      "ticket_end": "2026-09-03",
      "ticket_type": "Berbayar",
      "ticket_category": "Festival",
    },
  ];
  List<dynamic> pemesananList = [];

  int selectedJenisTiket = 0;
  int selectedKategoriTiket = 0;

  TextEditingController namaTiketController = TextEditingController();
  TextEditingController hargaTiketController = TextEditingController();
  TextEditingController jumlahTiketController = TextEditingController();
  TextEditingController deskripsiTiketController = TextEditingController();

  String strTicketStartDate = "YYYY/MM/DD";
  String strTicketEndDate = "YYYY/MM/DD";

  String ticketTitle = "Tambah Tiket";

  BuildContext? buildContext;

  @override
  void onInit() {
    data = Get.arguments["data"];
    strDetail = data["description"] ?? "";
    tabController = TabController(length: 4, vsync: this);
    pemesananList = List<dynamic>.from(_dummyPemesanan);
    super.onInit();
  }

  Future<void> loadProfile() async {}
  Future<void> loadTickets() async {}
  Future<void> loadPemesanan() async {}

  void changeTabPosition(int position) {
    tabPosition = position;
    update(["event_detail"]);
  }

  void changeDetailIndex(int index) {
    detailIndex = index;
    strDetail = index == 1
        ? (data["description"] ?? "")
        : (data["term_condition"] ?? "");
    update(["event_detail"]);
  }

  void changeTicketIndex(int index) {
    ticketIndex = index;
    update(["event_detail"]);
  }

  void selectJenisTiket(int jenisTiket) {
    selectedJenisTiket = jenisTiket;
    update(["event_detail"]);
  }

  void selectKategoriTiket(int kategoriTiket) {
    selectedKategoriTiket = kategoriTiket;
    update(["event_detail"]);
  }

  Future<void> showTiketCalendar(BuildContext context, int from) async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    );

    if (results != null && results.isNotEmpty) {
      DateTime time = results[0]!;
      if (from == 1) {
        strTicketStartDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
      } else {
        strTicketEndDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
      }
      update(["event_detail"]);
    }
  }

  void showEditTicket(int index) {
    selectedJenisTiket = ticketList[index]["ticket_type"] == "Berbayar" ? 1 : 2;
    selectedKategoriTiket = ticketList[index]["ticket_category"] == "Festival" ? 1 : 2;
    namaTiketController.text = "${ticketList[index]["name"]}";
    hargaTiketController.text = "${ticketList[index]["price"]}";
    jumlahTiketController.text = "${ticketList[index]["qty"]}";
    deskripsiTiketController.text = "${ticketList[index]["description"]}";
    strTicketStartDate = ticketList[index]["ticket_date"];
    strTicketEndDate = ticketList[index]["ticket_end"];
    update(["event_detail"]);
  }

  void clearTiket() {
    selectedJenisTiket = 0;
    selectedKategoriTiket = 0;
    namaTiketController.clear();
    hargaTiketController.clear();
    jumlahTiketController.clear();
    deskripsiTiketController.clear();
    strTicketStartDate = "YYYY/MM/DD";
    strTicketEndDate = "YYYY/MM/DD";
    update(["event_detail"]);
  }

  Future<void> tambahTicket(BuildContext context) async {
    String namaTiket = namaTiketController.text.trim();
    String hargaTiket = hargaTiketController.text.trim();
    String jumlahTiket = jumlahTiketController.text.trim();
    String deskripsiTiket = deskripsiTiketController.text.trim();

    if (selectedJenisTiket == 0) { CustomToast.showToast("Pilih jenis tiket", context); return; }
    if (selectedKategoriTiket == 0) { CustomToast.showToast("Pilih kategori tiket", context); return; }
    if (namaTiket.isEmpty) { CustomToast.showToast("Masukkan nama tiket", context); return; }
    if (strTicketStartDate == "YYYY/MM/DD") { CustomToast.showToast("Pilih tanggal mulai", context); return; }
    if (strTicketEndDate == "YYYY/MM/DD") { CustomToast.showToast("Pilih tanggal berakhir", context); return; }
    if (hargaTiket.isEmpty) { CustomToast.showToast("Masukkan harga tiket", context); return; }
    if (jumlahTiket.isEmpty) { CustomToast.showToast("Masukkan jumlah tiket", context); return; }
    if (deskripsiTiket.isEmpty) { CustomToast.showToast("Masukkan deskripsi tiket", context); return; }

    Get.back();
    CustomLoading.showLoadingDialog(buildContext, "Loading...");
    await Future.delayed(const Duration(milliseconds: 500));

    ticketList.add({
      "id": ticketList.length + 1,
      "name": namaTiket,
      "price": int.tryParse(hargaTiket) ?? 0,
      "qty": int.tryParse(jumlahTiket) ?? 0,
      "description": deskripsiTiket,
      "ticket_date": strTicketStartDate,
      "ticket_end": strTicketEndDate,
      "ticket_type": selectedJenisTiket == 1 ? "Berbayar" : "Gratis",
      "ticket_category": selectedKategoriTiket == 1 ? "Festival" : "Standing",
    });

    Get.back();
    CustomToast.showSuccessToast("Berhasil tambah tiket", buildContext!);
    clearTiket();
    update(["event_detail"]);
  }

  Future<void> editTicket(BuildContext context, int index) async {
    String namaTiket = namaTiketController.text.trim();
    String hargaTiket = hargaTiketController.text.trim();
    String jumlahTiket = jumlahTiketController.text.trim();
    String deskripsiTiket = deskripsiTiketController.text.trim();

    if (selectedJenisTiket == 0) { CustomToast.showToast("Pilih jenis tiket", context); return; }
    if (selectedKategoriTiket == 0) { CustomToast.showToast("Pilih kategori tiket", context); return; }
    if (namaTiket.isEmpty) { CustomToast.showToast("Masukkan nama tiket", context); return; }
    if (strTicketStartDate == "YYYY/MM/DD") { CustomToast.showToast("Pilih tanggal mulai", context); return; }
    if (strTicketEndDate == "YYYY/MM/DD") { CustomToast.showToast("Pilih tanggal berakhir", context); return; }
    if (hargaTiket.isEmpty) { CustomToast.showToast("Masukkan harga tiket", context); return; }
    if (jumlahTiket.isEmpty) { CustomToast.showToast("Masukkan jumlah tiket", context); return; }
    if (deskripsiTiket.isEmpty) { CustomToast.showToast("Masukkan deskripsi tiket", context); return; }

    Get.back();
    CustomLoading.showLoadingDialog(buildContext, "Loading...");
    await Future.delayed(const Duration(milliseconds: 500));

    ticketList[index] = {
      ...ticketList[index],
      "name": namaTiket,
      "price": int.tryParse(hargaTiket) ?? 0,
      "qty": int.tryParse(jumlahTiket) ?? 0,
      "description": deskripsiTiket,
      "ticket_date": strTicketStartDate,
      "ticket_end": strTicketEndDate,
      "ticket_type": selectedJenisTiket == 1 ? "Berbayar" : "Gratis",
      "ticket_category": selectedKategoriTiket == 1 ? "Festival" : "Standing",
    };

    Get.back();
    CustomToast.showSuccessToast("Berhasil edit tiket", buildContext!);
    clearTiket();
    update(["event_detail"]);
  }
}
