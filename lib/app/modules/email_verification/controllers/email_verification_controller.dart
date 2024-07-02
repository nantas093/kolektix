import 'package:get/get.dart';

class EmailVerificationController extends GetxController {

  bool isMenu = false;

  @override
  void onInit() {
    if(Get.arguments != null){
      isMenu = Get.arguments["is_menu"];
    }
    super.onInit();
  }
}
