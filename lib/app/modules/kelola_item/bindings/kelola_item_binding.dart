import 'package:get/get.dart';

import '../controllers/kelola_item_controller.dart';

class KelolaItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KelolaItemController>(
      () => KelolaItemController(),
    );
  }
}
