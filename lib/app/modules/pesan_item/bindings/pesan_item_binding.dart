import 'package:get/get.dart';

import '../controllers/pesan_item_controller.dart';

class PesanItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesanItemController>(
      () => PesanItemController(),
    );
  }
}
