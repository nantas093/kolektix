import 'package:get/get.dart';

import '../controllers/home_item_controller.dart';

class HomeItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeItemController>(
      () => HomeItemController(),
    );
  }
}
