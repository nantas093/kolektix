import 'package:get/get.dart';

import '../controllers/jual_tiket_offline_controller.dart';

class JualTiketOfflineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JualTiketOfflineController>(
      () => JualTiketOfflineController(),
    );
  }
}
