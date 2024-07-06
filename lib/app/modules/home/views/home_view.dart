import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "home",
        init: HomeController(),
        builder: (value){
          return Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: PersistentTabView(
                      context,
                      controller: value.controller,
                      screens: value.buildScreens(),
                      items: value.navBarsItems(),
                      confineInSafeArea: true,
                      handleAndroidBackButtonPress: true,
                      resizeToAvoidBottomInset: true,
                      stateManagement: true,
                      hideNavigationBarWhenKeyboardShows: true,
                      popAllScreensOnTapOfSelectedTab: true,
                      popActionScreens: PopActionScreensType.all,
                      navBarStyle: NavBarStyle.simple
                  )
              )
          );
        });
  }
}