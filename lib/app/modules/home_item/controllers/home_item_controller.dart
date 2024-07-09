import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeItemController extends GetxController {

  String name = "";

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  Future<void> loadUser() async {
    var preference = await SharedPreferences.getInstance();
    String data = preference.getString("data") ?? "";
    name = jsonDecode(data)["name"] ?? "";
    update(["home_item"]);
  }
}