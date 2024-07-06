import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailController>(
        id: "chat_detail",
        init: ChatDetailController(),
        builder: (value){
          return Scaffold(
              backgroundColor: Color.fromRGBO(246, 250, 255, 1),
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: Column(
                    children: [
                      Container(
                          width: double.maxFinite.w,
                          height: 0.13.sh,
                          color: const Color.fromRGBO(11, 56, 124, 1),
                          child: Column(
                            children: [
                              SizedBox(height: 0.07.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                        MyConstant.IC_LEFT, color: Colors.white),
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(width: 0.03.sw),
                                  Image.asset(MyConstant.IMG_AVATAR, width: 30, height: 30),
                                  SizedBox(width: 0.03.sw),
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Daniel Hall",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          )),
                                      Text(
                                          "Online",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_12,
                                              color: Colors.white.withOpacity(0.8)
                                          ))
                                    ],
                                  )),
                                  SizedBox(width: 0.03.sw)
                                ],
                              ),
                            ],
                          )
                      ),
                      Expanded(child: ListView.builder(itemBuilder: (context,index){
                        return Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw,
                                    top: 0.01.sh, bottom: 0.01.sh),
                                margin: EdgeInsets.only(top: 0.02.sh, left: 0.03.sw),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                        "Selamat Malam",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black
                                        )),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "02.04",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(143, 143, 143, 1)
                                        ))
                                  ],
                                )
                            )
                          ],
                        );
                      },
                        itemCount: 3,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                      )),
                      Container(
                          width: double.maxFinite.w,
                          height: 0.5,
                          color: Color.fromRGBO(226, 237, 255, 1)
                      ),
                      Container(
                        width: double.maxFinite.w,
                        height: 0.12.sh,
                        color: Colors.white,
                        child: Center(
                            child: Row(
                              children: [
                                SizedBox(width: 0.03.sw),
                                Expanded(flex: 1, child: Container(
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
                                            Expanded(child: TextField(
                                                decoration: InputDecoration.collapsed(
                                                    hintText: "Ketik pesan..",
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
                                )),
                                SizedBox(width: 0.03.sw),
                                Container(
                                    child: SvgPicture.asset(MyConstant.IC_SEND),
                                    padding: EdgeInsets.only(left: 0.015.sw, right: 0.015.sw,
                                        top: 0.01.sh, bottom: 0.01.sh),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: Color.fromRGBO(11, 56, 124, 1)
                                    )
                                ),
                                SizedBox(width: 0.03.sw),
                              ],
                            )
                        ),
                      )
                    ],
                  )
              )
          );
        });
  }
}