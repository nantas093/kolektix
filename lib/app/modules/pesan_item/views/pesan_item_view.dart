import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/chat_detail/views/chat_detail_view.dart';

import '../controllers/pesan_item_controller.dart';

class PesanItemView extends GetView<PesanItemController> {
  const PesanItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
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
                                  Expanded(flex: 1, child: Text(
                                      "Pesan",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ))),
                                  SizedBox(width: 0.03.sw)
                                ],
                              ),
                            ],
                          )
                      ),
                      Expanded(flex: 1, child: ListView.builder(itemBuilder: (context,index){
                        return GestureDetector(
                          child: Container(
                              width: double.maxFinite.w,
                              margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(MyConstant.IMG_AVATAR, width: 50, height: 50),
                                      SizedBox(width: 0.02.sw),
                                      Expanded(flex: 1, child: Column(children: [
                                        Row(
                                          children: [
                                            Expanded(flex: 1, child: Text(
                                                "Daniel Hall",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600
                                                ))),
                                            SizedBox(width: 0.02.sw),
                                            Text(
                                                "Today",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Color.fromRGBO(11, 56, 124, 1)
                                                ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(flex: 1, child: Text(
                                                "Halo kak mau bertanya donggg",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Colors.black
                                                ))),
                                            SizedBox(width: 0.02.sw),
                                            Container(
                                                padding: EdgeInsets.only(left: 0.025.sw, right: 0.025.sw),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(25, 78, 158, 1),
                                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                                ),
                                                child: Text(
                                                    "5",
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_14,
                                                        color: Colors.white
                                                    ))
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 0.015.sh),
                                        Container(
                                            width: double.maxFinite.w,
                                            height: 1,
                                            color: Color.fromRGBO(226, 237, 255, 1)
                                        )
                                      ]
                                      ))
                                    ],
                                  )
                                ],
                              )
                          ),
                          onTap: (){
                            Get.to(()=> const ChatDetailView());
                          },
                        );
                      },
                          itemCount: 10,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero
                      ))
                    ],
                   )
               )
           );
   }
 }