import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/create_event/views/create_event_view.dart';
import 'package:kolektix/app/modules/home/views/home_view.dart';

import '../controllers/menu_screen_controller.dart';

class MenuScreenView extends GetView<MenuScreenController> {
  const MenuScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuScreenController>(
        init: MenuScreenController(),
        id: "menu_screen",
        builder: (value){
          return Scaffold(
              backgroundColor: Color.fromRGBO(2, 37, 90, 1),
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite.w,
                        height: 0.45.sh,
                        child: Stack(
                          children: [
                            Image.asset(MyConstant.IMG_LOGIN_BG, width: double.maxFinite.w,
                                height: 0.45.sh, fit: BoxFit.fill),
                            Center(
                                child: Image.asset(MyConstant.IMG_LOGO, width: 85, height: 85)
                            )
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 0.02.sh),
                          Text(
                              "Halo, David",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Colors.white
                              )
                          ),
                          SizedBox(height: 0.015.sh),
                          Text(
                              "Selamat Datang di\nKolektix",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: 25.5.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          SizedBox(height: 0.015.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child:  Text(
                                  "Terima kasih sudah mendaftar. Senang banget kamu bergabung! Jelajahi fitur-fitur keren kami dan kalau butuh bantuan, jangan ragu hubungi kami.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Colors.white.withOpacity(0.5)
                                  )
                              )),
                              SizedBox(width: 0.05.sw)
                            ],
                          ),
                          const Expanded(child: SizedBox(), flex: 1),
                          Row(
                            children: [
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child:  Text(
                                  "Yuk, ambil langkah pertamamu untuk memulai sebagai Event Creator",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Colors.white.withOpacity(0.5)
                                  )
                              )),
                              SizedBox(width: 0.05.sw)
                            ],
                          ),
                          SizedBox(height: 0.02.sh),
                          GestureDetector(
                            child: Container(
                                width: double.maxFinite.w,
                                height: 0.05.sh,
                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.white
                                ),
                                child: Center(
                                    child: Text(
                                        "Buat Event",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Color.fromRGBO(11, 56, 124, 1),
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                )
                            ),
                            onTap: (){
                              Get.to(()=> const CreateEventView());
                            },
                          ),
                          SizedBox(height: 0.02.sh),
                          GestureDetector(
                            child: Container(
                                width: double.maxFinite.w,
                                height: 0.05.sh,
                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Color.fromRGBO(11, 56, 124, 1)
                                ),
                                child: Center(
                                    child: Text(
                                        "Ke Beranda",
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
                                )
                            ),
                            onTap: (){
                              Get.to(()=> const HomeView());
                            },
                          ),
                          SizedBox(height: 0.05.sh),
                        ],
                      ))
                    ],
                  )
              )
          );
        });
  }
}