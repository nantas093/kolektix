import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/email_verification/views/email_verification_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        id: "login",
        init: LoginController(),
        builder: (value){
          return Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.maxFinite.w,
                          height: double.maxFinite.w,
                          child: Column(
                            children: [
                              Image.asset(MyConstant.IMG_LOGIN_BG)
                            ],
                          )
                      ),
                      SizedBox(
                          width: double.maxFinite.w,
                          height: double.maxFinite.w,
                          child: Column(
                            children: [
                              SizedBox(height: 0.4.sh),
                              Expanded(flex: 1, child: Container(
                                  width: double.maxFinite.w,
                                  height: double.maxFinite.w,
                                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                                      top: 0.02.sh, bottom: 0.02.sh),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight:  Radius.circular(16))
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(MyConstant.IMG_LOGO_2, width: 85),
                                      SizedBox(height: 0.025.sh),
                                      Text(
                                          "Selamat Datang",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.005.sh),
                                      Text(
                                          "Silahkan masuk ke akun Anda",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.02.sh),
                                      Container(
                                          width: double.maxFinite.w,
                                          height: 0.05.sh,
                                          padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color.fromRGBO(226, 237, 255, 1)
                                              )
                                          ),
                                          child: Center(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(MyConstant.IC_EMAIL),
                                                  SizedBox(width: 0.02.sw),
                                                  Expanded(child: TextField(
                                                      decoration: InputDecoration.collapsed(
                                                          hintText: "Email",
                                                          hintStyle: TextStyle(
                                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                                              fontSize: MyConstant.TEXT_14,
                                                              color: Color.fromRGBO(162, 166, 176, 1)
                                                          )
                                                      ),
                                                      style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_14,
                                                        color: Color.fromRGBO(143, 143, 143, 1),
                                                      )
                                                  ))
                                                ],
                                              )
                                          )
                                      ),
                                      SizedBox(height: 0.02.sh),
                                      GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                color: Color.fromRGBO(11, 56, 124, 1)
                                            ),
                                            child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        "Selanjutnya",
                                                        textAlign: TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontFamily: MyConstant.STR_INTER_BOLD,
                                                            fontSize: MyConstant.TEXT_14,
                                                            color: Colors.white
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    SvgPicture.asset(MyConstant.IC_SELANJUTNYA)
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          Get.to(()=> const EmailVerificationView());
                                        },
                                      ),
                                      SizedBox(height: 0.04.sh),
                                      Text(
                                          "Belum punya akun?",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Container(
                                          width: double.maxFinite.w,
                                          height: 0.05.sh,
                                          padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color.fromRGBO(226, 237, 255, 1)
                                              )
                                          ),
                                          child: Center(
                                            child: Text(
                                                "Daftar",
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
                                      SizedBox(height: 0.03.sh),
                                      RichText(
                                        text: TextSpan(
                                          text: '',
                                          style: DefaultTextStyle.of(context).style,
                                          children: <TextSpan>[
                                            TextSpan(text: "Baca",
                                                style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.normal,
                                                    color: Color.fromRGBO(102, 102, 102, 1)
                                                )),
                                            TextSpan(text: " Kebijakan Privacy ",
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    decoration: TextDecoration.none,
                                                    fontSize: MyConstant.TEXT_14,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1.5,
                                                    color: Color.fromRGBO(11, 56, 124, 1)
                                                )
                                            ),
                                            TextSpan(text: "dan",
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    decoration: TextDecoration.none,
                                                    fontSize: MyConstant.TEXT_14,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.normal,
                                                    color: Color.fromRGBO(102, 102, 102, 1)
                                                )),
                                            TextSpan(text: " Ketentuan Layanan ",
                                              style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                decoration: TextDecoration.none,
                                                fontSize: MyConstant.TEXT_14,
                                                fontWeight: FontWeight.normal,
                                                height: 1.5,
                                                color: Color.fromRGBO(11, 56, 124, 1)
                                              )
                                            ),
                                            TextSpan(text: "kami melindungi data Anda.",
                                                style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  decoration: TextDecoration.none,
                                                  fontSize: MyConstant.TEXT_14,
                                                  height: 1.5,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromRGBO(102, 102, 102, 1)
                                                )
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ))
                            ],
                          )
                      ),
                    ],
                  )
              )
          );
        });
  }
}
