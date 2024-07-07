import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/utils/custom_loading.dart';

import '../../email_verification/views/email_verification_view.dart';

class TalentRegistrationController extends GetxController {
  MyConnection myConnection = MyConnection();

  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<dynamic> categoryList = [];

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
    loadCategory();
    super.onInit();
  }

  void changeDropdownPosition(int position){
    dropdownPosition = position;
    update(["talent_registration"]);
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
    update(["talent_registration"]);
  }

  Future<void> loadCategory() async {
    try{
      var response = await myConnection.getDioConnection("").get(
          MyConstant.TALENT_CATEGORY);
      var responseData = response.data;
      categoryList = responseData["data"];
      update(["talent_registration"]);
    }
    catch(e){
      print(e);
    }
  }

  void selectCategory(int index){
    categoryIndex = index;
    strCategory = categoryList[index]["name"];
    update(["talent_registration"]);
  }

  Future<void> next(BuildContext context) async {
    String email = emailController.text.toString().trim();

    Map<String,dynamic> body = {};
    body["email"] = email;
    body["name"] = nameController.text.toString().trim();

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection("").post(MyConstant.REGISTER, data: body);

      Get.back();

      Map data = {};
      data["name"] = nameController.text.toString().trim();
      data["category"] = categoryList[categoryIndex];
      data["alamat"] = alamatController.text.toString().trim();
      data["telp"] = "62${telpController.text.toString().trim()}";
      data["email"] = emailController.text.toString().trim();
      data["type"] = "talent";

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