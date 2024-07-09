import 'package:get/get.dart';

import '../controllers/checkin_event_controller.dart';

class CheckinEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckinEventController>(
      () => CheckinEventController(),
    );
  }
}
