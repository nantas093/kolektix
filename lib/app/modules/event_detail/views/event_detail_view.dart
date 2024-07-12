import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/create_event/views/create_event_view.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailController>(
        id: "event_detail",
        init: EventDetailController(),
        builder: (value){
          value.buildContext = context;
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
                                GestureDetector(
                                  child: Container(
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
                                  onTap: (){
                                    Get.to(()=> const CreateEventView(),
                                        arguments: {"data" : value.data});
                                  },
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
                            Image.network(value.data["image_url"], width: double.maxFinite.w,
                                height: 0.3.sh, fit: BoxFit.fill),
                            SizedBox(height: 0.012.sh),
                            Row(
                              children: [
                                SizedBox(width: 0.03.sw),
                                Expanded(flex: 1, child: Text(
                                    value.data["name"],
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
                                    "${value.data["start_time"]} - ${value.data["end_time"]}",
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
                                    "${value.data["location_name"]}, ${value.data["location_city"]}",
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
                            value.tabPosition == 0 ? detailWidget(value) : value.tabPosition == 1 ?
                            tiketWidget(value,context) : value.tabPosition == 2 ? penjualanWidget() : dataPemesananWidget(value)
                          ],
                        )
                    ))
                  ],
                ),
              )
          );
        });
  }

  Widget detailWidget(EventDetailController value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                      top: 0.007.sh, bottom: 0.007.sh),
                  decoration: BoxDecoration(
                      color: value.detailIndex == 1 ?
                      Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          color: value.detailIndex == 1 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                          width: 1
                      )
                  ),
                  child: Text(
                      "Deksripsi",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: value.detailIndex == 1 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                      )
                  )
              ),
              onTap: (){
                value.changeDetailIndex(1);
              },
            ),
            SizedBox(width: 0.02.sw),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                      top: 0.007.sh, bottom: 0.007.sh),
                  decoration: BoxDecoration(
                      color: value.detailIndex == 2 ?
                      Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          color: value.detailIndex == 2 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                          width: 1
                      )
                  ),
                  child: Text(
                      "Syarat & Ketentuan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: value.detailIndex == 2 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                      )
                  )
              ),
              onTap: (){
                value.changeDetailIndex(2);
              },
            )
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            Expanded(flex: 1, child: Html(
                data: value.strDetail
            )),
            SizedBox(width: 0.03.sw)
          ],
        ),
        SizedBox(height: 0.05.sh)
      ],
    );
  }

  Widget tiketWidget(EventDetailController value, BuildContext context){
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
                    "${value.ticketList.length} Jenis",
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
                value.clearTiket();
                value.ticketTitle = "Tambah Tiket";
                showTambahTiket(context, null);
              },
            ),
            SizedBox(width: 0.03.sw),
          ],
        ),
        SizedBox(height: 0.02.sh),
        Row(
          children: [
            SizedBox(width: 0.03.sw),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                      top: 0.007.sh, bottom: 0.007.sh),
                  decoration: BoxDecoration(
                      color: value.ticketIndex == 1 ?
                      Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          color: value.ticketIndex == 1 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                          width: 1
                      )
                  ),
                  child: Text(
                      "All",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: value.ticketIndex == 1 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                      )
                  )
              ),
              onTap: (){
                value.changeTicketIndex(1);
              },
            ),
            SizedBox(width: 0.02.sw),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                      top: 0.007.sh, bottom: 0.007.sh),
                  decoration: BoxDecoration(
                      color: value.ticketIndex == 2 ?
                      Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          color: value.ticketIndex == 2 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                          width: 1
                      )
                  ),
                  child: Text(
                      "Festival",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: value.ticketIndex == 2 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                      )
                  )
              ),
              onTap: (){
                value.changeTicketIndex(2);
              },
            ),
            SizedBox(width: 0.02.sw),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                      top: 0.007.sh, bottom: 0.007.sh),
                  decoration: BoxDecoration(
                      color: value.ticketIndex == 3 ?
                      Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          color: value.ticketIndex == 3 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                          width: 1
                      )
                  ),
                  child: Text(
                      "Seated",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: MyConstant.STR_INTER_REGULAR,
                          fontSize: MyConstant.TEXT_14,
                          color: value.ticketIndex == 3 ?
                          Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                      )
                  )
              ),
              onTap: (){
                value.changeTicketIndex(3);
              },
            )
          ],
        ),
        SizedBox(height: 0.02.sh),
        ListView.builder(itemBuilder: (context,index){
          Map data = value.ticketList[index];
          return Container(
            width: double.maxFinite.w,
            height: 0.15.sh,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: 0.02.sh),
            child: Stack(
              children: [
                Container(
                    width: double.maxFinite.w,
                    height: 0.15.sh,
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
                                Expanded(flex: 1, child: Text(
                                    data["name"],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                )),
                                GestureDetector(
                                  child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Color.fromRGBO(11, 56, 124, 1)
                                      ),
                                      child: Center(
                                          child: SvgPicture.asset(MyConstant.IC_EDIT,
                                              color: Colors.white)
                                      )
                                  ),
                                  onTap: (){
                                    value.ticketTitle = "Edit Tiket";
                                    value.showEditTicket(index);
                                    showTambahTiket(context, index);
                                  },
                                ),
                                SizedBox(width: 0.03.sw)
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
                                        "Dijual tangal ${MyParseDate.parseGeneralDate3(
                                            data["ticket_date"], "yyyy-MM-dd", "dd MMMM yyyy")}",
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
                                Text(
                                    "${data["qty"]}",
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
                            SizedBox(width: 0.03.sw),
                          ],
                        ))
                      ],
                    )
                )
              ],
            ),
          );
        },
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: value.ticketList.length,
            primary: false
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

  Widget dataPemesananWidget(EventDetailController value){
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
          Map data = value.pemesananList[index];
          String name = "";

          if(data["has_user"] != null){
            name = data["has_user"]["name"];
          }

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
                                name,
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
                                data["payment_status"] ?? "",
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
                                data["invoice_no"],
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
                                "${data["total_qty"]}",
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
            itemCount: value.pemesananList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            primary: false
        )
      ],
    );
  }

  void showTambahTiket(BuildContext context, int? index){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.3),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GetBuilder<EventDetailController>(
              id: "event_detail",
              init: EventDetailController(),
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
                                          value.ticketTitle,
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
                                      if(index == null){
                                        value.tambahTicket(context);
                                      }
                                      else{
                                        value.editTicket(context, index);
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
}