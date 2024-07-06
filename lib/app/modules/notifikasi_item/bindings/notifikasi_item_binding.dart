import 'package:get/get.dart';

import '../controllers/notifikasi_item_controller.dart';

class NotifikasiItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiItemController>(
      () => NotifikasiItemController(),
    );
  }
}
