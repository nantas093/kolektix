import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/checkin_event/views/checkin_event_view.dart';
import 'package:kolektix/app/modules/create_lowongan/views/create_lowongan_view.dart';
import 'package:kolektix/app/modules/create_venue/views/create_venue_view.dart';
import 'package:kolektix/app/modules/event_detail/views/event_detail_view.dart';
import 'package:kolektix/app/modules/jual_tiket_offline/views/jual_tiket_offline_view.dart';

import '../controllers/kelola_item_controller.dart';

class KelolaItemView extends GetView<KelolaItemController> {
  const KelolaItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KelolaItemController>(
        id: "kelola_item",
        init: KelolaItemController(),
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
                                  Expanded(flex: 1, child: Text(
                                      "Kelola",
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
                                      Tab(text: 'Event'),
                                      Tab(text: 'Merchandise'),
                                      Tab(text: 'Lowongan'),
                                      Tab(text: 'Venue'),
                                      Tab(text: 'Talent'),
                                    ],
                                  ))
                                ],
                              )
                            ],
                          )
                      ),
                      Expanded(flex: 1, child: TabBarView(
                        controller: value.tabController,
                        children: <Widget>[
                          eventView(value),
                          merchandiseView(value),
                          lowonganView(value),
                          venueView(value),
                          eventView(value)
                        ],
                      ))
                    ],
                  )
              )
          );
        });
  }

  Widget eventView(KelolaItemController value){
    return SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: RefreshIndicator(
            onRefresh: ()=> value.loadEvent(),
            color: const Color.fromRGBO(11, 56, 124, 1),
            child: SizedBox(
              width: double.maxFinite.w,
              height: double.maxFinite.w,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 0.015.sh),
                    SizedBox(
                        width: double.maxFinite.w,
                        height: 0.04.sh,
                        child: ListView.builder(itemBuilder: (context,index){
                          return GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                                    top: 0.007.sh, bottom: 0.007.sh),
                                margin: EdgeInsets.only(left: 0.03.sw),
                                decoration: BoxDecoration(
                                    color: value.eventFilterPosition == index ?
                                    Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    border: Border.all(
                                        color: value.eventFilterPosition == index ?
                                        Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                                        width: 1
                                    )
                                ),
                                child: Text(
                                    index == 0 ? "Event Aktif" :
                                    index == 1 ? "Event Draft" :
                                    "Event Lalu",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_14,
                                        fontWeight: FontWeight.bold,
                                        color: value.eventFilterPosition == index ?
                                        Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                                    )
                                )
                            ),
                            onTap: (){
                              value.changeFilterPosition(index);
                            },
                          );
                        },
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                        )
                    ),
                    ListView.builder(itemBuilder: (context,index){
                      Map data = value.eventList[index];
                      String image = data["image_url"];
                      return Container(
                          width: double.maxFinite.w,
                          padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                              top: 0.01.sh, bottom: 0.01.sh),
                          margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(226, 237, 255, 1)
                              )
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 1, child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.012.sh),
                                      Text(
                                          data["name"] ?? "",
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
                                          "Tanggal & Waktu",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Color.fromRGBO(102, 102, 102, 1)
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Row(
                                        children: [
                                          SvgPicture.asset(MyConstant.IC_CALENDAR),
                                          SizedBox(width: 0.01.sw),
                                          Text(
                                              "${data["start_date"]} - ${data["end_date"]}",
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
                                          SvgPicture.asset(MyConstant.IC_TIME),
                                          SizedBox(width: 0.01.sw),
                                          Text(
                                              "${data["start_time"]} - ${data["end_time"]}",
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
                                      Text(
                                          "Venue",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_14,
                                              color: Color.fromRGBO(102, 102, 102, 1)
                                          )
                                      ),
                                      SizedBox(height: 0.01.sh),
                                      Row(
                                        children: [
                                          SvgPicture.asset(MyConstant.IC_LOCATION),
                                          SizedBox(width: 0.01.sw),
                                          Text(
                                              "${data["location_name"]}, ${data["location_city"]}",
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
                                      Container(
                                          width: double.maxFinite.w,
                                          height: 0.5,
                                          color: Color.fromRGBO(226, 237, 255, 1)
                                      ),
                                      SizedBox(height: 0.01.sh)
                                    ],
                                  )),
                                  SizedBox(width: 0.02.sw),
                                  ClipRRect(
                                    child: Image.network(image, height: 60, width: 100, fit: BoxFit.fill),
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.01.sh),
                              GestureDetector(
                                child: Container(
                                    width: double.maxFinite.w,
                                    height: 0.05.sh,
                                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: Color.fromRGBO(11, 56, 124, 1)
                                    ),
                                    child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "Lihat Detail",
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
                                  Get.to(()=> const EventDetailView(),
                                      arguments: {"data" : data});
                                },
                              ),
                              SizedBox(height: 0.01.sh),
                              Row(
                                children: [
                                  Expanded(flex: 1, child: GestureDetector(
                                    child: Container(
                                        width: 120,
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
                                                "Check In Tiket",
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
                                      Get.to(()=> const CheckinEventView(),
                                          arguments: {"data" : data});
                                    },
                                  )),
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: GestureDetector(
                                    child: Container(
                                        width: 120,
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
                                                "Jual Offline",
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
                                      Get.to(()=> const JualTiketOfflineView(),
                                          arguments: {"data" : data});
                                    },
                                  ))
                                ],
                              )
                            ],
                          )
                      );
                    },
                        itemCount: value.eventList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,primary: false
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS),
                                  SizedBox(width: 0.01.sw),
                                  Text(
                                      "Tambah Event",
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
                    )
                  ],
                ),
              ),
            )
        )
    );
  }

  Widget merchandiseView(KelolaItemController value){
    return SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.015.sh),
              SizedBox(
                  width: double.maxFinite.w,
                  height: 0.04.sh,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                            top: 0.007.sh, bottom: 0.007.sh),
                        margin: EdgeInsets.only(left: 0.03.sw),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: Color.fromRGBO(226, 237, 255, 1),
                                width: 1
                            )
                        ),
                        child: Text(
                            index == 0 ? "Sedang dijual" :
                            index == 1 ? "Merchandise Draf" :
                            "Stok Habis",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                    );
                  },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  )
              ),
              SizedBox(height: 0.015.sh),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS),
                            SizedBox(width: 0.01.sw),
                            Text(
                                "Tambah Merchandise",
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
              ListView.builder(itemBuilder: (context,index){
                return Container(
                    width: double.maxFinite.w,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                        top: 0.01.sh, bottom: 0.01.sh),
                    margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(226, 237, 255, 1)
                        )
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.012.sh),
                                Text(
                                    "Rajasinga Medan Tour Tshirt | Official Merchandise",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(height: 0.015.sh),
                                Text(
                                    "Harga",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_12,
                                        color: Color.fromRGBO(102, 102, 102, 1)
                                    )
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_LOCATION),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Rp1.250.000 ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    ),
                                    Text(
                                        "Rp1.650.000",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(102, 102, 102, 1),
                                            decoration: TextDecoration.lineThrough
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Container(
                                    width: double.maxFinite.w,
                                    height: 0.5,
                                    color: Color.fromRGBO(226, 237, 255, 1)
                                ),
                                SizedBox(height: 0.01.sh)
                              ],
                            )),
                            SizedBox(width: 0.02.sw),
                            ClipRRect(
                              child: Image.asset(MyConstant.IMG_EVENT, height: 70,
                                  width: 70, fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                  width: 120,
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
                                          "Lihat Detail",
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

                              },
                            )
                          ],
                        )
                      ],
                    )
                );
              },
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,primary: false
              ),

            ],
          ),
        )
    );
  }

  Widget lowonganView(KelolaItemController value){
    return SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.015.sh),
              SizedBox(
                  width: double.maxFinite.w,
                  height: 0.04.sh,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                            top: 0.007.sh, bottom: 0.007.sh),
                        margin: EdgeInsets.only(left: 0.03.sw),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: Color.fromRGBO(226, 237, 255, 1),
                                width: 1
                            )
                        ),
                        child: Text(
                            index == 0 ? "Lowongan Aktif" :
                            index == 1 ? "Lowongan Draf" :
                            "Lowongan Non Aktif",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                    );
                  },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  )
              ),
              SizedBox(height: 0.015.sh),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS),
                            SizedBox(width: 0.01.sw),
                            Text(
                                "Tambah Lowongan",
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
                  Get.to(()=> CreateLowonganView());
                },
              ),
              ListView.builder(itemBuilder: (context,index){
                return Container(
                    width: double.maxFinite.w,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                        top: 0.01.sh, bottom: 0.01.sh),
                    margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(226, 237, 255, 1)
                        )
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.012.sh),
                                Text(
                                    "Sound Enginer",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_LOCATION),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Jakarta Selatan",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_CALENDAR),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Rp2jt- Rp3jt / hari",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_TIME),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Full Time",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Container(
                                    width: double.maxFinite.w,
                                    height: 0.5,
                                    color: Color.fromRGBO(226, 237, 255, 1)
                                ),
                                SizedBox(height: 0.01.sh)
                              ],
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                  width: 120,
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
                                          "Lihat Detail",
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

                              },
                            )
                          ],
                        )
                      ],
                    )
                );
              },
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,primary: false
              ),

            ],
          ),
        )
    );
  }

  Widget venueView(KelolaItemController value){
    return SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.015.sh),
              SizedBox(
                  width: double.maxFinite.w,
                  height: 0.04.sh,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw,
                            top: 0.007.sh, bottom: 0.007.sh),
                        margin: EdgeInsets.only(left: 0.03.sw),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: Color.fromRGBO(226, 237, 255, 1),
                                width: 1
                            )
                        ),
                        child: Text(
                            index == 0 ? "Venue Aktif" :
                            index == 1 ? "Venue Draf" :
                            "Venue Non Aktif",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                    );
                  },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  )
              ),
              SizedBox(height: 0.015.sh),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS),
                            SizedBox(width: 0.01.sw),
                            Text(
                                "Tambah Venue",
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
                  Get.to(()=> CreateVenueView());
                },
              ),
              ListView.builder(itemBuilder: (context,index){
                return Container(
                    width: double.maxFinite.w,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                        top: 0.01.sh, bottom: 0.01.sh),
                    margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: 0.02.sh),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(226, 237, 255, 1)
                        )
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.012.sh),
                                Text(
                                    "Cahaya Nusantara Bangsa",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_LOCATION),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Jakarta Selatan",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyConstant.IC_COIN),
                                    SizedBox(width: 0.01.sw),
                                    Text(
                                        "Mulai dari",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Colors.black,
                                        )
                                    ),
                                    Text(
                                        " Rp150.000.000",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.01.sh),
                                Container(
                                    width: double.maxFinite.w,
                                    height: 0.5,
                                    color: Color.fromRGBO(226, 237, 255, 1)
                                ),
                                SizedBox(height: 0.01.sh)
                              ],
                            )),
                            SizedBox(width: 0.02.sw),
                            ClipRRect(
                              child: Image.asset(MyConstant.IMG_EVENT, height: 70,
                                  width: 70, fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                  width: 120,
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
                                          "Lihat Detail",
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

                              },
                            )
                          ],
                        )
                      ],
                    )
                );
              },
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,primary: false
              ),

            ],
          ),
        )
    );
  }
}