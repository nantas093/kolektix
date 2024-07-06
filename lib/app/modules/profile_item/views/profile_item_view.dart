import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/profile_item_controller.dart';

class ProfileItemView extends GetView<ProfileItemController> {
  const ProfileItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileItemController>(
        id: "profile_item",
        init: ProfileItemController(),
        builder: (value){
      return Scaffold(
        backgroundColor: Color.fromRGBO(246, 250, 255, 1),
        body: SizedBox(
          width: double.maxFinite.w,
          height: double.maxFinite.w,
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite.w,
                height: 0.2.sh,
                child: Stack(
                  children: [
                    Image.asset(MyConstant.IMG_LOGIN_BG, width: double.maxFinite.w,
                      height: double.maxFinite.w, fit: BoxFit.fill),
                    SizedBox(
                      width: double.maxFinite.w,
                      height: double.maxFinite.w,
                      child: Column(
                        children: [
                          SizedBox(height: 0.07.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Profile",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.015.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  )
                              ),
                              SizedBox(width: 0.03.sw),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "Ismaya Group",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(width: 0.03.sw),
                                      SvgPicture.asset(MyConstant.IC_VERIFIED)
                                    ],
                                  ),
                                  Text(
                                      "Merchandise",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.white.withOpacity(0.5)
                                      )
                                  )
                                ],
                              ))
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite.w,
                color: Colors.white,
                child: ListView.builder(itemBuilder: (context,index){
                  return Container(
                    color: Colors.transparent,
                    width: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.015.sh),
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            SvgPicture.asset(value.icons[index]),
                            SizedBox(width: 0.03.sw),
                            Expanded(flex: 1, child: Text(
                                value.menus[index],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_16,
                                    color: Colors.black
                                )
                            )),
                            SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW),
                            SizedBox(width: 0.03.sw)
                          ],
                        ),
                        SizedBox(height: 0.015.sh),
                        Container(
                          width: double.maxFinite.w,
                          height: 1,
                          color: Color.fromRGBO(226, 237, 255, 1)
                        )
                      ],
                    )
                  );
                },
                  itemCount: value.menus.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                )
              ),
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                  width: double.maxFinite.w,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 0.015.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.03.sw),
                          SvgPicture.asset(MyConstant.IC_LOGOUT),
                          SizedBox(width: 0.03.sw),
                          Expanded(flex: 1, child: Text(
                              "Logout",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_16,
                                  color: Colors.black
                              )
                          )),
                          SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW),
                          SizedBox(width: 0.03.sw)
                        ],
                      ),
                      SizedBox(height: 0.015.sh),
                      Container(
                          width: double.maxFinite.w,
                          height: 1,
                          color: Color.fromRGBO(226, 237, 255, 1)
                      )
                    ],
                  )
                ),
                onTap: (){
                  value.logout();
                },
              )
            ],
          )
        )
      );
    });
  }
}
