import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kolektix/app/modules/menu_screen/bindings/menu_screen_binding.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    splash();
    super.onInit();
  }

  Future<void> splash() async {
    Timer(const Duration(milliseconds: 1500), () async {
      var preference = await SharedPreferences.getInstance();
      preference.setString("access_token", "dummy_token");
      preference.setString("data", jsonEncode({
        "id": 1,
        "name": "Budi Santoso",
        "email": "budi@kolektix.com",
        "has_creator": {
          "id": 1,
          "name": "Budi Santoso",
          "name_event_organizer": "Kolektix EO",
          "email": "budi@kolektix.com",
          "phone_number": "081234567890",
          "location": "Jakarta",
          "status": "active"
        }
      }));
      Get.offAll(
        () => const MenuScreenView(),
        binding: MenuScreenBinding(),
      );
    });
  }
}

