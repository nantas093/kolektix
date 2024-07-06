import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/connection/my_connection.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/email_verification/views/email_verification_view.dart';
import 'package:kolektix/app/utils/custom_loading.dart';

class LoginController extends GetxController {

  MyConnection myConnection = MyConnection();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(BuildContext context) async {
    String email = emailController.text.toString().trim();

    if(email.isEmpty){
      CustomToast.showToast("Isi email terlebih dahulu", context);
      return;
    }

    Map<String,dynamic> body = {};
    body["email"] = email;

    CustomLoading.showLoadingDialog(context, "Loading...");

    try{
      await myConnection.getDioConnection("").post(MyConstant.LOGIN, data: body);

      Get.back();
      Get.to(()=> const EmailVerificationView(), arguments: {"is_menu" :
      true, "email" : email});

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