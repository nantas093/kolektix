import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/components/custom_toast.dart';
import 'package:kolektix/app/modules/creator_registration/views/creator_registration_view.dart';
import 'package:kolektix/app/modules/talent_registration/views/talent_registration_view.dart';

class SelectRoleController extends GetxController {

  int selectedRole = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void selectRole(int role){
    selectedRole = role;
    update(["select_role"]);
  }

  void nextPage(BuildContext context){
    if(selectedRole == 0){
      CustomToast.showToast("Pilih role terlebih dahulu", context);
      return;
    }

    if(selectedRole == 1){
      Get.to(()=> const CreatorRegistrationView());
    }
    else{
      Get.to(()=> const TalentRegistrationView());
    }
  }
}