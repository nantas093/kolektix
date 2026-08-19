import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../constants/my_constants.dart';
import '../controllers/select_role_controller.dart';

class SelectRoleView extends GetView<SelectRoleController> {
  const SelectRoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectRoleController>(
        id: "select_role",        builder: (value){
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
                              "Pilih Role",
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
                      SizedBox(height: 0.025.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          Text(
                              "Mau daftar sebagai apa?",
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
                      SizedBox(height: 0.005.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          Text(
                              "Halo, silahkan isi form dibawah ini ya!",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      GestureDetector(
                        child: Container(
                            width: double.maxFinite.w,
                            height: 0.05.sh,
                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1,
                                    color: value.selectedRole == 1 ?
                                    Color.fromRGBO(11, 56, 124, 1) :
                                    Color.fromRGBO(226, 237, 255, 1)
                                )
                            ),
                            child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1,
                                                color: value.selectedRole == 1 ?
                                                Color.fromRGBO(11, 56, 124, 1) :
                                                Color.fromRGBO(226, 237, 255, 1)
                                            )
                                        ),
                                        child: Center(
                                            child: Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: value.selectedRole == 1 ?
                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                    Colors.transparent
                                                )
                                            )
                                        )
                                    ),
                                    SizedBox(width: 0.02.sw),
                                    Expanded(flex: 1, child: Text(
                                        "Kolektix Creator",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        )
                                    )),
                                    value.selectedRole == 1 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                  ],
                                )
                            )
                        ),
                        onTap: (){
                          value.selectRole(1);
                        },
                      ),
                      SizedBox(height: 0.01.sh),
                      GestureDetector(
                        child: Container(
                            width: double.maxFinite.w,
                            height: 0.05.sh,
                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1,
                                    color: value.selectedRole == 2 ?
                                    Color.fromRGBO(11, 56, 124, 1) :
                                    Color.fromRGBO(226, 237, 255, 1)
                                )
                            ),
                            child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 1,
                                                color: value.selectedRole == 2 ?
                                                Color.fromRGBO(11, 56, 124, 1) :
                                                Color.fromRGBO(226, 237, 255, 1)
                                            )
                                        ),
                                        child: Center(
                                            child: Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: value.selectedRole == 2 ?
                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                    Colors.transparent
                                                )
                                            )
                                        )
                                    ),
                                    SizedBox(width: 0.02.sw),
                                    Expanded(flex: 1, child: Text(
                                        "Kolektix Talent",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        )
                                    )),
                                    value.selectedRole == 2 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                  ],
                                )
                            )
                        ),
                        onTap: (){
                          value.selectRole(2);
                        },
                      ),
                      SizedBox(height: 0.03.sh),
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
                                    "Lanjut",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_BOLD,
                                        fontSize: MyConstant.TEXT_14,
                                        color: Colors.white
                                    )
                                )
                            )
                        ),
                        onTap: (){
                          value.nextPage(context);
                        },
                      )
                    ],
                  )
              )
          );
        });
  }
}