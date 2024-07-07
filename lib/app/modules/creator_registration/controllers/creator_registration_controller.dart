import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/utils/custom_loading.dart';

import '../../email_verification/views/email_verification_view.dart';

class CreatorRegistrationController extends GetxController {
  MyConnection myConnection = MyConnection();

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

  void changeDropdownPosition(int position){
    dropdownPosition = position;
    update(["creator_registration"]);
  }

  void changeFilled(int position){
    if(position == 1){
      oneFilled = true;
    }
    else if(position == 2){
      twoFilled = true;
    }
    else if(position == 3){
      threeFilled = true;
    }
    else if(position == 4){
      fourFilled = true;
    }
    else{
      fiveFilled = true;
    }

    update(["creator_registration"]);
  }

  Future<void> pickFile(BuildContext buildContext) async {
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        File file = File(result.files.single.path!);
        imagePath = file.path;
        imgBase64 = convertToBase64(file);
        update(["creator_registration"]);
      }
    }
    catch(e){
      print(e);
    }
  }

  String convertToBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    return 'data:image/jpeg;base64,$base64Image';
  }

  Future<void> next(BuildContext context) async {
    String email = emailController.text.toString().trim();

    Map<String,dynamic> body = {};
    body["email"] = email;
    body["name"] = penyelenggaraController.text.toString().trim();

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection("").post(MyConstant.REGISTER, data: body);
      Get.back();

      Map data = {};
      data["name"] = penyelenggaraController.text.toString().trim();
      data["name_event_organizer"] = penanggungJawabController.text.toString().trim();
      data["alamat"] = alamatController.text.toString().trim();
      data["telp"] = "62${telpController.text.toString().trim()}";
      data["email"] = emailController.text.toString().trim();
      data["image"] = imgBase64;
      data["type"] = "creator";

      Get.off(()=> const EmailVerificationView(), arguments: {
        "is_menu" : false, "data" : data});

      CustomToast.showSuccessToast("OTP Code berhasil "
          "terkirim di email!", context);
    }
    catch(e){
      Get.back();
      if(e is DioError){
        var data = e.response;
        if(data != null){
          String message = "";
          String errors = "";
          String error = "";

          if(data.data["message"] != null){
            message = data.data["message"].toString();
          }

          if(data.data["errors"] != null){
            errors = data.data["errors"].toString();
          }

          if(data.data["error"] != null){
            error = data.data["error"].toString();
          }

          CustomToast.showToast("$message $errors $error", context);
        }
        else{
          CustomToast.showToast("Something went wrong, try again later", context);
        }
      }
      else{
        CustomToast.showToast("Something went wrong, try again later", context);
      }
    }
  }
}
