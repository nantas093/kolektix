import 'dart:async';

import 'package:get/get.dart';
import 'package:kolektix/app/modules/login/views/login_view.dart';
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
      String data = preference.getString("data") ?? "";

      if(data.isNotEmpty){
        Get.offAll(()=> const MenuScreenView());
      }
      else{
        Get.offAll(()=> const LoginView());
      }
    });
  }
}