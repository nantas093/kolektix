import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';

class CreatorRegistrationController extends GetxController {

  int dropdownPosition = 1;

  bool oneFilled = false;
  bool twoFilled = false;
  bool threeFilled = false;
  bool fourFilled = false;
  bool fiveFilled = false;

  TextEditingController penyelenggaraController = TextEditingController();
  TextEditingController penanggungJawabController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String imagePath = "";
  String imgBase64 = "";

  @override
  void onInit() {
    super.onInit();
  }

  void changeDropdownPosition(int position) {
    dropdownPosition = position;
    update(["creator_registration"]);
  }

  void changeFilled(int position) {
    if (position == 1) oneFilled = true;
    else if (position == 2) twoFilled = true;
    else if (position == 3) threeFilled = true;
    else if (position == 4) fourFilled = true;
    else fiveFilled = true;
    update(["creator_registration"]);
  }

  Future<void> pickFile(BuildContext buildContext) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        imagePath = file.path;
        imgBase64 = convertToBase64(file);
        update(["creator_registration"]);
      }
    } catch (e) {
      print(e);
    }
  }

  String convertToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    return 'data:image/jpeg;base64,${base64Encode(imageBytes)}';
  }

  Future<void> next(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      CustomToast.showToast("Masukkan email", context);
      return;
    }
    CustomToast.showSuccessToast("Berhasil register creator", context);
    Get.offAll(() => const MenuScreenView());
  }
}
