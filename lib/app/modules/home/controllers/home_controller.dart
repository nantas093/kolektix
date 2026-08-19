import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/home_item/bindings/home_item_binding.dart';
import 'package:kolektix/app/modules/home_item/views/home_item_view.dart';
import 'package:kolektix/app/modules/kelola_item/bindings/kelola_item_binding.dart';
import 'package:kolektix/app/modules/kelola_item/views/kelola_item_view.dart';
import 'package:kolektix/app/modules/notifikasi_item/bindings/notifikasi_item_binding.dart';
import 'package:kolektix/app/modules/notifikasi_item/views/notifikasi_item_view.dart';
import 'package:kolektix/app/modules/pesan_item/bindings/pesan_item_binding.dart';
import 'package:kolektix/app/modules/pesan_item/views/pesan_item_view.dart';
import 'package:kolektix/app/modules/profile_item/bindings/profile_item_binding.dart';
import 'package:kolektix/app/modules/profile_item/views/profile_item_view.dart';
import 'package:kolektix/app/utils/persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  void onInit() {
    super.onInit();
  }

  List<Widget> buildScreens() {
    // Initialize bindings for each screen
    HomeItemBinding().dependencies();
    KelolaItemBinding().dependencies();
    PesanItemBinding().dependencies();
    NotifikasiItemBinding().dependencies();
    ProfileItemBinding().dependencies();
    
    return [
      const HomeItemView(),
      const KelolaItemView(),
      const PesanItemView(),
      const NotifikasiItemView(),
      const ProfileItemView()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      persistentItem("Beranda", MyConstant.IC_BERANDA),
      persistentItem("Kelola", MyConstant.IC_KELOLA_NEW),
      persistentItem("Pesan", MyConstant.IC_PESAN),
      persistentItem("Pesanan", MyConstant.IC_KELOLA),
      persistentItem("Profile", MyConstant.IC_PROFILE)
    ];
  }

  PersistentBottomNavBarItem persistentItem(String name, String icon){
    return PersistentBottomNavBarItem(
        icon: SvgPicture.asset(icon, color: Color.fromRGBO(11, 56, 124, 1)),
        inactiveIcon: SvgPicture.asset(icon, color: Colors.black),
        title: (name),
        activeColorPrimary: Color.fromRGBO(11, 56, 124, 1),
        activeColorSecondary: Colors.black,
        inactiveColorPrimary: Colors.grey,
        textStyle: TextStyle(
            fontFamily: "InterMedium",
            fontSize: 0.013.sh
        )
    );
  }
}
