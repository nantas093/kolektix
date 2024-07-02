import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/menu_screen/views/menu_screen_view.dart';
import 'package:kolektix/app/modules/select_role/views/select_role_view.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerificationController>(
        id: "email_verification",
        init: EmailVerificationController(),
        builder: (value){
      return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.maxFinite.w,
          height: double.maxFinite.w,
          child: Column(
            children: [
              SizedBox(height: 0.07.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  GestureDetector(
                    child: SvgPicture.asset(
                        MyConstant.IC_LEFT, color: const Color.fromRGBO(
                        15, 14, 14, 1)),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 0.03.sw),
                  Text(
                      "Verifikasi email",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  SizedBox(width: 0.03.sw)
                ],
              ),
              SizedBox(height: 0.02.sh),
              Container(
                width: double.maxFinite.w,
                height: 1,
                color: Color.fromRGBO(226, 237, 255, 1),
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Container(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: SvgPicture.asset(MyConstant.IC_EMAIL,
                            color: Color.fromRGBO(11, 56, 124, 1), width: 24, height: 24)
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(246, 250, 255, 1),
                          border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                  )
                ],
              ),
              SizedBox(height: 0.025.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Text(
                      "Mohon verifikasi email anda",
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
                ],
              ),
              SizedBox(height: 0.01.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Expanded(flex: 1, child: RichText(
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: "Untuk memulai sebagai Creator, silahkan "
                            "verifikasi alamat email anda dengan email yang telah "
                            "kami kirimkan ke ",
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                decoration: TextDecoration.none,
                                fontSize: MyConstant.TEXT_14,
                                height: 1.5,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )),
                        TextSpan(text: "kolektix@mail.com",
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                decoration: TextDecoration.none,
                                fontSize: MyConstant.TEXT_14,
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                color: Colors.black
                            )
                        )
                      ],
                    ),
                  )),
                  SizedBox(width: 0.05.sw)
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Text(
                      "Masukan 6-digit code",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: Colors.black
                      )
                  )
                ],
              ),
              SizedBox(height: 0.01.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Expanded(flex: 1, child: VerificationCode(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).primaryColor),
                    keyboardType: TextInputType.number,
                    underlineColor: Color.fromRGBO(226, 237, 255, 1),
                    underlineUnfocusedColor: Color.fromRGBO(226, 237, 255, 1),
                    length: 6,
                    cursorColor: Colors.blue,
                    fullBorder: true,
                    onCompleted: (String value) {

                    },
                    onEditing: (bool value) {

                    },
                  )),
                  SizedBox(width: 0.05.sw)
                ],
              ),
              SizedBox(height: 0.01.sh),
              Row(
                children: [
                  SizedBox(width: 0.05.sw),
                  Text(
                      "Belum menerima email? ",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: Colors.black
                      )
                  ),
                  GestureDetector(
                    child: Text(
                        "Kirim Ulang",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: Color.fromRGBO(11, 56, 124, 1)
                        )
                    ),
                    onTap: (){
                        if(value.isMenu){
                          Get.off(()=> const MenuScreenView());
                        }
                        else{
                          Get.off(()=> const SelectRoleView());
                        }
                    },
                  ),
                  const Expanded(child: SizedBox(), flex: 1),
                  Text(
                      "00:59",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: Colors.black
                      )
                  ),
                  SizedBox(width: 0.05.sw)
                ],
              )
            ],
          )
        )
      );
    });
  }
}
