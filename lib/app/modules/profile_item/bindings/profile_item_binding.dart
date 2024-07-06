import 'package:get/get.dart';

import '../controllers/profile_item_controller.dart';

class ProfileItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileItemController>(
      () => ProfileItemController(),
    );
  }
}
