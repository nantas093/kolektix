import 'dart:async';

import 'package:get/get.dart';
import 'package:kolektix/app/modules/login/views/login_view.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    splash();
    super.onInit();
  }

  Future<void> splash() async {
    Timer(const Duration(milliseconds: 1500), () async {
      Get.offAll(()=> const LoginView());
    });
  }
}
