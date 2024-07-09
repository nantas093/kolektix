import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/scan/views/scan_view.dart';

import '../controllers/checkin_event_controller.dart';

class CheckinEventView extends GetView<CheckinEventController> {
  const CheckinEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckinEventController>(
        id: "checkin_event",
        init: CheckinEventController(),
        builder: (value){
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
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                        MyConstant.IC_LEFT, color: Colors.white),
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: Text(
                                      "Check In Event",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      )
                                  )),
                                  SizedBox(width: 0.03.sw)
                                ],
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 0.01.sh),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 0.03.sw),
                          Expanded(flex: 1, child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.012.sh),
                              Text(
                                  "Joyland Festival Jakarta 2024",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              SizedBox(height: 0.01.sh),
                              Text(
                                  "12 Juni - 14 Juni 2024",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_12,
                                      color: Color.fromRGBO(102, 102, 102, 1)
                                  )
                              ),
                              SizedBox(height: 0.01.sh)
                            ],
                          )),
                          SizedBox(width: 0.02.sw),
                          ClipRRect(
                            child: Image.asset(MyConstant.IMG_EVENT, height: 50,
                                width: 80, fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          SizedBox(width: 0.03.sw)
                        ],
                      ),
                      SizedBox(height: 0.01.sh),
                      GestureDetector(
                        child: Container(
                            width: double.maxFinite.w,
                            height: 0.05.sh,
                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Color.fromRGBO(11, 56, 124, 1)
                            ),
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_SCAN),
                                    SizedBox(width: 0.02.sw),
                                    Text(
                                        "Check In Event",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_BOLD,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.white
                                        )
                                    ),
                                  ],
                                )
                            )
                        ),
                        onTap: (){
                          Get.to(()=> const ScanView());
                        },
                      ),
                      SizedBox(height: 0.02.sh),
                      Container(
                          width: double.maxFinite.w,
                          height: 7,
                          color: Color.fromRGBO(226, 237, 255, 0.5)
                      ),
                      SizedBox(height: 0.02.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.03.sw),
                          Text(
                              "Riwayat Check In",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Expanded(flex: 1, child: ListView.builder(itemBuilder: (context,index){
                        return Container(
                            width: double.maxFinite.w,
                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            margin: EdgeInsets.only(top: index == 0 ? 0 : 0.015.sh),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: Text(
                                        "Inara",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    )),
                                    Text(
                                        "02/01/2024 |12:30",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Color.fromRGBO(102, 102, 102, 1)
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    Text(
                                        "Regular Ticket ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(11, 56, 124, 1)
                                        )
                                    ),
                                    Text(
                                        "(4 Tiket)",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(102, 102, 102, 1)
                                        )
                                    ),
                                    Expanded(flex: 1, child: SizedBox()),
                                    Text(
                                        "YGDSAFAFLK",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Color.fromRGBO(102, 102, 102, 1)
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Container(
                                    width: double.maxFinite.w,
                                    height: 0.5,
                                    color: Color.fromRGBO(226, 237, 255, 1)
                                )
                              ],
                            )
                        );
                      },
                        itemCount: 10,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                      ))
                    ],
                  )
              )
          );
        });
  }
}