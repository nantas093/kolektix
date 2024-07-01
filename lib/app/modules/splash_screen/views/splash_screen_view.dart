import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetBuilder<SplashScreenController>(
        id: "splash_screen",
        init: SplashScreenController(),
        builder: (value){
      return Scaffold(
        backgroundColor: Color.fromRGBO(2, 37, 90, 1),
        body: SizedBox(
            width: double.maxFinite.w,
            height: double.maxFinite.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(MyConstant.IMG_LOGO, width: 150, height: 150),
                SizedBox(height: 0.015.sh),
                Text(
                    "Masa Depan Tongkrongan..",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            )
        )
      );
    });
  }
}
