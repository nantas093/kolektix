import 'package:get/get.dart';

class CreatorRegistrationController extends GetxController {

  int dropdownPosition = 1;

  bool oneFilled = false;
  bool twoFilled = false;
  bool threeFilled = false;
  bool fourFilled = false;

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
    else {
      fourFilled = true;
    }

    update(["creator_registration"]);
  }
}
