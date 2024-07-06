import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileItemController extends GetxController {

  List<String> menus = [];
  List<String> icons = [];

  @override
  void onInit() {
    initList();
    super.onInit();
  }

  void initList(){
    menus.add("Informasi Dasar");
    menus.add("Informasi Legal");
    menus.add("Rekening");
    menus.add("Bookmark");

    icons.add(MyConstant.IC_DASAR);
    icons.add(MyConstant.IC_LEGAL);
    icons.add(MyConstant.IC_REKENING);
    icons.add(MyConstant.IC_BOOKMARK);
  }

  Future<void> logout() async {
    var preference = await SharedPreferences.getInstance();
    await preference.remove("data");
    await preference.remove("access_token");
    await preference.clear();

    Get.offAll(()=> LoginView());
  }
}
