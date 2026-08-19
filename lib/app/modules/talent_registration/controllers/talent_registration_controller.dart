import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';

class TalentRegistrationController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<dynamic> categoryList = [
    {"id": 1, "name": "Penyanyi"},
    {"id": 2, "name": "Band"},
    {"id": 3, "name": "MC"},
    {"id": 4, "name": "Komedian"},
    {"id": 5, "name": "Dancer"},
  ];

  int dropdownPosition = 1;

  bool oneFilled = false;
  bool twoFilled = false;
  bool threeFilled = false;
  bool fourFilled = false;
  bool fiveFilled = false;

  String strCategory = "Kategori talent";
  int categoryIndex = -1;

  @override
  void onInit() {
    super.onInit();
  }

  void changeDropdownPosition(int position) {
    dropdownPosition = position;
    update(["talent_registration"]);
  }

  void changeFilled(int position) {
    if (position == 1) oneFilled = true;
    else if (position == 2) twoFilled = true;
    else if (position == 3) threeFilled = true;
    else if (position == 4) fourFilled = true;
    else fiveFilled = true;
    update(["talent_registration"]);
  }

  void selectCategory(int index) {
    categoryIndex = index;
    strCategory = categoryList[index]["name"];
    update(["talent_registration"]);
  }

  Future<void> next(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      CustomToast.showToast("Masukkan email", context);
      return;
    }
    CustomToast.showSuccessToast("Berhasil register talent", context);
    Get.offAll(() => const MenuScreenView());
  }
}
