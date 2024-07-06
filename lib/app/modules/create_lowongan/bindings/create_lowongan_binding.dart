import 'package:get/get.dart';

import '../controllers/create_lowongan_controller.dart';

class CreateLowonganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateLowonganController>(
      () => CreateLowonganController(),
    );
  }
}
