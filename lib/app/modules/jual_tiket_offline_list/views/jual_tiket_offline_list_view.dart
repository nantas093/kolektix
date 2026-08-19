import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';

import '../controllers/jual_tiket_offline_list_controller.dart';

class JualTiketOfflineListView extends GetView<JualTiketOfflineListController> {
  const JualTiketOfflineListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JualTiketOfflineListController>(
        id: "jual_tiket_offline",        builder: (value){
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
                                      "Penjualan Tiket Offline",
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
                                  value.data["name"] ?? "",
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
                                  "${value.data["start_date"]} - ${value.data["end_date"]}",
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
                            child: Image.network(value.image, height: 50,
                                width: 80, fit: BoxFit.fill),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          SizedBox(width: 0.03.sw)
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Container(
                          width: double.maxFinite.w,
                          height: 7,
                          color: Color.fromRGBO(226, 237, 255, 0.5)
                      ),
                      SizedBox(height: 0.02.sh),
                      Expanded(flex: 1, child: Column(
                        children: [
                          Container(
                              width: double.maxFinite.w,
                              height: 0.055.sh,
                              child: ListView.builder(itemBuilder: (context,index){
                                Map data = value.dateLists[index];
                                return GestureDetector(
                                  child: Container(
                                      width: 80,
                                      margin: EdgeInsets.only(left: 0.03.sw),
                                      height: double.maxFinite.w,decoration: BoxDecoration(
                                      color: value.selectedIndex == index ? Color.fromRGBO(2, 37, 90, 1) : Colors.transparent,
                                      border: value.selectedIndex == index ? null : Border.all(
                                          color: Color.fromRGBO(226, 237, 255, 1),
                                          width: 1
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              MyParseDate.parseGeneralDate3(data["ticket_date"], "yyyy-MM-dd", "EEEE"),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  fontSize: MyConstant.TEXT_12,
                                                  color: value.selectedIndex == index ? Colors.white.withOpacity(0.5) : Color.fromRGBO(102, 102, 102, 1)
                                              )
                                          ),
                                          Text(
                                              MyParseDate.parseGeneralDate3(data["ticket_date"], "yyyy-MM-dd", "dd MMM"),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                                  fontSize: MyConstant.TEXT_16,
                                                  color: value.selectedIndex == index ? Colors.white : Colors.black,
                                                  fontWeight: FontWeight.bold
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                  onTap: (){
                                    value.changeIndexPosition(index);
                                  },
                                );
                              },
                                  itemCount: value.dateLists.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal
                              )
                          ),
                          Expanded(flex: 1, child: Column(
                            children: [
                              Container(
                                  width: double.maxFinite.w,
                                  height: 0.15.sh,
                                  margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                                      top: 0.02.sh),
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
                                                  value.ticketName,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_16,
                                                      color: Colors.black
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
                                                      "Rp${value.ticketPrice}",
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
                                          )),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                child: SvgPicture.asset(MyConstant.IC_CIRCLE_MINUS, color: Color.fromRGBO(11, 56, 124, 1),
                                                  height: 24, width: 24,
                                                ),
                                                onTap: (){
                                                  value.setMinMaxTicket(1);
                                                },
                                              ),
                                              SizedBox(width: 0.05.sw),
                                              Text(
                                                  "${value.ticketQuantity}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_16,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold
                                                  )
                                              ),
                                              SizedBox(width: 0.05.sw),
                                              GestureDetector(
                                                child: SvgPicture.asset(MyConstant.IC_CIRCLE_PLUS, color: Color.fromRGBO(11, 56, 124, 1),
                                                  height: 24, width: 24,),
                                                onTap: (){
                                                  value.setMinMaxTicket(2);
                                                },
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
                          ))
                        ],
                      )),
                      Container(
                          width: double.maxFinite.w,
                          height: 2,
                          color: Color.fromRGBO(226, 237, 255, 0.5)
                      ),
                      Container(
                        width: double.maxFinite.w,
                        height: 0.1.sh,
                        child: Center(
                            child: Row(
                              children: [
                                SizedBox(width: 0.05.sw),
                                Expanded(flex: 1, child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Total (x${value.totalOrderedTickets})",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(
                                        "Rp${value.totalPrice}",
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
                                GestureDetector(
                                  child: Container(
                                      width: 130,
                                      height: 0.05.sh,
                                      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(11, 56, 124, 1),
                                          borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Center(
                                          child: Text(
                                              "Pembayaran",
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
                                    value.goToPembayaran(context);
                                  },
                                ),
                                SizedBox(width: 0.05.sw)
                              ],
                            )
                        ),
                      )
                    ],
                  )
              )
          );
        });
  }
}