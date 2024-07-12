import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventDetailController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  int tabPosition = 0;

  Map data = {};

  int detailIndex = 1;
  int ticketIndex = 1;

  String strDetail = "";

  MyConnection myConnection = MyConnection();

  List<dynamic> ticketList = [];
  List<dynamic> pemesananList = [];

  String accessToken = "";
  int creatorId = 0;
  int talentId = 0;

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
    loadProfile();
    loadPemesanan();
    super.onInit();
  }

  Future<void> loadProfile() async {
    var preference = await SharedPreferences.getInstance();
    String data = preference.getString("data") ?? "";
    Map dataMap = jsonDecode(data);
    accessToken = preference.getString("access_token") ?? "";

    if(dataMap["has_creator"] != null) {
      creatorId = dataMap["has_creator"]["id"];
    }

    loadTickets();
  }

  void changeTabPosition(int position){
    tabPosition = position;
    update(["event_detail"]);
  }

  void changeDetailIndex(int index){
    detailIndex = index;
    if(index == 1){
      strDetail = data["description"] ?? "";
    }
    else{
      strDetail = data["term_condition"] ?? "";
    }

    update(["event_detail"]);
  }

  void changeTicketIndex(int index){
    ticketIndex = index;
    update(["event_detail"]);
  }

  Future<void> loadTickets() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/event-ticket/${data["id"]}");
      var responseData = response.data;
      ticketList = responseData["data"];
      update(["event_detail"]);
    }
    catch(e){
      print(e);
    }
  }

  void selectJenisTiket(int jenisTiket){
    selectedJenisTiket = jenisTiket;
    update(["event_detail"]);
  }

  void selectKategoriTiket(int kategoriTiket){
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

    if(results != null){
      if(results.isNotEmpty){
        DateTime time = results[0]!;
        if(from == 1){
          strTicketStartDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
        }
        else{
          strTicketEndDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
        }
      }
      update(["event_detail"]);
    }
  }

  Future<void> loadPemesanan() async {
    try{
      var response = await myConnection.getDioConnection(accessToken).get(
          "/api/list-transaction-by-event?event_id=${data["id"]}");
      var responseData = response.data;
      pemesananList = responseData["data"];
      update(["event_detail"]);
    }
    catch(e){
      print(e);
    }
  }

  void showEditTicket(int index){
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

  void clearTiket(){
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
    String namaTiket = namaTiketController.text.toString().trim();
    String hargaTiket = hargaTiketController.text.toString().trim();
    String jumlahTiket = jumlahTiketController.text.toString().trim();
    String deskripsiTiket = deskripsiTiketController.text.toString().trim();

    if(selectedJenisTiket == 0){
      CustomToast.showToast("Pilih jenis tiket", context);
      return;
    }

    if(selectedKategoriTiket == 0){
      CustomToast.showToast("Pilih kategori tiket", context);
      return;
    }

    if(namaTiket.isEmpty){
      CustomToast.showToast("Masukkan nama tiket", context);
      return;
    }

    if(strTicketStartDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal mulai", context);
      return;
    }

    if(strTicketEndDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal berakhir", context);
      return;
    }

    if(hargaTiket.isEmpty){
      CustomToast.showToast("Masukkan harga tiket", context);
      return;
    }

    if(jumlahTiket.isEmpty){
      CustomToast.showToast("Masukkan jumlah tiket", context);
      return;
    }

    if(deskripsiTiket.isEmpty){
      CustomToast.showToast("Masukkan deskripsi tiket", context);
      return;
    }

    Map data = {};
    data["event_id"] = this.data["id"];
    data["ticket_type"] = selectedJenisTiket;
    data["ticket_category"] = selectedKategoriTiket;
    data["name"] = namaTiket;
    data["ticket_date"] = strTicketStartDate;
    data["ticket_end"] = strTicketEndDate;
    data["qty"] = int.parse(jumlahTiket);
    data["price"] = int.parse(hargaTiket);
    data["description"] = deskripsiTiket;

    Get.back();

    CustomLoading.showLoadingDialog(buildContext, "Loading...");

    try{
      await myConnection.getDioConnection(accessToken).post(
          "/api/event-ticket", data: data);

      Get.back();
      CustomToast.showSuccessToast("Berhasil edit tiket", buildContext!);

      loadTickets();
      update(["event_detail"]);
    }
    catch(e){
      Get.back();
      if(e is DioError){
        var data = e.response;
        if(data != null){
          String message = "";
          String errors = "";
          String error = "";

          if(data.data["message"] != null){
            message = data.data["message"].toString();
          }

          if(data.data["errors"] != null){
            errors = data.data["errors"].toString();
          }

          if(data.data["error"] != null){
            error = data.data["error"].toString();
          }

          CustomToast.showToast("$message $errors $error", context);
        }
        else{
          CustomToast.showToast("Something went wrong, try again later", context);
        }
      }
      else{
        CustomToast.showToast("Something went wrong, try again later", context);
      }
    }
  }

  Future<void> editTicket(BuildContext context, int index) async {
    String namaTiket = namaTiketController.text.toString().trim();
    String hargaTiket = hargaTiketController.text.toString().trim();
    String jumlahTiket = jumlahTiketController.text.toString().trim();
    String deskripsiTiket = deskripsiTiketController.text.toString().trim();

    if(selectedJenisTiket == 0){
      CustomToast.showToast("Pilih jenis tiket", context);
      return;
    }

    if(selectedKategoriTiket == 0){
      CustomToast.showToast("Pilih kategori tiket", context);
      return;
    }

    if(namaTiket.isEmpty){
      CustomToast.showToast("Masukkan nama tiket", context);
      return;
    }

    if(strTicketStartDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal mulai", context);
      return;
    }

    if(strTicketEndDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal berakhir", context);
      return;
    }

    if(hargaTiket.isEmpty){
      CustomToast.showToast("Masukkan harga tiket", context);
      return;
    }

    if(jumlahTiket.isEmpty){
      CustomToast.showToast("Masukkan jumlah tiket", context);
      return;
    }

    if(deskripsiTiket.isEmpty){
      CustomToast.showToast("Masukkan deskripsi tiket", context);
      return;
    }

    Map data = {};
    data["event_id"] = this.data["id"];
    data["ticket_type"] = selectedJenisTiket;
    data["ticket_category"] = selectedKategoriTiket;
    data["name"] = namaTiket;
    data["ticket_date"] = strTicketStartDate;
    data["ticket_end"] = strTicketEndDate;
    data["qty"] = int.parse(jumlahTiket);
    data["price"] = int.parse(hargaTiket);
    data["description"] = deskripsiTiket;

    Get.back();

    CustomLoading.showLoadingDialog(buildContext, "Loading...");

    try{
      await myConnection.getDioConnection(accessToken).put(
          "/api/event-ticket/${ticketList[index]["id"]}", data: data);

      Get.back();
      CustomToast.showSuccessToast("Berhasil edit tiket", buildContext!);

      loadTickets();
      update(["event_detail"]);
    }
    catch(e){
      Get.back();
      if(e is DioError){
        var data = e.response;
        if(data != null){
          String message = "";
          String errors = "";
          String error = "";

          if(data.data["message"] != null){
            message = data.data["message"].toString();
          }

          if(data.data["errors"] != null){
            errors = data.data["errors"].toString();
          }

          if(data.data["error"] != null){
            error = data.data["error"].toString();
          }

          CustomToast.showToast("$message $errors $error", context);
        }
        else{
          CustomToast.showToast("Something went wrong, try again later", context);
        }
      }
      else{
        CustomToast.showToast("Something went wrong, try again later", context);
      }
    }
  }
}