import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/create_venue_controller.dart';

class CreateVenueView extends GetView<CreateVenueController> {
  const CreateVenueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateVenueController>(
        id: "create_venue",
        init: CreateVenueController(),
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
                                      "Buat Venue",
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
                              ),
                            ],
                          )
                      )
                    ],
                  )
              )
          );
        });
  }
}