import 'package:get/get.dart';

import '../controllers/creator_registration_controller.dart';

class CreatorRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatorRegistrationController>(
      () => CreatorRegistrationController(),
    );
  }
}
