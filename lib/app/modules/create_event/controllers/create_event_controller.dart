import 'dart:convert';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/event/views/event_view.dart';
import 'package:kolektix/app/modules/home/views/home_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEventController extends GetxController {
  GoogleMapController? googleMapController;

  int userId = 0;
  String accessToken = "";

  int tabPosition = 1;
  int selectedZone = 0;
  int selectedDiselenggarakan = 0;

  bool firstSwitched = false;
  bool secondSwitched = false;
  int selectedMaxTiket = 1;
  List<int> maxTicketList = [];

  late CameraPosition kGooglePlex;

  //Event Image
  String imagePath = "";
  String imgBase64 = "";

  //Event Name
  TextEditingController eventNameController = TextEditingController();

  //Event Category
  String strEventCategory = "Pilih Kategori";
  String strEventTopik = "Pilih topik event";
  String strEventFormat = "Pilih format event";

  int selectedFormatIndex = -1;
  int selectedTopikIndex = -1;
  int selectedRole = 0;
  int selectedCategoryIndex = -1;

  List<dynamic> formatList = [];
  List<dynamic> topikList = [];
  List<dynamic> categoryList = [];

  TextEditingController eventTagController = TextEditingController();

  // Event Date
  String strDate = "Atur Tanggal Event";
  String strStartDate = "YYYY/MM/DD";
  String strEndDate = "YYYY/MM/DD";

  // Event Time
  TextEditingController startHourController = TextEditingController();
  TextEditingController startMinuteController = TextEditingController();
  TextEditingController endHourController = TextEditingController();
  TextEditingController endMinuteController = TextEditingController();

  String strEventTime = "Atur Waktu Event";

  //Event ticket info
  String strInfoTicket = "Info Tiket";
  TextEditingController placeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  double latitude = 0.0;
  double longitude = 0.0;

  //Formulir
  bool is_name = false;
  bool is_phone_number = false;
  bool is_birthday = false;
  bool is_email = false;
  bool is_noidentity = false;
  bool is_gender = false;

  //Detail Event
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController syaratController = TextEditingController();

  //Tambah Tiket
  List<dynamic> tickets = [];

  int selectedJenisTiket = 0;
  int selectedKategoriTiket = 0;

  TextEditingController namaTiketController = TextEditingController();
  TextEditingController hargaTiketController = TextEditingController();
  TextEditingController jumlahTiketController = TextEditingController();
  TextEditingController deskripsiTiketController = TextEditingController();

  String strTicketStartDate = "YYYY/MM/DD";
  String strTicketEndDate = "YYYY/MM/DD";

  bool isEdit = false;

  Map? data;
  bool imageClicked = false;

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["data"] != null){
        data = Get.arguments["data"];
      }
    }

    initTotalMaxTicket();
    loadUser();
    loadFormat();
    kGooglePlex = const CameraPosition(target: LatLng(-6.175376,
        106.827792), zoom: 10.5);
    super.onInit();
  }

  Future<void> initEditData() async {
    loadTickets();

    imagePath = data!["image_url"];
    imgBase64 = await networkImageToBase64(imagePath) ?? "";

    is_name = data!["is_name"] == 1 ? true : false;
    is_phone_number = data!["is_phone_number"] == 1 ? true : false;
    is_birthday = data!["is_birthday"] == 1 ? true : false;
    is_email = data!["is_email"] == 1 ? true : false;
    is_noidentity = data!["is_noidentity"] == 1 ? true : false;
    is_gender = data!["is_gender"] == 1 ? true : false;

    eventNameController.text = data!["name"];
    selectedFormatIndex = data!["event_format_id"] - 1;
    selectedTopikIndex = data!["event_topic_id"] - 1;

    strEventTopik = formatList[data!["event_format_id"] - 1]["name"];
    strEventFormat = topikList[data!["event_topic_id"] - 1]["name"];
    strEventCategory = strEventFormat;

    eventTagController.text = data!["tag"];
    selectedRole = data!["event_type_id"];

    strStartDate = data!["start_date"];
    strEndDate = data!["end_date"];
    strDate = "$strStartDate - $strEndDate";

    strEventTime = "${data!["start_time"]} - ${data!["end_time"]}";

    startHourController.text = data!["start_time"].toString().split(":")[0];
    startMinuteController.text = data!["start_time"].toString().split(":")[1];
    endHourController.text = data!["end_time"].toString().split(":")[0];
    endMinuteController.text = data!["end_time"].toString().split(":")[1];

    selectedZone = 1;
    selectedDiselenggarakan = data!["organization_method"] == "Offline" ? 1 : 2;
    placeNameController.text = data!["location_name"];
    addressController.text = data!["location_address"];
    cityController.text = data!["location_city"];

    latitude = data!["latitude"] ?? 0.0;
    longitude = data!["longitude"] ?? 0.0;

    strInfoTicket = data!["location_name"];
    firstSwitched = data!["max_buy_ticket"] == 1 ? true : false;
    secondSwitched = data!["one_id_one_ticket"] == 1 ? true : false;

    deskripsiController.text = data!["description"];
    syaratController.text = data!["term_condition"];

    update(["create_event"]);
  }

  Future<void> loadUser() async {
    var preference = await SharedPreferences.getInstance();
    String data = preference.getString("data") ?? "";
    accessToken = preference.getString("access_token") ?? "";
    userId = jsonDecode(data)["id"];
  }

  void initTotalMaxTicket(){
    for(int i = 0; i < 10; i++){
      maxTicketList.add(i+1);
    }
  }

  void selectMaxTicket(int index){
    selectedMaxTiket = maxTicketList[index];
    update(["create_event"]);
  }

  void changeTabPosition(int position){
    tabPosition = position;
    update(["create_event"]);
  }

  void firstSwitchCheck(){
    firstSwitched = !firstSwitched;
    update(["create_event"]);
  }

  void secondSwitchCheck(){
    secondSwitched = !secondSwitched;
    update(["create_event"]);
  }

  void selectRole(int role){
    selectedRole = role;
    update(["create_event"]);
  }

  void selectZone(int zone){
    selectedZone = zone;
    update(["create_event"]);
  }

  void selectDiselenggarakan(int diselenggarakan){
    selectedDiselenggarakan = diselenggarakan;
    update(["create_event"]);
  }

  void selectJenisTiket(int jenisTiket){
    selectedJenisTiket = jenisTiket;
    update(["create_event"]);
  }

  void selectKategoriTiket(int kategoriTiket){
    selectedKategoriTiket = kategoriTiket;
    update(["create_event"]);
  }

  Future<void> pickFile(BuildContext buildContext) async {
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        imageClicked = true;
        File file = File(result.files.single.path!);
        imagePath = file.path;
        imgBase64 = convertToBase64(file);
        update(["create_event"]);
      }
    }
    catch(e){
      print(e);
    }
  }

  String convertToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return 'data:image/jpeg;base64,$base64Image';
  }

  Future<void> loadFormat() async {
    formatList = [
      {"id": 1, "name": "Online"},
      {"id": 2, "name": "Offline"},
      {"id": 3, "name": "Hybrid"},
    ];
    loadTopik();
    update(["create_event"]);
  }

  Future<void> loadTopik() async {
    topikList = [
      {"id": 1, "name": "Musik"},
      {"id": 2, "name": "Teknologi"},
      {"id": 3, "name": "Seni & Budaya"},
      {"id": 4, "name": "Olahraga"},
      {"id": 5, "name": "Bisnis"},
    ];

    if (data != null) {
      initEditData();
    }

    update(["create_event"]);
  }

  void selectFormat(int index){
    selectedFormatIndex = index;
    strEventFormat = formatList[index]["name"];
    update(["create_event"]);
  }

  void selectTopik(int index){
    selectedTopikIndex = index;
    strEventTopik = topikList[index]["name"];
    update(["create_event"]);
  }

  void simpanCategory(BuildContext context){
    String strTag = eventTagController.text.toString().trim();

    if(strEventFormat == "Pilih format event"){
      CustomToast.showToast("Pilih format", context);
      return;
    }
    if(strEventTopik == "Pilih topik event"){
      CustomToast.showToast("Pilih topik", context);
      return;
    }
    if(strTag.isEmpty){
      CustomToast.showToast("Masukan tag", context);
      return;
    }
    if(selectedRole == 0){
      CustomToast.showToast("Pilih jenis event", context);
      return;
    }

    strEventCategory = strEventFormat;

    Get.back();
    update(["create_event"]);
  }

  Future<void> showCalendar(BuildContext context, int from) async {
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
          strStartDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
        }
        else{
          strEndDate = MyParseDate.parseGeneralDate(time, "yyyy-MM-dd");
        }
      }
      update(["create_event"]);
    }
  }

  void simpanTanggalEvent(BuildContext context){
    if(strStartDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal mulai", context);
      return;
    }

    if(strEndDate == "YYYY/MM/DD"){
      CustomToast.showToast("Pilih tanggal berakhir", context);
      return;
    }

    strDate = "$strStartDate - $strEndDate";

    Get.back();
    update(["create_event"]);
  }

  void simpanWaktuEvent(BuildContext context){
    String startHour = startHourController.text.toString().trim();
    String startMinute = startMinuteController.text.toString().trim();
    String endHour = endHourController.text.toString().trim();
    String endMinute = endMinuteController.text.toString().trim();

    if(startHour.isEmpty){
      CustomToast.showToast("Pilih jam awal", context);
      return;
    }
    if(startMinute.isEmpty){
      CustomToast.showToast("Pilih menit awal", context);
      return;
    }
    if(endHour.isEmpty){
      CustomToast.showToast("Pilih jam berakhir", context);
      return;
    }
    if(endMinute.isEmpty){
      CustomToast.showToast("Pilih menit berakhir", context);
      return;
    }

    if(selectedZone == -1){
      CustomToast.showToast("Pilih zona waktu", context);
      return;
    }

    strEventTime = "$startHour:$startMinute - $endHour:$endMinute";
    Get.back();
    update(["create_event"]);
  }

  void simpanLokasiEvent(BuildContext context){
    String namaTempat = placeNameController.text.toString().trim();
    String alamat = addressController.text.toString().trim();
    String kota = cityController.text.toString().trim();

    if(selectedDiselenggarakan == 0){
      CustomToast.showToast("Pilih event diselenggarakan", context);
      return;
    }

    if(namaTempat.isEmpty){
      CustomToast.showToast("Masukkan nama tempat", context);
      return;
    }
    if(alamat.isEmpty){
      CustomToast.showToast("Masukkan alamat", context);
      return;
    }
    if(kota.isEmpty){
      CustomToast.showToast("Masukkan kota", context);
      return;
    }

    strInfoTicket = namaTempat;
    Get.back();
    update(["create_event"]);
  }

  void checkNamaLengkap(){
    is_name = !is_name;
    update(["create_event"]);
  }

  void checkEmail(){
    is_email = !is_email;
    update(["create_event"]);
  }

  void checkHandphone(){
    is_phone_number = !is_phone_number;
    update(["create_event"]);
  }

  void checkKtp(){
    is_noidentity = !is_noidentity;
    update(["create_event"]);
  }

  void checkBirthday(){
    is_birthday = !is_birthday;
    update(["create_event"]);
  }

  void checkGender(){
    is_gender = !is_gender;
    update(["create_event"]);
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
      update(["create_event"]);
    }
  }

  void tambahTicket(BuildContext context){
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
    data["ticket_type"] = selectedJenisTiket == 1 ? "Berbayar" : "Gratis";
    data["ticket_category"] = selectedKategoriTiket == 1 ? "Festival" : "Seated";
    data["name"] = namaTiket;
    data["ticket_date"] = strTicketStartDate;
    data["ticket_end"] = strTicketEndDate;
    data["qty"] = int.parse(jumlahTiket);
    data["price"] = int.parse(hargaTiket);
    data["description"] = deskripsiTiket;

    tickets.add(data);
    Get.back();
    clearTiket();
    update(["create_event"]);
  }

  void deleteTiket(int index){
    tickets.removeAt(index);
    update(["create_event"]);
  }

  void showEditTicket(int index){
    selectedJenisTiket = tickets[index]["ticket_type"] == "Berbayar" ? 1 : 2;
    selectedKategoriTiket = tickets[index]["ticket_category"] == "Festival" ? 1 : 2;
    namaTiketController.text = "${tickets[index]["name"]}";
    hargaTiketController.text = "${tickets[index]["price"]}";
    jumlahTiketController.text = "${tickets[index]["qty"]}";
    deskripsiTiketController.text = "${tickets[index]["description"]}";
    strTicketStartDate = tickets[index]["ticket_date"];
    strTicketEndDate = tickets[index]["ticket_end"];
    update(["create_event"]);
  }

  void editTicket(BuildContext context, int index){
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

    tickets[index]["ticket_type"] = selectedJenisTiket == 1 ? "Berbayar" : "Gratis";
    tickets[index]["ticket_category"] = selectedKategoriTiket == 1 ? "Festival" : "Seated";
    tickets[index]["name"] = namaTiket;
    tickets[index]["ticket_date"] = strTicketStartDate;
    tickets[index]["ticket_end"] = strTicketEndDate;
    tickets[index]["qty"] = int.parse(jumlahTiket);
    tickets[index]["price"] = int.parse(hargaTiket);
    tickets[index]["description"] = deskripsiTiket;

    Get.back();
    clearTiket();
    update(["create_event"]);
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
    update(["create_event"]);
  }

  Future<void> createEvent(BuildContext context, bool saveDraft) async {
    String bodyEventName = eventNameController.text.toString().trim();
    String description = deskripsiController.text.toString().trim();
    String syarat = syaratController.text.toString().trim();

    if (imgBase64.isEmpty) { CustomToast.showToast("Masukkan gambar", context); return; }
    if (bodyEventName.isEmpty) { CustomToast.showToast("Masukkan nama event", context); return; }
    if (strDate == "Atur Tanggal Event") { CustomToast.showToast("Masukkan tanggal event", context); return; }
    if (strEventTime == "Atur Waktu Event") { CustomToast.showToast("Masukkan waktu event", context); return; }
    if (strInfoTicket == "Info Tiket") { CustomToast.showToast("Masukkan info tiket", context); return; }
    if (tickets.isEmpty) { CustomToast.showToast("Tambahkan tiket", context); return; }
    if (description.isEmpty) { changeTabPosition(2); CustomToast.showToast("Masukkan deskripsi event", context); return; }
    if (syarat.isEmpty) { changeTabPosition(2); CustomToast.showToast("Masukkan syarat & ketentuan event", context); return; }

    CustomLoading.showLoadingDialog(context, "Loading...");
    await Future.delayed(const Duration(seconds: 1));
    Get.back();

    if (this.data != null) {
      Get.offAll(() => const HomeView());
    } else {
      Get.to(() => const EventView());
    }

    CustomToast.showSuccessToast(
        this.data != null ? "Berhasil edit event" : "Berhasil bikin event",
        context);
  }

  Future<void> loadTickets() async {
    if (data != null) {
      tickets = [
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
      ];
      update(["create_event"]);
    }
  }

  Future<String?> networkImageToBase64(String imageUrl) async {
    return null;
  }
}