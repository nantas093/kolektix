import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/event/views/event_view.dart';

import '../controllers/home_item_controller.dart';

class HomeItemView extends GetView<HomeItemController> {
  const HomeItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              width: double.maxFinite.w,
                              height: 0.45.sh,
                              child: Stack(
                                children: [
                                  Image.asset(MyConstant.IMG_LOGIN_BG, width: double.maxFinite.w,
                                      height: 0.32.sh, fit: BoxFit.fill),
                                  SizedBox(
                                      width: double.maxFinite.w,
                                      height: double.maxFinite.w,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 0.07.sh),
                                          Row(
                                            children: [
                                              SizedBox(width: 0.03.sw),
                                              Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle
                                                  )
                                              ),
                                              SizedBox(width: 0.02.sw),
                                              Text(
                                                  controller.name,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                              SizedBox(width: 0.02.sw),
                                              SvgPicture.asset(MyConstant.IC_VERIFIED),
                                              SizedBox(width: 0.03.sw),
                                            ],
                                          ),
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              SizedBox(width: 0.03.sw),
                                              Expanded(flex: 1, child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(MyConstant.IMG_LOGO, width: 24, height: 24),
                                                      SizedBox(width: 0.02.sw),
                                                      Text(
                                                          "Saldo",
                                                          textAlign: TextAlign.start,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                                              fontSize: MyConstant.TEXT_16,
                                                              color: Colors.white
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.005.sh),
                                                  Text(
                                                      "Rp0",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_24,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold
                                                      )
                                                  )
                                                ],
                                              )),
                                              SizedBox(width: 0.02.sw),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(MyConstant.IC_SQUARE_PLUS),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Top up",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_14,
                                                          color: Colors.white
                                                      )
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 0.02.sw),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(MyConstant.IC_SQUARE_DOWN),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Tarik Dana",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_14,
                                                          color: Colors.white
                                                      )
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 0.03.sw),
                                            ],
                                          ),
                                          SizedBox(height: 0.02.sh),
                                          Container(
                                            width: double.maxFinite.w,
                                            height: 0.5,
                                            margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            color: Colors.white.withOpacity(0.2),
                                          ),
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              SizedBox(width: 0.03.sw),
                                              Text(
                                                  "Kredit ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_16,
                                                      color: Colors.white
                                                  )
                                              ),
                                              Text(
                                                  "Rp0",
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
                                          )
                                        ],
                                      )
                                  ),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 0.15.sh,
                                      margin: EdgeInsets.only(top: 0.3.sh),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8))
                                      ),
                                      child: Center(
                                          child: Row(
                                            children: [
                                              SizedBox(width: 0.03.sw),
                                              Expanded(flex: 1, child: GestureDetector(
                                                child: Container(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Center(
                                                                child: SvgPicture.asset(MyConstant.IC_EVENT)
                                                            ),
                                                            decoration: BoxDecoration(
                                                                color: Color.fromRGBO(246, 250, 255, 1)
                                                            )
                                                        ),
                                                        SizedBox(height: 0.01.sh),
                                                        Text(
                                                            "Event",
                                                            textAlign: TextAlign.start,
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_12,
                                                                color: Colors.black
                                                            )
                                                        )
                                                      ],
                                                    )
                                                ),
                                                onTap: (){
                                                  Get.to(()=> const EventView());
                                                },
                                              )),
                                              Expanded(flex: 1, child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                          child: SvgPicture.asset(MyConstant.IC_VENUE)
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(246, 250, 255, 1)
                                                      )
                                                  ),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Venue",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_12,
                                                          color: Colors.black
                                                      )
                                                  )
                                                ],
                                              )),
                                              Expanded(flex: 1, child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                          child: SvgPicture.asset(MyConstant.IC_LOWONGAN)
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(246, 250, 255, 1)
                                                      )
                                                  ),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Lowongan",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_12,
                                                          color: Colors.black
                                                      )
                                                  )
                                                ],
                                              )),
                                              Expanded(flex: 1, child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                          child: SvgPicture.asset(MyConstant.IC_TALENT)
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(246, 250, 255, 1)
                                                      )
                                                  ),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Talent",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_12,
                                                          color: Colors.black
                                                      )
                                                  )
                                                ],
                                              )),
                                              Expanded(flex: 1, child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(246, 250, 255, 1)
                                                      ),
                                                      child: Center(
                                                          child: SvgPicture.asset(MyConstant.IC_MERCHANDISE)
                                                      )
                                                  ),
                                                  SizedBox(height: 0.01.sh),
                                                  Text(
                                                      "Merchandise",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_12,
                                                          color: Colors.black
                                                      )
                                                  )
                                                ],
                                              )),
                                              SizedBox(width: 0.03.sw)
                                            ],
                                          )
                                      )
                                  )
                                ],
                              )
                          ),
                          Container(
                              width: double.maxFinite.w,
                              height: 0.015.sh,
                              color: Color.fromRGBO(246, 250, 255, 1)
                          ),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Event",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.01.sh),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Event berjalan",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Event Draf",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Total Tiket Terjual",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.03.sw)
                            ],
                          ),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Event berjalan",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Total Penjualan",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.03.sw)
                            ],
                          ),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Lowongan",
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.01.sh),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Lowongan Yang Aktif",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Lowongan Draf",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Menunggu Respon",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.03.sw)
                            ],
                          ),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Merchandise",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.01.sh),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          ),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Sedang Dijual",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Merchandise Draf",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.05.sw),
                              Container(
                                  width: 1,
                                  height: 100,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              ),
                              SizedBox(width: 0.05.sw),
                              Expanded(flex: 1, child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "Total Transaksi",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                          "0",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )
                              )),
                              SizedBox(width: 0.03.sw)
                            ],
                           ),
                           Container(
                               width: double.maxFinite.w,
                               height: 1,
                               color: Color.fromRGBO(226, 237, 255, 1)
                           )
                         ],
                       )
                   )
               )
           );
   }
 }