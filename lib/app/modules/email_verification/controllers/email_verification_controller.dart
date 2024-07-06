import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerificationController extends GetxController {
  MyConnection myConnection = MyConnection();

  bool isMenu = false;
  String email = "";

  Duration duration = const Duration(
    minutes: 10,
    seconds: 0,
  );

  Map data = {};
  Map responseData = {};

  bool buttonShow = false;

  @override
  void onInit() {
    if(Get.arguments != null){
      isMenu = Get.arguments["is_menu"];
      if(isMenu){
        email = Get.arguments["email"];
      }
      else{
        data = Get.arguments["data"];
        email = data["email"];
      }
    }
    super.onInit();
  }

  Future<void> getCode(BuildContext context) async {
    Map<String,dynamic> body = {};
    body["email"] = email;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection("").post(MyConstant.LOGIN, data: body);

      duration = const Duration(
        minutes: 10,
        seconds: 0,
      );

      Get.back();
      CustomToast.showSuccessToast("OTP Code berhasil "
          "terkirim di email!", context);

      update(["email_verification"]);
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

  Future<void> verifyCode(BuildContext context, String code) async {
    Map<String,dynamic> body = {};
    body["email"] = email;
    body["otp_code"] = code;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      var response = await myConnection.getDioConnection("").post(
          MyConstant.VERIFY_LOGIN, data: body);
      var responseData = response.data;
      String strData = jsonEncode(responseData["data"]).toString();

      var preference = await SharedPreferences.getInstance();
      preference.setString("access_token", responseData["access_token"]);
      preference.setString("data", strData);

      Get.back();
      CustomToast.showSuccessToast("Berhasil login", context);

      Get.offAll(()=> const MenuScreenView());
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

  Future<void> getRegisterCode(BuildContext context) async {
    Map<String,dynamic> body = {};
    body["email"] = email;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection("").post(MyConstant.REGISTER, data: body);

      duration = const Duration(
        minutes: 10,
        seconds: 0,
      );

      Get.back();
      CustomToast.showSuccessToast("OTP Code berhasil "
          "terkirim di email!", context);

      update(["email_verification"]);
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

  Future<void> verifyRegisterTalentCode(BuildContext context, String code) async {
    Map<String,dynamic> body = {};
    body["email"] = email;
    body["otp_code"] = code;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      var response = await myConnection.getDioConnection("").post(
          MyConstant.VERIFY_REGISTER, data: body);
      responseData = response.data;
      buttonShow = true;
      update(["email_verification"]);
      Get.back();
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

  Future<void> registerTalent(BuildContext context) async {
    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      int userId = responseData["data"]["id"];
      String accessToken = responseData["access_token"];

      Map<String,dynamic> talentBody = {};
      talentBody["user_id"] = userId;
      talentBody["talent_category_id"] = data["category"]["id"];
      talentBody["name"] = data["name"];
      talentBody["email"] = email;
      talentBody["phone"] = data["telp"];
      talentBody["location"] = data["alamat"];

      await myConnection.getDioConnection(accessToken).post(
          MyConstant.CREATE_TALENT, data: talentBody);

      String strData = jsonEncode(responseData["data"]).toString();

      var preference = await SharedPreferences.getInstance();
      preference.setString("access_token", responseData["access_token"]);
      preference.setString("data", strData);

      Get.back();
      CustomToast.showSuccessToast("Berhasil register", context);

      Get.offAll(()=> const MenuScreenView());
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

  Future<void> registerCreator(BuildContext context) async {
    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      int userId = responseData["data"]["id"];
      String accessToken = responseData["access_token"];

      Map<String,dynamic> talentBody = {};

      talentBody["name"] = data["name"];
      talentBody["location"] = data["alamat"];
      talentBody["phone_number"] = data["telp"];
      talentBody["email"] = email;
      talentBody["user_id"] = userId;
      talentBody["status"] = "active";

      await myConnection.getDioConnection(accessToken).post(
          MyConstant.CREATE_CREATOR, data: talentBody);

      String strData = jsonEncode(responseData["data"]).toString();

      var preference = await SharedPreferences.getInstance();
      preference.setString("access_token", responseData["access_token"]);
      preference.setString("data", strData);

      Get.back();
      CustomToast.showSuccessToast("Berhasil register", context);

      Get.offAll(()=> const MenuScreenView());
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