import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/create_event/views/create_event_view.dart';
import 'package:kolektix/app/modules/event_detail/views/event_detail_view.dart';

import '../controllers/event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        id: "event",
        init: EventController(),
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
                                      "Event",
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
                                  GestureDetector(
                                    child: SvgPicture.asset(MyConstant.IC_PLUS),
                                    onTap: (){
                                      Get.to(()=> CreateEventView());
                                    },
                                  ),
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
                                      Tab(text: 'Event Aktif'),
                                      Tab(text: 'Event Draf'),
                                      Tab(text: 'Event Lalu'),
                                    ],
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
                      Expanded(flex: 1, child: TabBarView(
                        controller: value.tabController,
                        children: <Widget>[
                          eventView(value),
                          eventView(value),
                          eventView(value),
                        ],
                      ))
                    ],
                  )
              )
          );
        });
  }

  Widget eventView(EventController value){
    return SizedBox(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: RefreshIndicator(child: SizedBox(
            width: double.maxFinite.w,
            height: double.maxFinite.w,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
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
                    SizedBox(height: 0.015.sh),
                    ListView.builder(itemBuilder: (context,index){
                      Map data = value.eventList[index];
                      String image = data["image_url"];
                      return Container(
                          width: double.maxFinite.w,
                          padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                              top: 0.01.sh, bottom: 0.01.sh),
                          margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw, top: index == 0 ? 0 : 0.02.sh),
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
                                      SizedBox(height: 0.01.sh),
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
                                          Get.to(()=> EventDetailView());
                                        },
                                      )
                                    ],
                                  )),
                                  SizedBox(width: 0.02.sw),
                                  ClipRRect(
                                    child: Image.network(image, height: 60, width: 100, fit: BoxFit.fill),
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                        itemCount: value.eventList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,primary: false
                    )
                  ],
                )
            )
        ), onRefresh: ()=> value.loadEvent())
    );
  }
}