import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateEventController extends GetxController {

  int tabPosition = 1;
  int selectedRole = 0;
  int selectedZone = 0;
  int selectedDiselenggarakan = 0;
  int selectedJenisTiket = 0;
  int selectedKategoriTiket = 0;

  bool firstSwitched = false;
  bool secondSwitched = false;

  late CameraPosition kGooglePlex;

  @override
  void onInit() {
    kGooglePlex = const CameraPosition(target: LatLng(-6.175376,
        106.827792), zoom: 10.5);
    super.onInit();
  }

  void changeTabPosition(int position){
    tabPosition = position;
    update(["create_event"]);
  }

  void firstSwitchCheck(){
    firstSwitched = !firstSwitched;
    update(["create_event"]);
  }

  void secondSwitchCheck(){
    secondSwitched = !secondSwitched;
    update(["create_event"]);
  }

  void selectRole(int role){
    selectedRole = role;
    update(["create_event"]);
  }

  void selectZone(int zone){
    selectedZone = zone;
    update(["create_event"]);
  }

  void selectDiselenggarakan(int diselenggarakan){
    selectedDiselenggarakan = diselenggarakan;
    update(["create_event"]);
  }

  void selectJenisTiket(int jenisTiket){
    selectedJenisTiket = jenisTiket;
    update(["create_event"]);
  }

  void selectKategoriTiket(int kategoriTiket){
    selectedKategoriTiket = kategoriTiket;
    update(["create_event"]);
  }
}