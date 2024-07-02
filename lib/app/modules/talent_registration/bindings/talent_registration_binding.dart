import 'package:get/get.dart';

import '../controllers/talent_registration_controller.dart';

class TalentRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TalentRegistrationController>(
      () => TalentRegistrationController(),
    );
  }
}
