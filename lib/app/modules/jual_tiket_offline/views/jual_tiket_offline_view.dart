import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/jual_tiket_offline_list/views/jual_tiket_offline_list_view.dart';
import 'package:kolektix/app/utils/my_parse_date.dart';

import '../controllers/jual_tiket_offline_controller.dart';

class JualTiketOfflineView extends GetView<JualTiketOfflineController> {
  const JualTiketOfflineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JualTiketOfflineController>(
        id: "jual_tiket",
        init: JualTiketOfflineController(),
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
                                    Text(
                                        "Penjualan Tiket Offline",
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
                          Get.to(()=> const JualTiketOfflineListView(),
                              arguments: {"data" : value.data});
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
                          Expanded(flex: 1, child: Text(
                              "Total Penjualan Offline",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_16,
                                  color: Color.fromRGBO(102, 102, 102, 1)
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
                      Row(
                        children: [
                          SizedBox(width: 0.03.sw),
                          Text(
                              "Rp${value.grandTotal}",
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
                      SizedBox(height: 0.015.sh),
                      Container(
                          width: double.maxFinite.w,
                          height: 0.5,
                          color: Color.fromRGBO(226, 237, 255, 1)
                      ),
                      SizedBox(height: 0.02.sh),
                      Expanded(flex: 1, child: ListView.builder(itemBuilder: (context,index){
                        Map data = value.eventList[index];
                        return Container(
                            width: double.maxFinite.w,
                            padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                            margin: EdgeInsets.only(top: index == 0 ? 0 : 0.015.sh),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(flex: 1, child: Text(
                                        "${data["total_qty"]} Tiket",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    )),
                                    Text(
                                        data["grandtotal"] ?? "",
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
                                        data["invoice_no"] ?? "",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_12,
                                            color: Color.fromRGBO(11, 56, 124, 1)
                                        )
                                    ),
                                    Expanded(flex: 1, child: SizedBox()),
                                    Text(
                                        MyParseDate.parseGeneralDate3(data["created_at"],
                                            "yyyy-MM-dd'T'HH:mm:ss.Z", "dd/MM/yyyy | HH:mm"),
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
                        itemCount: value.eventList.length,
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