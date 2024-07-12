import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/create_event_controller.dart';

class CreateEventView extends GetView<CreateEventController> {
  const CreateEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
        init: CreateEventController(),
        builder: (value){
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
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
                                        SizedBox(width: 0.05.sw),
                                        GestureDetector(
                                          child: SvgPicture.asset(
                                              MyConstant.IC_LEFT, color: Colors.white),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                        SizedBox(width: 0.03.sw),
                                        Text(
                                            value.data != null ? "Edit Event"
                                                : "Buat Event",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600
                                            )
                                        ),
                                        SizedBox(width: 0.03.sw)
                                      ],
                                    ),
                                  ],
                                )
                            ),
                            Expanded(flex: 1, child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                          width: double.maxFinite.w,
                                          height: 0.25.sh,
                                          color: Color.fromRGBO(246, 250, 255, 1),
                                          child: value.imagePath.isEmpty ? Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(MyConstant.IC_ADD_IMAGE),
                                                  SizedBox(height: 0.02.sh),
                                                  Text(
                                                      "Unggah gambar/poster/banner",
                                                      textAlign: TextAlign.center,
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
                                              )
                                          ) : value.data == null ? Image.file(File(value.imagePath),
                                              width: double.maxFinite.w,
                                              height: double.maxFinite.w,
                                              fit: BoxFit.fill
                                          ) : value.imageClicked ? Image.file(File(value.imagePath),
                                              width: double.maxFinite.w,
                                              height: double.maxFinite.w,
                                              fit: BoxFit.fill
                                          ) :  Image.network(value.imagePath,
                                              width: double.maxFinite.w,
                                              height: double.maxFinite.w,
                                              fit: BoxFit.fill
                                          )
                                      ),
                                      onTap: (){
                                        value.pickFile(context);
                                      },
                                    ),
                                    SizedBox(height: 0.02.sh),
                                    Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
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
                                                        hintText: "Nama Event",
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
                                                    controller: value.eventNameController
                                                ))
                                              ],
                                            )
                                        )
                                    ),
                                    SizedBox(height: 0.015.sh),
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
                                                  color: Color.fromRGBO(226, 237, 255, 1)
                                              )
                                          ),
                                          child: Center(
                                              child: Row(
                                                children: [
                                                  Expanded(flex: 1, child: Text(
                                                      value.strEventCategory,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_14,
                                                          color: Color.fromRGBO(143, 143, 143, 1)
                                                      )
                                                  )),
                                                  SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW)
                                                ],
                                              )
                                          )
                                      ),
                                      onTap: (){
                                        showKategori(context);
                                      },
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Container(
                                        width: double.maxFinite.w,
                                        margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromRGBO(226, 237, 255, 1)
                                            )
                                        ),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                width: double.maxFinite.w,
                                                height: 0.06.sh,
                                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(MyConstant.IC_CALENDAR_2),
                                                        SizedBox(width: 0.02.sw),
                                                        Expanded(flex: 1, child: Text(
                                                            value.strDate,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_14,
                                                                color: Color.fromRGBO(143, 143, 143, 1)
                                                            )
                                                        )),
                                                        SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW)
                                                      ],
                                                    )
                                                ),
                                              ),
                                              onTap: (){
                                                showAturTanggal(context);
                                              },
                                            ),
                                            Container(
                                                width: double.maxFinite.w,
                                                height: 1,
                                                color: Color.fromRGBO(226, 237, 255, 1)
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                width: double.maxFinite.w,
                                                height: 0.06.sh,
                                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(MyConstant.IC_TIME),
                                                        SizedBox(width: 0.02.sw),
                                                        Expanded(flex: 1, child: Text(
                                                            value.strEventTime,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_14,
                                                                color: Color.fromRGBO(143, 143, 143, 1)
                                                            )
                                                        )),
                                                        SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW)
                                                      ],
                                                    )
                                                ),
                                              ),
                                              onTap: (){
                                                showAturWaktu(context);
                                              },
                                            ),
                                            Container(
                                                width: double.maxFinite.w,
                                                height: 1,
                                                color: Color.fromRGBO(226, 237, 255, 1)
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                width: double.maxFinite.w,
                                                height: 0.06.sh,
                                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                                child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(MyConstant.IC_LOCATION),
                                                        SizedBox(width: 0.02.sw),
                                                        Expanded(flex: 1, child: Text(
                                                            value.strInfoTicket,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_14,
                                                                color: Color.fromRGBO(143, 143, 143, 1)
                                                            )
                                                        )),
                                                        SvgPicture.asset(MyConstant.IC_CIRCLE_RIGHT_ARROW)
                                                      ],
                                                    )
                                                ),
                                              ),
                                              onTap: (){
                                                showLokasi(context);
                                              },
                                            )
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 0.02.sh),
                                    Container(
                                        width: double.maxFinite.w,
                                        height: 0.015.sh,
                                        color: Color.fromRGBO(246, 250, 255, 1)
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
                                                          "Pilih Kategori",
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
                                                          "Detail Event",
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
                                    Container(
                                        width: double.maxFinite.w,
                                        height: 0.015.sh,
                                        color: Color.fromRGBO(246, 250, 255, 1)
                                    ),
                                    value.tabPosition == 1 ? kategoriWidget(value,
                                        context) : detailWidget(value),
                                    SizedBox(height: 0.05.sh),
                                  ],
                                )
                            )),
                            Container(
                                width: double.maxFinite.w,
                                height: 1,
                                color: Color.fromRGBO(246, 250, 255, 1)
                            ),
                            SizedBox(height: 0.03.sh),
                            Row(
                              children: [
                                SizedBox(width: 0.05.sw),
                                value.data == null ? Expanded(flex: 1, child: Row(
                                  children: [
                                    Expanded(flex: 1, child: GestureDetector(
                                      child: Container(
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
                                                  "Simpan Draft",
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
                                      onTap: (){
                                        value.createEvent(context, true);
                                      },
                                    )),
                                    SizedBox(width: 0.05.sw)
                                  ],
                                )) : SizedBox(),
                                Expanded(flex: 1, child: GestureDetector(
                                  child: Container(
                                      width: double.maxFinite.w,
                                      height: 0.05.sh,
                                      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: Color.fromRGBO(11, 56, 124, 1)
                                      ),
                                      child: Center(
                                          child: Text(
                                              value.data != null ? "Edit Event"
                                                  : "Buat Event",
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  fontSize: MyConstant.TEXT_14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                              )
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.createEvent(context, false);
                                  },
                                )),
                                SizedBox(width: 0.05.sw)
                              ],
                            ),
                            SizedBox(height: 0.05.sh)
                          ],
                        )
                    )
                );
              });
        });
  }

  Widget kategoriWidget(CreateEventController value, BuildContext context){
    return SizedBox(
        width: double.maxFinite.w,
        child: Column(
          children: [
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Text(
                    "Tiket",
                    textAlign: TextAlign.center,
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
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 1,
                color: Color.fromRGBO(226, 237, 255, 1)
            ),
            ListView.builder(itemBuilder: (context,index){
              Map data = value.tickets[index];
              return Container(
                  width: double.maxFinite.w,
                  height: 0.2.sh,
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
                                  data["name"] ?? "",
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
                                  "${data["qty"]} Tiket",
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
                                  data["description"],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Color.fromRGBO(102, 102, 102, 1)
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
                          Expanded(flex: 1, child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Text(
                                      "Rp${data["price"]}",
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
                              SizedBox(height: 0.005.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Text(
                                      "Dijual tangal ${data["ticket_date"]}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Color.fromRGBO(102, 102, 102, 1)
                                      )
                                  )
                                ],
                              )
                            ],
                          )),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                    height: 0.05.sh,
                                    padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        border: Border.all(
                                            color: Color.fromRGBO(226, 237, 255, 1),
                                            width: 1
                                        )
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(MyConstant.IC_EDIT,
                                            color: Color.fromRGBO(11, 56, 124, 1))
                                    )
                                ),
                                onTap: (){
                                  value.isEdit = true;
                                  value.showEditTicket(index);
                                  showTambahTiket(context,index);
                                },
                              ),
                              SizedBox(width: 0.02.sw),
                              GestureDetector(
                                child: Container(
                                    height: 0.05.sh,
                                    padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        border: Border.all(
                                            color: Color.fromRGBO(226, 237, 255, 1),
                                            width: 1
                                        )
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(MyConstant.IC_ERASE,
                                            color: Color.fromRGBO(11, 56, 124, 1))
                                    )
                                ),
                                onTap: (){
                                  value.deleteTiket(index);
                                },
                              )
                            ],
                          ),
                          SizedBox(width: 0.03.sw),
                        ],
                      ))
                    ],
                  )
              );
            },
                itemCount: value.tickets.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                primary: false
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
                          color: Color.fromRGBO(226, 237, 255, 1)
                      )
                  ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS),
                          SizedBox(width: 0.01.sw),
                          Text(
                              "Tambah Tiket",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Color.fromRGBO(11, 56, 124, 1),
                                  fontWeight: FontWeight.w600
                              )
                          )
                        ],
                      )
                  )
              ),
              onTap: (){
                value.isEdit = false;
                showTambahTiket(context,null);
              },
            ),
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.015.sh,
                color: Color.fromRGBO(246, 250, 255, 1)
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Text(
                    "Formulir Data Pemesanan",
                    textAlign: TextAlign.center,
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
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 1,
                color: Color.fromRGBO(246, 250, 255, 1)
            ),
            SizedBox(height: 0.01.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                GestureDetector(
                  child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: value.is_name ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                  border: value.is_name ? null : Border.all(
                                      width: 0.5,
                                      color: Colors.grey
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(2))
                              ),
                              child: value.is_name ? SvgPicture.asset(
                                  MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                          ),
                          SizedBox(width: 0.02.sw),
                          Text(
                              "Nama Lengkap",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Colors.black
                              )
                          ),
                        ],
                      )
                  ),
                  onTap: (){
                    value.checkNamaLengkap();
                  },
                ),
                Expanded(flex: 1, child: SizedBox()),
                GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 0.05.sw),
                        Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                color: value.is_email ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                border: value.is_email ? null : Border.all(
                                    width: 0.5,
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(2))
                            ),
                            child: value.is_email ? SvgPicture.asset(
                                MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                        ),
                        SizedBox(width: 0.02.sw),
                        Text(
                            "Email",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.black
                            )
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    value.checkEmail();
                  },
                ),
                SizedBox(width: 0.24.sw)
              ],
            ),
            SizedBox(height: 0.015.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                color: value.is_phone_number ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                border: value.is_phone_number ? null : Border.all(
                                    width: 0.5,
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(2))
                            ),
                            child: value.is_phone_number ? SvgPicture.asset(
                                MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                        ),
                        SizedBox(width: 0.02.sw),
                        Text(
                            "No. Handphone",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.black
                            )
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    value.checkHandphone();
                  },
                ),
                Expanded(child: SizedBox(), flex: 1),
                GestureDetector(
                  child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: value.is_noidentity ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                  border: value.is_noidentity ? null : Border.all(
                                      width: 0.5,
                                      color: Colors.grey
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(2))
                              ),
                              child: value.is_noidentity ? SvgPicture.asset(
                                  MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                          ),
                          SizedBox(width: 0.02.sw),
                          Text(
                              "Nomor KTP",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Colors.black
                              )
                          ),
                        ],
                      )
                  ),
                  onTap: (){
                    value.checkKtp();
                  },
                ),
                SizedBox(width: 0.138.sw)
              ],
            ),
            SizedBox(height: 0.015.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                GestureDetector(
                  child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: value.is_birthday ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                  border: value.is_birthday ? null : Border.all(
                                      width: 0.5,
                                      color: Colors.grey
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(2))
                              ),
                              child: value.is_birthday ? SvgPicture.asset(
                                  MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                          ),
                          SizedBox(width: 0.02.sw),
                          Text(
                              "Tanggal Lahir",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Colors.black
                              )
                          ),
                        ],
                      )
                  ),
                  onTap: (){
                    value.checkBirthday();
                  },
                ),
                Expanded(child: SizedBox(), flex: 1),
                GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(width: 0.05.sw),
                        Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                                color: value.is_gender ? Color.fromRGBO(11, 56, 124, 1) : Colors.transparent,
                                border: value.is_gender ? null : Border.all(
                                    width: 0.5,
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(2))
                            ),
                            child: value.is_gender ? SvgPicture.asset(
                                MyConstant.IC_CHECK, color: Colors.white) : SizedBox()
                        ),
                        SizedBox(width: 0.02.sw),
                        Text(
                            "Jenis Kelamin",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.black
                            )
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    value.checkGender();
                  },
                ),
                SizedBox(width: 0.1.sw)
              ],
            ),
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.015.sh,
                color: Color.fromRGBO(246, 250, 255, 1)
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Text(
                    "Pengaturan Tiket",
                    textAlign: TextAlign.center,
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
            SizedBox(height: 0.02.sh),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 0.05.sw),
                Expanded(flex: 1, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Jumlah maks. tiket dalam 1 transaksi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        )
                    ),
                    SizedBox(height: 0.005.sh),
                    Text(
                        "Jumlah maksimal tiket yang dapat dibeli dalam 1 transaksi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black
                        )
                    )
                  ],
                )),
                GestureDetector(
                  child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text(
                              "${value.selectedMaxTiket} Tiket",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_12,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline
                              )
                          ),
                          SizedBox(width: 0.01.sw),
                          SvgPicture.asset(MyConstant.IC_CIRCLE_CHECK)
                        ],
                      )
                  ),
                  onTap: (){
                    showPengaturanTiket(context);
                  },
                ),
                SizedBox(width: 0.05.sw)
              ],
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Expanded(flex: 1, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "1 akun email untuk 1 kali transaksi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        )
                    ),
                    SizedBox(height: 0.005.sh),
                    Text(
                        "1 akun email hanya dapat melakukan 1 kali transaksi pembelian tiket",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black
                        )
                    )
                  ],
                )),
                SizedBox(width: 0.05.sw),
                Switch(
                  activeColor: Color.fromRGBO(11, 56, 124, 1),
                  trackOutlineColor: MaterialStatePropertyAll((Colors.grey)),
                  trackOutlineWidth: MaterialStatePropertyAll(0.7),
                  trackColor: MaterialStatePropertyAll(!value.firstSwitched ? Colors.white : Color.fromRGBO(11, 56, 124, 1)),
                  value: value.firstSwitched,
                  thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if(!value.firstSwitched){
                      return Color.fromRGBO(11, 56, 124, 1);
                    }
                    else{
                      return Colors.white;
                    }
                  }), onChanged: (bool check) {
                  value.firstSwitchCheck();
                },
                ),
                SizedBox(width: 0.05.sw)
              ],
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Expanded(flex: 1, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "1 tiket untuk 1 data pemesan",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        )
                    ),
                    SizedBox(height: 0.005.sh),
                    Text(
                        "Data setiap tiket tidak boleh sama",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_12,
                            color: Colors.black
                        )
                    )
                  ],
                )),
                SizedBox(width: 0.05.sw),
                Switch(
                  activeColor: Color.fromRGBO(11, 56, 124, 1),
                  trackOutlineColor: MaterialStatePropertyAll((Colors.grey)),
                  trackOutlineWidth: MaterialStatePropertyAll(0.7),
                  trackColor: MaterialStatePropertyAll(!value.secondSwitched ? Colors.white : Color.fromRGBO(11, 56, 124, 1)),
                  value: value.secondSwitched,
                  thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if(!value.secondSwitched){
                      return Color.fromRGBO(11, 56, 124, 1);
                    }
                    else{
                      return Colors.white;
                    }
                  }), onChanged: (bool check) {
                  value.secondSwitchCheck();
                },
                ),
                SizedBox(width: 0.05.sw)
              ],
            )
          ],
        )
    );
  }

  Widget detailWidget(CreateEventController value){
    return SizedBox(
        width: double.maxFinite.w,
        child: Column(
          children: [
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Text(
                    "Deskripsi",
                    textAlign: TextAlign.center,
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
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.15.sh,
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                    top: 0.01.sh, bottom: 0.01.sh),
                margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(226, 237, 255, 1)
                    )
                ),
                child: TextField(
                    controller: value.deskripsiController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Ketik deskripsi",
                        hintStyle: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: Color.fromRGBO(162, 166, 176, 1)
                        )
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontFamily: MyConstant.STR_INTER_REGULAR,
                      fontSize: MyConstant.TEXT_14,
                      color: Color.fromRGBO(143, 143, 143, 1),
                    )
                )
            ),
            SizedBox(height: 0.02.sh),
            Row(
              children: [
                SizedBox(width: 0.05.sw),
                Text(
                    "Syarat & Ketentuan",
                    textAlign: TextAlign.center,
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
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.15.sh,
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                    top: 0.01.sh, bottom: 0.01.sh),
                margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(226, 237, 255, 1)
                    )
                ),
                child: TextField(
                    controller: value.syaratController,
                    decoration: InputDecoration.collapsed(
                        hintText: " Ketik Syarat & Ketentuan",
                        hintStyle: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: Color.fromRGBO(162, 166, 176, 1)
                        )
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontFamily: MyConstant.STR_INTER_REGULAR,
                      fontSize: MyConstant.TEXT_14,
                      color: Color.fromRGBO(143, 143, 143, 1),
                    )
                )
            ),
            Container(
                width: double.maxFinite.w,
                height: 0.015.sh,
                color: Color.fromRGBO(246, 250, 255, 1)
            ),
          ],
        )
    );
  }

  void showKategori(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.35.sh),
                        Expanded(flex: 1, child: SingleChildScrollView(
                          child: Container(
                            width: double.maxFinite.w,
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                          "Kategori",
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
                                  SizedBox(height: 0.02.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 1,
                                      color: Color.fromRGBO(233, 237, 241, 1)
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Format ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromRGBO(226, 237, 255, 1)
                                            )
                                        ),
                                        child: Center(
                                            child: Row(
                                              children: [
                                                Expanded(flex: 1, child: Text(
                                                    value.strEventFormat,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_14,
                                                        color: Color.fromRGBO(143, 143, 143, 1)
                                                    )
                                                )),
                                                SvgPicture.asset(MyConstant.IC_CIRCLE_CHECK)
                                              ],
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      showFormat(context);
                                    },
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Topik ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(
                                                width: 1,
                                                color: Color.fromRGBO(226, 237, 255, 1)
                                            )
                                        ),
                                        child: Center(
                                            child: Row(
                                              children: [
                                                Expanded(flex: 1, child: Text(
                                                    value.strEventTopik,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_14,
                                                        color: Color.fromRGBO(143, 143, 143, 1)
                                                    )
                                                )),
                                                SvgPicture.asset(MyConstant.IC_CIRCLE_CHECK)
                                              ],
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      showTopik(context);
                                    },
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Tag ",
                                          textAlign: TextAlign.start,
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
                                  SizedBox(height: 0.005.sh),
                                  GestureDetector(
                                    child: Container(
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
                                                Expanded(child: TextField(
                                                    controller: value.eventTagController,
                                                    decoration: InputDecoration.collapsed(
                                                        hintText: "Contoh: music,song",
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
                                    onTap: (){

                                    },
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Jenis Event ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
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
                                                    "Public",
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
                                                    "Private",
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
                                                "Simpan",
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                )
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.simpanCategory(context);
                                    },
                                  )
                                ]
                            ),
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showAturTanggal(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
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
                                        "Tanggal",
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
                                SizedBox(height: 0.02.sh),
                                Container(
                                    width: double.maxFinite.w,
                                    height: 1,
                                    color: Color.fromRGBO(233, 237, 241, 1)
                                ),
                                SizedBox(height: 0.02.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.05.sw),
                                    Text(
                                        "Tanggal Mulai ",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black
                                        )
                                    ),
                                    Text(
                                        "*",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.red
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.005.sh),
                                GestureDetector(
                                  child: Container(
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
                                              SvgPicture.asset(MyConstant.IC_CALENDAR),
                                              SizedBox(width: 0.02.sw),
                                              Expanded(flex: 1, child: Text(
                                                  value.strStartDate,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Color.fromRGBO(143, 143, 143, 1)
                                                  )
                                              ))
                                            ],
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.showCalendar(context, 1);
                                  },
                                ),
                                SizedBox(height: 0.02.sh),
                                Row(
                                  children: [
                                    SizedBox(width: 0.05.sw),
                                    Text(
                                        "Tanggal berakhir ",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black
                                        )
                                    ),
                                    Text(
                                        "*",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.red
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.005.sh),
                                GestureDetector(
                                  child: Container(
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
                                              SvgPicture.asset(MyConstant.IC_CALENDAR),
                                              SizedBox(width: 0.02.sw),
                                              Expanded(flex: 1, child: Text(
                                                  value.strEndDate,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Color.fromRGBO(143, 143, 143, 1)
                                                  )
                                              ))
                                            ],
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.showCalendar(context, 2);
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
                                              "Simpan",
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  fontSize: MyConstant.TEXT_14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold
                                              )
                                          )
                                      )
                                  ),
                                  onTap: (){
                                    value.simpanTanggalEvent(context);
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

  void showAturWaktu(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.5.sh),
                        Expanded(flex: 1, child: SingleChildScrollView(
                          child: Container(
                            width: double.maxFinite.w,
                            padding:
                            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                          "Waktu",
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
                                  SizedBox(height: 0.02.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 1,
                                      color: Color.fromRGBO(233, 237, 241, 1)
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      Expanded(flex: 1, child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 0.05.sw),
                                              Text(
                                                  "Jam Mulai ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
                                          Row(
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
                                                          Expanded(flex: 1, child: TextField(
                                                              controller: value.startHourController,
                                                              keyboardType: TextInputType.number,
                                                              maxLength: 2,
                                                              decoration: InputDecoration(
                                                                  counterText: "",
                                                                  hintText: "00",
                                                                  border: InputBorder.none,
                                                                  hintStyle: TextStyle(
                                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                      fontSize: MyConstant.TEXT_14,
                                                                      color: Color.fromRGBO(162, 166, 176, 1),
                                                                      decoration: TextDecoration.none
                                                                  )
                                                              ),
                                                              style: TextStyle(
                                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                  fontSize: MyConstant.TEXT_14,
                                                                  color: Color.fromRGBO(143, 143, 143, 1),
                                                                  decoration: TextDecoration.none
                                                              )
                                                          ))
                                                        ],
                                                      )
                                                  )
                                              )),
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
                                                          Expanded(flex: 1, child: TextField(
                                                              keyboardType: TextInputType.number,
                                                              controller: value.startMinuteController,
                                                              maxLength: 2,
                                                              decoration: InputDecoration(
                                                                  counterText: "",
                                                                  hintText: "00",
                                                                  border: InputBorder.none,
                                                                  hintStyle: TextStyle(
                                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                      fontSize: MyConstant.TEXT_14,
                                                                      color: Color.fromRGBO(162, 166, 176, 1),
                                                                      decoration: TextDecoration.none
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
                                              ))
                                            ],
                                          )
                                        ],
                                      )),
                                      Expanded(flex: 1, child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 0.05.sw),
                                              Text(
                                                  "Jam Berakhir ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
                                          Row(
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
                                                          Expanded(flex: 1, child: TextField(
                                                              keyboardType: TextInputType.number,
                                                              controller: value.endHourController,
                                                              maxLength: 2,
                                                              decoration: InputDecoration(
                                                                  counterText: "",
                                                                  hintText: "00",
                                                                  border: InputBorder.none,
                                                                  hintStyle: TextStyle(
                                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                      fontSize: MyConstant.TEXT_14,
                                                                      color: Color.fromRGBO(162, 166, 176, 1),
                                                                      decoration: TextDecoration.none
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
                                                          Expanded(flex: 1, child: TextField(
                                                              keyboardType: TextInputType.number,
                                                              controller: value.endMinuteController,
                                                              maxLength: 2,
                                                              decoration: InputDecoration(
                                                                  counterText: "",
                                                                  hintText: "00",
                                                                  border: InputBorder.none,
                                                                  hintStyle: TextStyle(
                                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                      fontSize: MyConstant.TEXT_14,
                                                                      color: Color.fromRGBO(162, 166, 176, 1),
                                                                      decoration: TextDecoration.none
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
                                              SizedBox(width: 0.03.sw)
                                            ],
                                          )
                                        ],
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Zona Waktu ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
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
                                                color: value.selectedZone == 1 ?
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
                                                            color: value.selectedZone == 1 ?
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
                                                                color: value.selectedZone == 1 ?
                                                                Color.fromRGBO(11, 56, 124, 1) :
                                                                Colors.transparent
                                                            )
                                                        )
                                                    )
                                                ),
                                                SizedBox(width: 0.02.sw),
                                                Expanded(flex: 1, child: Text(
                                                    "Waktu Indonesia Barat",
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
                                                value.selectedZone == 1 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                              ],
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.selectZone(1);
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
                                                color: value.selectedZone == 2 ?
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
                                                            color: value.selectedZone == 2 ?
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
                                                                color: value.selectedZone == 2 ?
                                                                Color.fromRGBO(11, 56, 124, 1) :
                                                                Colors.transparent
                                                            )
                                                        )
                                                    )
                                                ),
                                                SizedBox(width: 0.02.sw),
                                                Expanded(flex: 1, child: Text(
                                                    "Waktu Indonesia Tengah",
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
                                                value.selectedZone == 2 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                              ],
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.selectZone(2);
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
                                                color: value.selectedZone == 3 ?
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
                                                            color: value.selectedZone == 3 ?
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
                                                                color: value.selectedZone == 3 ?
                                                                Color.fromRGBO(11, 56, 124, 1) :
                                                                Colors.transparent
                                                            )
                                                        )
                                                    )
                                                ),
                                                SizedBox(width: 0.02.sw),
                                                Expanded(flex: 1, child: Text(
                                                    "Waktu Indonesia Timur",
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
                                                value.selectedZone == 3 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                              ],
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.selectZone(3);
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
                                                "Simpan",
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                )
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.simpanWaktuEvent(context);
                                    },
                                  )
                                ]
                            ),
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showLokasi(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.2.sh),
                        Expanded(flex: 1, child: SingleChildScrollView(
                          child: Container(
                            padding:
                            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                          "Lokasi",
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
                                  SizedBox(height: 0.02.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 1,
                                      color: Color.fromRGBO(233, 237, 241, 1)
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Diselenggarakan Secara ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedDiselenggarakan == 1 ?
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
                                                                color: value.selectedDiselenggarakan == 1 ?
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
                                                                    color: value.selectedDiselenggarakan == 1 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Offline",
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
                                                    value.selectedDiselenggarakan == 1 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectDiselenggarakan(1);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedDiselenggarakan == 2 ?
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
                                                                color: value.selectedDiselenggarakan == 2 ?
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
                                                                    color: value.selectedDiselenggarakan == 2 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Online",
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
                                                    value.selectedDiselenggarakan == 2 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectDiselenggarakan(2);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Nama Tempat ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
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
                                              Expanded(flex: 1, child: TextField(
                                                  controller: value.placeNameController,
                                                  decoration: InputDecoration.collapsed(
                                                      hintText: "Nama Tempat",
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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Ketik alamat ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
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
                                                      Expanded(flex: 1, child: TextField(
                                                          controller: value.addressController,
                                                          decoration: InputDecoration.collapsed(
                                                              hintText: "Nama Alamat",
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
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Nama Kota ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
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
                                                      Expanded(flex: 1, child: TextField(
                                                          controller: value.cityController,
                                                          decoration: InputDecoration.collapsed(
                                                              hintText: "Nama Kota",
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
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Text(
                                          "Lokasi di Map ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      height: 0.25.sh,
                                      color: Colors.grey.withOpacity(0.5),
                                      child: Stack(
                                        children: [
                                          GoogleMap(
                                              mapType: MapType.normal,
                                              scrollGesturesEnabled: true,
                                              initialCameraPosition: value.kGooglePlex,
                                              myLocationEnabled: true,
                                              myLocationButtonEnabled: false,
                                              onCameraMove: (position){
                                                value.latitude = position.target.latitude;
                                                value.longitude = position.target.longitude;
                                              },
                                              gestureRecognizers: Set()
                                                ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
                                              onMapCreated: (GoogleMapController controller) {
                                                value.googleMapController = controller;
                                              }
                                          ),
                                          Center(
                                              child: SvgPicture.asset(MyConstant.IC_PIN_MAP)
                                          )
                                        ],
                                      )
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
                                                "Simpan",
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                )
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      value.simpanLokasiEvent(context);
                                    },
                                  )
                                ]
                            ),
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showTambahTiket(BuildContext context,int? index){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.16.sh),
                        Expanded(flex: 1, child: SingleChildScrollView(
                          child: Container(
                            padding:
                            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                          "Tambah Tiket",
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
                                  SizedBox(height: 0.02.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 1,
                                      color: Color.fromRGBO(233, 237, 241, 1)
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Jenis Tiket ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedJenisTiket == 1 ?
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
                                                                color: value.selectedJenisTiket == 1 ?
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
                                                                    color: value.selectedJenisTiket == 1 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Berbayar",
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
                                                    value.selectedJenisTiket == 1 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectJenisTiket(1);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedJenisTiket == 2 ?
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
                                                                color: value.selectedJenisTiket == 2 ?
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
                                                                    color: value.selectedJenisTiket == 2 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Gratis",
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
                                                    value.selectedJenisTiket == 2 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectJenisTiket(2);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Kategori Tiket ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedKategoriTiket == 1 ?
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
                                                                color: value.selectedKategoriTiket == 1 ?
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
                                                                    color: value.selectedKategoriTiket == 1 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Festival",
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
                                                    value.selectedKategoriTiket == 1 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectKategoriTiket(1);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: GestureDetector(
                                        child: Container(
                                            width: double.maxFinite.w,
                                            height: 0.05.sh,
                                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(
                                                    width: 1,
                                                    color: value.selectedKategoriTiket == 2 ?
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
                                                                color: value.selectedKategoriTiket == 2 ?
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
                                                                    color: value.selectedKategoriTiket == 2 ?
                                                                    Color.fromRGBO(11, 56, 124, 1) :
                                                                    Colors.transparent
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    SizedBox(width: 0.02.sw),
                                                    Expanded(flex: 1, child: Text(
                                                        "Seated",
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
                                                    value.selectedKategoriTiket == 2 ? SvgPicture.asset(MyConstant.IC_CHECK) : SizedBox()
                                                  ],
                                                )
                                            )
                                        ),
                                        onTap: (){
                                          value.selectKategoriTiket(2);
                                        },
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Nama Tiket ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
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
                                              Expanded(flex: 1, child: TextField(
                                                  controller: value.namaTiketController,
                                                  decoration: InputDecoration.collapsed(
                                                      hintText: "Nama Tiket",
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
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Tanggal Mulai ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
                                          GestureDetector(
                                            child: Container(
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
                                                        SvgPicture.asset(MyConstant.IC_CALENDAR),
                                                        SizedBox(width: 0.02.sw),
                                                        Expanded(flex: 1, child: Text(
                                                            value.strTicketStartDate,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_14,
                                                                color: Color.fromRGBO(143, 143, 143, 1)
                                                            )
                                                        ))
                                                      ],
                                                    )
                                                )
                                            ),
                                            onTap: (){
                                              value.showTiketCalendar(context, 1);
                                            },
                                          ),
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Tanggal Berakhir ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
                                          GestureDetector(
                                            child: Container(
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
                                                        SvgPicture.asset(MyConstant.IC_CALENDAR),
                                                        SizedBox(width: 0.02.sw),
                                                        Expanded(flex: 1, child: Text(
                                                            value.strTicketEndDate,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(
                                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                                fontSize: MyConstant.TEXT_14,
                                                                color: Color.fromRGBO(143, 143, 143, 1)
                                                            )
                                                        ))
                                                      ],
                                                    )
                                                )
                                            ),
                                            onTap: (){
                                              value.showTiketCalendar(context, 2);
                                            },
                                          ),
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Harga Tiket ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
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
                                                      Expanded(flex: 1, child: TextField(
                                                          controller: value.hargaTiketController,
                                                          keyboardType: TextInputType.number,
                                                          decoration: InputDecoration.collapsed(
                                                              hintText: "Rp0",
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
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 0.02.sh),
                                          Row(
                                            children: [
                                              Text(
                                                  "Jumlah Tiket ",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.black
                                                  )
                                              ),
                                              Text(
                                                  "*",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_14,
                                                      color: Colors.red
                                                  )
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 0.005.sh),
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
                                                      Expanded(flex: 1, child: TextField(
                                                          keyboardType: TextInputType.number,
                                                          controller: value.jumlahTiketController,
                                                          decoration: InputDecoration.collapsed(
                                                              hintText: "0",
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
                                        ],
                                      )),
                                      SizedBox(width: 0.03.sw)
                                    ],
                                  ),
                                  SizedBox(height: 0.02.sh),
                                  Row(
                                    children: [
                                      SizedBox(width: 0.05.sw),
                                      Text(
                                          "Deskripsi ",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.black
                                          )
                                      ),
                                      Text(
                                          "*",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Colors.red
                                          )
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 0.005.sh),
                                  Container(
                                      width: double.maxFinite.w,
                                      height: 0.1.sh,
                                      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                                          top: 0.01.sh, bottom: 0.01.sh),
                                      margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(
                                              width: 1,
                                              color: Color.fromRGBO(226, 237, 255, 1)
                                          )
                                      ),
                                      child: TextField(
                                          controller: value.deskripsiTiketController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: "Ketik deskripsi",
                                              hintStyle: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  fontSize: MyConstant.TEXT_14,
                                                  color: Color.fromRGBO(162, 166, 176, 1)
                                              )
                                          ),
                                          maxLines: null,
                                          keyboardType: TextInputType.multiline,
                                          style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Color.fromRGBO(143, 143, 143, 1),
                                          )
                                      )
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
                                                "Simpan",
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                )
                                            )
                                        )
                                    ),
                                    onTap: (){
                                      if(!value.isEdit){
                                        value.tambahTicket(context);
                                      }
                                      else{
                                        value.editTicket(context,index!);
                                      }
                                    },
                                  )
                                ]
                            ),
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showFormat(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
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
                                        "Pilih Format",
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
                                Expanded(child: ListView.builder(itemBuilder: (context,index){
                                  Map data = value.formatList[index];
                                  String name = data["name"];
                                  return GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                        child: Row(
                                          children: [
                                            Expanded(flex: 1, child: Text(
                                                name,
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_16,
                                                    color: Colors.black
                                                )
                                            )),
                                            value.selectedFormatIndex == index ?
                                            SvgPicture.asset(MyConstant.IC_CHECK) :
                                            SizedBox()
                                          ],
                                        )
                                    ),
                                    onTap: (){
                                      value.selectFormat(index);
                                      Get.back();
                                    },
                                  );
                                },
                                    itemCount: value.formatList.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero
                                ))
                              ]
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showTopik(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
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
                                        "Pilih Topik",
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
                                Expanded(child: ListView.builder(itemBuilder: (context,index){
                                  Map data = value.topikList[index];
                                  String name = data["name"];
                                  return GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                        child: Row(
                                          children: [
                                            Expanded(flex: 1, child: Text(
                                                name,
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_16,
                                                    color: Colors.black
                                                )
                                            )),
                                            value.selectedTopikIndex == index ?
                                            SvgPicture.asset(MyConstant.IC_CHECK) :
                                            SizedBox()
                                          ],
                                        )
                                    ),
                                    onTap: (){
                                      value.selectTopik(index);
                                      Get.back();
                                    },
                                  );
                                },
                                    itemCount: value.topikList.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero
                                ))
                              ]
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }

  void showPengaturanTiket(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<CreateEventController>(
              id: "create_event",
              init: CreateEventController(),
              builder: (value){
                return Container(
                    width: double.maxFinite.w,
                    height: double.maxFinite.w,
                    child: Column(
                      children: [
                        SizedBox(height: 0.4.sh),
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
                                        "Pilih Tiket",
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
                                Expanded(child: ListView.builder(itemBuilder: (context,index){
                                  return GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                                        child: Row(
                                          children: [
                                            Expanded(flex: 1, child: Text(
                                                "${value.maxTicketList[index]} Ticket",
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_16,
                                                    color: Colors.black
                                                )
                                            )),
                                            value.selectedTopikIndex == index ?
                                            SvgPicture.asset(MyConstant.IC_CHECK) :
                                            SizedBox()
                                          ],
                                        )
                                    ),
                                    onTap: (){
                                      value.selectMaxTicket(index);
                                      Get.back();
                                    },
                                  );
                                },
                                    itemCount: value.maxTicketList.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero
                                ))
                              ]
                          ),
                        ))
                      ],
                    )
                );
              });
        });
  }
}