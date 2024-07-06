import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
        id: "event_detail",
        init: EventDetailController(),
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
                          Expanded(child: SizedBox(), flex: 1),
                          Container(
                            height: 0.05.sh,
                            padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(MyConstant.IC_EDIT),
                                SizedBox(width: 0.02.sw),
                                Text(
                                    "Edit",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                              ],
                            )
                          ),
                          SizedBox(width: 0.03.sw),
                          Container(
                              height: 0.05.sh,
                              padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(MyConstant.IC_DOWNLOAD),
                                  SizedBox(width: 0.02.sw),
                                  Text(
                                      "Publish",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Color.fromRGBO(11, 56, 124, 1),
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                ],
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
                    Image.asset(MyConstant.IMG_EVENT, width: double.maxFinite.w,
                        height: 0.3.sh, fit: BoxFit.fill),
                    SizedBox(height: 0.012.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        Expanded(flex: 1, child: Text(
                            "Joyland Festival Jakarta 2024",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        )),
                        SizedBox(width: 0.03.sw)
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        SvgPicture.asset(MyConstant.IC_CALENDAR),
                        SizedBox(width: 0.01.sw),
                        Text(
                            "12 Juni - 14 Juni 2024",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        SvgPicture.asset(MyConstant.IC_TIME),
                        SizedBox(width: 0.01.sw),
                        Text(
                            "13.00 - 22.00 WIB",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        SvgPicture.asset(MyConstant.IC_LOCATION),
                        SizedBox(width: 0.01.sw),
                        Text(
                            "GBK, Jakarta",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                      ],
                    ),
                    SizedBox(height: 0.02.sh),
                    Container(
                        width: double.maxFinite.w,
                        height: 0.015.sh,
                        color: Color.fromRGBO(246, 250, 255, 1)
                    ),
                    Container(
                        width: double.maxFinite.w,
                        height: 0.06.sh,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 1, child: TabBar.secondary(
                                  tabAlignment: TabAlignment.start,
                                  controller: value.tabController,
                                  isScrollable: true,
                                  onTap: (index){
                                    value.changeTabPosition(index);
                                  },
                                  labelStyle: TextStyle(
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 0.017.sh,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 0.017.sh,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold
                                  ),
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Color.fromRGBO(102, 102, 102, 1),
                                    indicatorColor: Color.fromRGBO(56, 98, 221, 1),
                                    dividerColor: Color.fromRGBO(226, 237, 255, 1),
                                    dividerHeight: 1,
                                    indicatorWeight: 3,
                                  tabs: const <Widget>[
                                    Tab(text: 'Detail'),
                                    Tab(text: 'Tiket'),
                                    Tab(text: 'Penjualan'),
                                    Tab(text: 'Data Pemesan'),
                                  ]
                                ))
                              ],
                            ),
                            Container(
                                width: double.maxFinite.w,
                                height: 0.1,
                                color: Color.fromRGBO(246, 250, 255, 1)
                            )
                          ],
                        )
                    ),
                    value.tabPosition == 0 ? detailWidget() : value.tabPosition == 1 ?
                    tiketWidget() : value.tabPosition == 2 ? penjualanWidget() : dataPemesananWidget()
                  ],
                )
              ))
            ],
          ),
        )
      );
    });
  }

  Widget detailWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Container(
                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                    top: 0.007.sh, bottom: 0.007.sh),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Color.fromRGBO(226, 237, 255, 1),
                        width: 1
                    )
                ),
                child: Text(
                    "Deksripsi",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                )
            ),
            SizedBox(width: 0.02.sw),
            Container(
                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                    top: 0.007.sh, bottom: 0.007.sh),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Color.fromRGBO(226, 237, 255, 1),
                        width: 1
                    )
                ),
                child: Text(
                    "Syarat & Ketentuan",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                )
            )
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Setelah sukses dengan inkubasi musisi muda lewat program Evoria Movement Emerging Artist bersama Diplomat Evo & M Bloc Entertainment. Tahun ini, Evoria Movement, event kolaborasi Diplomat EVO dengan M Bloc Entertainment dan M Bloc Experience, serta M Bloc Space, kembali menghadirkan Evoria Music Festival 2024 yang merupakan festival musik yang difokuskan bagi para musisi pendatang baru terkurasi yang tahun ini akan diadakan di Kota Peruri, Jakarta Selatan pada 26 Mei 2024\n\nEvoria Music Festival 2024 akan menampilkan aksi terbaik dari musisi/band pendatang baru yang telah lolos kurasi dan mengikuti program inkubasi bersama para profesional industri musik nasional pada pertengahan Mei 2024",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            SizedBox(width: 0.03.sw)
          ],
        ),
        SizedBox(height: 0.05.sh)
      ],
    );
  }

  Widget tiketWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Total Jenis Tiket",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                ),
                Text(
                    "1 Jenis",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_16,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            )),
            SizedBox(width: 0.03.sw),
            GestureDetector(
              child: Container(
                  width: 150,
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

              },
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Container(
                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                    top: 0.007.sh, bottom: 0.007.sh),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Color.fromRGBO(226, 237, 255, 1),
                        width: 1
                    )
                ),
                child: Text(
                    "All",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                )
            ),
            SizedBox(width: 0.02.sw),
            Container(
                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                    top: 0.007.sh, bottom: 0.007.sh),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Color.fromRGBO(226, 237, 255, 1),
                        width: 1
                    )
                ),
                child: Text(
                    "Festival",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                )
            ),
            SizedBox(width: 0.02.sw),
            Container(
                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                    top: 0.007.sh, bottom: 0.007.sh),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Color.fromRGBO(226, 237, 255, 1),
                        width: 1
                    )
                ),
                child: Text(
                    "Seated",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1)
                    )
                )
            )
          ],
        ),
        SizedBox(height: 0.02.sh),
        SizedBox(
          width: double.maxFinite.w,
          height: 0.2.sh,
          child: Stack(
            children: [
              Container(
                  width: double.maxFinite.w,
                  height: 0.2.sh,
                  margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
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
                              Text(
                                  "Regular Ticket",
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
                                  "Tiket tanpa kursi penonton",
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
                      DottedLine(
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
                                      "Rp35.000",
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
                                      "Dijual tangal 01 Juli 2024 • 12:00",
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
                          ))),
                          Row(
                            children: [
                              SvgPicture.asset(MyConstant.IC_CIRCLE_MINUS, color: Color.fromRGBO(11, 56, 124, 1)),
                              SizedBox(width: 0.05.sw),
                              Text(
                                  "0",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              SizedBox(width: 0.05.sw),
                              SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS, color: Color.fromRGBO(11, 56, 124, 1))
                            ],
                          ),
                          SizedBox(width: 0.03.sw),
                        ],
                      ))
                    ],
                  )
              )
            ],
          ),
        ),
        SizedBox(height: 0.05.sh)
      ],
    );
  }

  Widget penjualanWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.sh),
        Container(
            width: double.maxFinite.w,
            height: 0.015.sh,
            color: Color.fromRGBO(246, 250, 255, 1)
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Dana yang Belum Ditarik",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: Color.fromRGBO(102, 102, 102, 1),
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 0.01.sh),
                Text(
                    "Rp0",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                )
              ],
            )),
            SizedBox(width: 0.03.sw),
            GestureDetector(
              child: Container(
                  width: 100,
                  height: 0.05.sh,
                  padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(11, 56, 124, 1)
                  ),
                  child: Center(
                      child: Text(
                          "Tarik Dana",
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

              },
            ),
            SizedBox(width: 0.03.sw),
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
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Ringkasan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            )),
            SvgPicture.asset(MyConstant.IC_DOWNLOAD_2),
            SizedBox(width: 0.015.sw),
            Text(
                "Download Laporan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(11, 56, 124, 1)
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Container(
          width: double.maxFinite.w,
          height: 1,
          color: Color.fromRGBO(226, 237, 255, 1)
        ),
        SizedBox(height: 0.01.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Total Penjualan Tiket Online",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "Rp0",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.01.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Total Promo",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "(-) Rp0",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Biaya Layanan Penjualan Tiket Online",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "(-) Rp0",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Biaya Layanan Tambahan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "(-) Rp0",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Container(
            width: double.maxFinite.w,
            height: 1,
            color: Color.fromRGBO(226, 237, 255, 1)
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Total Pendapatan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "Rp0",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(width: 0.03.sw),
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
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Rincian Penjualan Tiket Online",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ))
          ],
        ),
        SizedBox(height: 0.02.sh),
        Container(
            width: double.maxFinite.w,
            height: 1,
            color: Color.fromRGBO(226, 237, 255, 1)
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Tiket",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "Total Penjualan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Container(
            width: double.maxFinite.w,
            height: 1,
            color: Color.fromRGBO(226, 237, 255, 1)
        ),
        ListView.builder(itemBuilder: (context,index){
          return Container(
            width: double.maxFinite.w,
            margin: EdgeInsets.only(top: 0.02.sh),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Expanded(flex: 1, child: Text(
                                  "Regular Ticket",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )
                              )),
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Rp0",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                              SizedBox(width: 0.03.sw),
                            ],
                          ),
                          SizedBox(height: 0.01.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Harga Tiket",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Color.fromRGBO(102, 102, 102, 1)
                                  )
                              ),
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Rp35.000",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Colors.black
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.005.sh),
                          Row(
                            children: [
                              SizedBox(width: 0.03.sw),
                              Text(
                                  "Tiket Terjual",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Color.fromRGBO(102, 102, 102, 1)
                                  )
                              ),
                              SizedBox(width: 0.02.sw),
                              Text(
                                  "0/120",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Colors.black
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 0.02.sh),
                          Container(
                              width: double.maxFinite.w,
                              height: 1,
                              color: Color.fromRGBO(226, 237, 255, 1)
                          )
                        ],
                    ))
                  ],
                )
              ],
            ),
          );
        },
          itemCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          primary: false
        )
      ],
    );
  }

  Widget dataPemesananWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.sh),
        Container(
            width: double.maxFinite.w,
            height: 0.015.sh,
            color: Color.fromRGBO(246, 250, 255, 1)
        ),
        SizedBox(height: 0.01.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Text(
                "Pemesan",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            )),
            Text(
                "Status",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: MyConstant.STR_INTER_REGULAR,
                    fontSize: MyConstant.TEXT_16,
                    color: Color.fromRGBO(102, 102, 102, 1)
                )
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.01.sh),
        ListView.builder(itemBuilder: (context,index){
          return Container(
            width: double.maxFinite.w,
            color: index % 2 == 0 ? Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
            child: Column(
              children: [
                SizedBox(height: 0.02.sh),
                Row(
                  children: [
                    Expanded(flex: 1, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            Expanded(flex: 1, child: Text(
                                "Rudi Bohlam",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                )
                            )),
                            SizedBox(width: 0.03.sw),
                            Text(
                                "Lunas",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                )
                            ),
                            SizedBox(width: 0.03.sw),
                          ],
                        ),
                        SizedBox(height: 0.01.sh),
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            Text(
                                "No. Invoice",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_14,
                                    color: Color.fromRGBO(102, 102, 102, 1)
                                )
                            ),
                            SizedBox(width: 0.03.sw),
                            Text(
                                "KL-1719610038ZHJAD393",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_14,
                                    color: Colors.black
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 0.005.sh),
                        Row(
                          children: [
                            SizedBox(width: 0.03.sw),
                            Text(
                                "Tiket Terjual",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_14,
                                    color: Color.fromRGBO(102, 102, 102, 1)
                                )
                            ),
                            SizedBox(width: 0.02.sw),
                            Text(
                                "-",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                    fontSize: MyConstant.TEXT_14,
                                    color: Colors.black
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 0.02.sh),
                        Container(
                            width: double.maxFinite.w,
                            height: 1,
                            color: Color.fromRGBO(226, 237, 255, 1)
                        )
                      ],
                    ))
                  ],
                )
              ],
            ),
          );
        },
            itemCount: 3,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: false
        )
      ],
    );
  }
}
