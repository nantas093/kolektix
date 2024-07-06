import 'package:get/get.dart';

import '../controllers/create_venue_controller.dart';

class CreateVenueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateVenueController>(
      () => CreateVenueController(),
    );
  }
}
