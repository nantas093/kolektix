import 'dart:convert';
import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/event/views/event_view.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateEventController extends GetxController {
  MyConnection myConnection = MyConnection();
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

  int selectedRole = 0;
  int selectedFormatIndex = -1;
  int selectedTopikIndex = -1;
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
  List<Map> tickets = [];

  int selectedJenisTiket = 0;
  int selectedKategoriTiket = 0;

  TextEditingController namaTiketController = TextEditingController();
  TextEditingController hargaTiketController = TextEditingController();
  TextEditingController jumlahTiketController = TextEditingController();
  TextEditingController deskripsiTiketController = TextEditingController();

  String strTicketStartDate = "YYYY/MM/DD";
  String strTicketEndDate = "YYYY/MM/DD";

  bool isEdit = false;

  @override
  void onInit() {
    initTotalMaxTicket();
    loadUser();
    loadFormat();
    loadTopik();
    kGooglePlex = const CameraPosition(target: LatLng(-6.175376,
        106.827792), zoom: 10.5);
    super.onInit();
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
    try{
      var response = await myConnection.getDioConnection("").get(
          MyConstant.EVENT_FORMAT);
      var responseData = response.data;
      formatList = responseData;
      update(["create_event"]);
    }
    catch(e){
      print(e);
    }
  }

  Future<void> loadTopik() async {
    try{
      var response = await myConnection.getDioConnection("").get(
          MyConstant.EVENT_TOPIK);
      var responseData = response.data;
      topikList = responseData;
      update(["create_event"]);
    }
    catch(e){
      print(e);
    }
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

    String bodyEventTag = eventTagController.text.toString().trim();

    String startHour = startHourController.text.toString().trim();
    String startMinute = startMinuteController.text.toString().trim();
    String endHour = endHourController.text.toString().trim();
    String endMinute = endMinuteController.text.toString().trim();

    String locationName = placeNameController.text.toString().trim();
    String addressName = addressController.text.toString().trim();
    String cityName = cityController.text.toString().trim();

    String description = deskripsiController.text.toString().trim();
    String syarat = syaratController.text.toString().trim();

    if(imgBase64.isEmpty){
      CustomToast.showToast("Masukkan gambar", context);
      return;
    }

    if(bodyEventName.isEmpty){
      CustomToast.showToast("Masukkan nama event", context);
      return;
    }

    if(strDate == "Atur Tanggal Event"){
      CustomToast.showToast("Masukkan tanggal event", context);
      return;
    }

    if(strEventTime == "Atur Waktu Event"){
      CustomToast.showToast("Masukkan waktu event", context);
      return;
    }

    if(strInfoTicket == "Info Tiket"){
      CustomToast.showToast("Masukkan info tiket", context);
      return;
    }

    if(tickets.isEmpty){
      CustomToast.showToast("Tambahkan tiket", context);
      return;
    }

    if(description.isEmpty){
      changeTabPosition(2);
      CustomToast.showToast("Masukkan deskripsi event", context);
      return;
    }

    if(syarat.isEmpty){
      changeTabPosition(2);
      CustomToast.showToast("Masukkan syarat & ketentuan event", context);
      return;
    }

    Map data = {};
    data["creator_id"] = userId;
    data["name"] = bodyEventName;
    data["image"] = imgBase64;

    data["event_format_id"] = formatList[selectedFormatIndex]["id"];
    data["event_topic_id"] = topikList[selectedTopikIndex]["id"];
    data["tag"] = bodyEventTag;
    data["event_type_id"] = selectedRole;

    data["start_date"] = strStartDate;
    data["end_date"] = strEndDate;

    data["start_time"] = "${startHour.length > 1 ? startHour :"0$startHour"}:${startMinute.length > 1 ? startMinute :"0$startMinute"}";
    data["end_time"] = "${endHour.length > 1 ? endHour :"0$endHour"}:${endMinute.length > 1 ? endMinute :"0$endMinute"}";
    data["zone_time"] = selectedZone == 1 ? "Waktu Indonesia Barat" :
    selectedZone == 2 ? "Waktu Indonesia Tengah" : "Waktu Indonesia Timur";

    data["organization_method"] = selectedDiselenggarakan == 1 ? "Offline" : "Online";
    data["location_name"] = locationName;
    data["location_city"] = cityName;
    data["location_address"] = addressName;
    data["location_map"] = locationName;
    data["longitude"] = "$latitude";
    data["latitude"] = "$longitude";

    data["is_name"] = is_name;
    data["is_phone_number"] = is_phone_number;
    data["is_birthdate"] = is_birthday;
    data["is_email"] = is_email;
    data["is_noidentity"] = is_noidentity;
    data["is_gender"] = is_gender;

    data["max_buy_ticket"] = selectedMaxTiket;
    data["one_email_ticket"] = firstSwitched;
    data["one_id_one_ticket"] = secondSwitched;

    data["description"] = description;
    data["term_condition"] = syarat;
    data["save_as_draft"] = saveDraft;
    data["tickets"] = tickets;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection(accessToken).post(
          MyConstant.EVENT, data: data);

      Get.back();
      Get.to(()=> const EventView());
      CustomToast.showSuccessToast("Berhasil bikin event", context);
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