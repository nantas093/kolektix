import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/callback/scan_callback.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> implements ScanCallback{
  const ScanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanController>(
        id: "scan",
        init: ScanController(),
        builder: (value){
          value.buildContext = context;
          value.scanCallback = this;
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
                              ),
                            ],
                          )
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                    width: double.maxFinite.w,
                                    height: 0.05.sh,
                                    child: Center(
                                        child: Text(
                                            "Scan Barcode",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: value.tabPosition == 1 ? Colors.black : Color.fromRGBO(102, 102, 102, 1),
                                                fontWeight: FontWeight.bold
                                            )
                                        )
                                    )
                                ),
                                onTap: (){
                                  value.changeTabPosition(1);
                                },
                              ),
                              Container(
                                width: double.maxFinite.w,
                                height: 3,
                                color: value.tabPosition == 1 ? Color.fromRGBO(25, 78, 158, 1) : Colors.transparent,
                              )
                            ],
                          )),
                          Expanded(flex: 1, child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Container(
                                    width: double.maxFinite.w,
                                    height: 0.05.sh,
                                    child: Center(
                                        child: Text(
                                            "Input Manual",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: value.tabPosition == 2 ? Colors.black : Color.fromRGBO(102, 102, 102, 1),
                                                fontWeight: FontWeight.bold
                                            )
                                        )
                                    )
                                ),
                                onTap: (){
                                  value.changeTabPosition(2);
                                },
                              ),
                              Container(
                                width: double.maxFinite.w,
                                height: 3,
                                color: value.tabPosition == 2 ? Color.fromRGBO(25, 78, 158, 1) : Colors.transparent,
                              )
                            ],
                          )),
                        ],
                      ),
                      Expanded(flex: 1, child: value.tabPosition == 1 ? qrView(
                          value) : inputCodeView(value, context))
                    ],
                  )
              )
          );
        });
  }

  Widget qrView(ScanController value){
    return Container(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        color: Colors.black,
        child: QRView(
          key: value.qrKey,
          overlay: QrScannerOverlayShape(
              borderWidth: 1,
              borderColor: Colors.white
          ),
          onQRViewCreated: value.onQRViewCreated,
        )
    );
  }

  Widget inputCodeView(ScanController value, BuildContext context){
    return Container(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.05.sh,
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
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
                        SvgPicture.asset(MyConstant.IC_SEARCH),
                        SizedBox(width: 0.02.sw),
                        Expanded(child: TextField(
                            controller: value.editingController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Input kode tiket",
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
                            ),
                            onChanged: (text){
                              value.searchTicket(text);
                            }
                        ))
                      ],
                    )
                )
            ),
            value.ticketData != null ? Container(
                width: double.maxFinite.w,
                height: 0.25.sh,
                margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(246, 250, 255, 1),
                    border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(226, 237, 255, 1)
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Column(
                  children: [
                    Expanded(flex: 1, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            Expanded(flex: 1, child: Text(
                                value.ticketData!["invoice_no"] ?? "",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                )
                            )),
                            SizedBox(width: 0.03.sw),
                            Text(
                                "${value.ticketData!["total_qty"]} Tiket",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_14,
                                    color: Color.fromRGBO(102, 102, 102, 1)
                                )
                            ),
                            SizedBox(width: 0.03.sw)
                          ],
                        ),
                        SizedBox(height: 0.005.sh),
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            Text(
                                value.ticketData!["category_ticket"] ?? "",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_12,
                                    color: Color.fromRGBO(11, 56, 124, 1)
                                )
                            )
                          ],
                        )
                      ],
                    )),
                    const DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Color.fromRGBO(226, 237, 255, 1),
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    Expanded(flex: 1, child: Row(
                      children: [
                        Expanded(flex: 1, child: Expanded(flex: 1, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 0.03.sw),
                                Text(
                                    "Nama Pembeli",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_14,
                                        color: Color.fromRGBO(102, 102, 102, 1)
                                    )
                                )
                              ],
                            ),
                            SizedBox(height: 0.005.sh),
                            Row(
                              children: [
                                SizedBox(width: 0.03.sw),
                                Text(
                                    value.ticketData!["name"] ?? "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ],
                            )
                          ],
                        ))),
                        SizedBox(width: 0.03.sw),
                      ],
                    )),
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
                                  Text(
                                      "Check In",
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
                        value.checkIn(context, this);
                      },
                    ),
                    SizedBox(height: 0.02.sh)
                  ],
                )
            ) : SizedBox(),
          ],
        )
    );
  }

  void showTicketSuccess(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isDismissible: false,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<ScanController>(
              id: "scan",
              init: ScanController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.25.sh),
                        Expanded(flex: 1, child: Container(
                          height: double.maxFinite.w,
                          width: double.maxFinite.w,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(99, 108, 119, 0.1),
                                blurRadius: 1.5,
                                spreadRadius: 1.5,
                              )]
                          ),
                          child: Column(
                              children: [
                                SizedBox(height: 0.02.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.05.sw),
                                    Expanded(flex: 1, child: Text(
                                        "Validasi Tiket",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                        )
                                    )),
                                    InkWell(
                                      child: SvgPicture.asset(MyConstant.IC_CLOSE),
                                      onTap: (){
                                        Get.back();
                                      },
                                    ),
                                    SizedBox(width: 0.05.sw)
                                  ],
                                ),
                                Container(
                                  width: double.maxFinite.w,
                                  height: 1,
                                  color: Color.fromRGBO(226, 237, 255, 1),
                                  margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 0.02.sh, bottom: 0.01.sh),
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    SvgPicture.asset(MyConstant.IC_GREEN_CIRCLE)
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Check In Berhasil",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Tiket berhasil divalidasi",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(143, 143, 143, 1)
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Nama Pembeli",
                                        textAlign: TextAlign.start,
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
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        value.ticketData!["name"],
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Kode Tiket",
                                        textAlign: TextAlign.start,
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
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        value.ticketData!["invoice_no"],
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Jenis Tiket",
                                        textAlign: TextAlign.start,
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
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Regular Ticket",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Total Tiket",
                                        textAlign: TextAlign.start,
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
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "${value.ticketData!["total_qty"]} Tiket",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Waktu Check In",
                                        textAlign: TextAlign.start,
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
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        MyParseDate.parseGeneralDate(
                                            DateTime.now(), "yyyy-MM-dd : HH:mm"),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black
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
                                      margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: Color.fromRGBO(11, 56, 124, 1)
                                      ),
                                      child: Center(
                                          child: Text(
                                              "Check In Lainnya",
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
                                    value.scanned = false;
                                    Get.back();
                                  },
                                ),
                                SizedBox(height: 0.02.sh),
                                GestureDetector(
                                  child: Container(
                                      width: double.maxFinite.w,
                                      height: 0.05.sh,
                                      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(
                                              color: Color.fromRGBO(11, 56, 124, 1),
                                              width: 1
                                          )
                                      ),
                                      child: Center(
                                          child: Text(
                                              "Kembali",
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_BOLD,
                                                  fontSize: MyConstant.TEXT_14,
                                                  color: Color.fromRGBO(11, 56, 124, 1)
                                              )
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.scanned = false;
                                    Get.back();
                                    Get.back();
                                  },
                                )
                              ]
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showTicketError(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isDismissible: false,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<ScanController>(
              id: "scan",
              init: ScanController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.6.sh),
                        Expanded(flex: 1, child: Container(
                          height: double.maxFinite.w,
                          width: double.maxFinite.w,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(99, 108, 119, 0.1),
                                blurRadius: 1.5,
                                spreadRadius: 1.5,
                              )]
                          ),
                          child: Column(
                              children: [
                                SizedBox(height: 0.02.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.05.sw),
                                    Expanded(flex: 1, child: Text(
                                        "Validasi Tiket",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                        )
                                    )),
                                    InkWell(
                                      child: SvgPicture.asset(MyConstant.IC_CLOSE),
                                      onTap: (){
                                        value.scanned = false;
                                        Get.back();
                                      },
                                    ),
                                    SizedBox(width: 0.05.sw)
                                  ],
                                ),
                                Container(
                                  width: double.maxFinite.w,
                                  height: 1,
                                  color: Color.fromRGBO(226, 237, 255, 1),
                                  margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw, top: 0.02.sh, bottom: 0.01.sh),
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    SvgPicture.asset(MyConstant.IC_RED_CIRCLE)
                                  ],
                                ),
                                SizedBox(height: 0.015.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Check In Gagal",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.005.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.03.sw),
                                    Text(
                                        "Tiket berhasil divalidasi",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(143, 143, 143, 1)
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
                                      margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: Color.fromRGBO(11, 56, 124, 1)
                                      ),
                                      child: Center(
                                          child: Text(
                                              "Check In Ulang",
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
                                    value.scanned = false;
                                    Get.back();
                                  },
                                ),
                                SizedBox(height: 0.02.sh),
                                GestureDetector(
                                  child: Container(
                                      width: double.maxFinite.w,
                                      height: 0.05.sh,
                                      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(
                                              color: Color.fromRGBO(11, 56, 124, 1),
                                              width: 1
                                          )
                                      ),
                                      child: Center(
                                          child: Text(
                                              "Kembali",
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_BOLD,
                                                  fontSize: MyConstant.TEXT_14,
                                                  color: Color.fromRGBO(11, 56, 124, 1)
                                              )
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.scanned = false;
                                    Get.back();
                                    Get.back();
                                  },
                                )
                              ]
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  @override
  void success(Map data, BuildContext context) {
    showTicketSuccess(context);
  }

  @override
  void failed(Map data, BuildContext context) {
    showTicketError(context);
  }
}