import 'package:get/get.dart';

class TalentRegistrationController extends GetxController {

  int dropdownPosition = 1;

  bool oneFilled = false;
  bool twoFilled = false;
  bool threeFilled = false;
  bool fourFilled = false;
  bool fiveFilled = false;

  @override
  void onInit() {
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
}