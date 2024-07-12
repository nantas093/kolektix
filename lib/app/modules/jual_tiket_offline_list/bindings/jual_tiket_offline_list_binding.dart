import 'package:get/get.dart';

import '../controllers/jual_tiket_offline_list_controller.dart';

class JualTiketOfflineListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JualTiketOfflineListController>(
      () => JualTiketOfflineListController(),
    );
  }
}
