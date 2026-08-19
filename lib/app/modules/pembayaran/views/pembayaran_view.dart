import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PembayaranController>(
        id: "pembayaran",        builder: (value){
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
                                      "Pembayaran",
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
                      Expanded(flex: 1, child: SingleChildScrollView(
                          child: Column(
                            children: [
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
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Text(
                                      "Tiket",
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
                              SizedBox(height: 0.02.sh),
                              ListView.builder(itemBuilder: (context,index){
                                Map data = value.dataList[index];
                                return Container(
                                    width: double.maxFinite.w,
                                    margin: EdgeInsets.only(top: index == 0 ? 0 : 0.02.sh),
                                    child: Column(
                                      children: [
                                        Container(
                                            width: double.maxFinite.w,
                                            height: 1,
                                            color: Color.fromRGBO(226, 237, 255, 0.5)
                                        ),
                                        SizedBox(height: 0.02.sh),
                                        Row(
                                          children: [
                                            SizedBox(width: 0.03.sw),
                                            Container(
                                                width: 40,
                                                height: 40,
                                                child: Center(
                                                    child: SvgPicture.asset(MyConstant.IC_TICKET)
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    border: Border.all(
                                                        color: Color.fromRGBO(226, 237, 255, 1),
                                                        width: 1
                                                    )
                                                )
                                            ),
                                            SizedBox(width: 0.03.sw),
                                            Expanded(flex: 1, child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    data["name"] ?? "",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_16,
                                                        color: Colors.black
                                                    )
                                                ),
                                                SizedBox(height: 0.005.sh),
                                                Text(
                                                    "${data["ticket_quantity"]} tiket x Rp${data["price"]} ",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                                        fontSize: MyConstant.TEXT_12,
                                                        color: Color.fromRGBO(102, 102, 102, 1)
                                                    )
                                                )
                                              ],
                                            )),
                                            SizedBox(width: 0.03.sw)
                                          ],
                                        )
                                      ],
                                    )
                                );
                              },
                                  itemCount: value.dataList.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  primary: false
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
                                  Text(
                                      "Detail Pembayaran",
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
                              SizedBox(height: 0.02.sh),
                              ListView.builder(itemBuilder: (context,index){
                                Map data = value.dataList[index];
                                return Container(
                                    width: double.maxFinite.w,
                                    margin: EdgeInsets.only(top: index == 0 ? 0 : 0.02.sh),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 0.03.sw),
                                            Expanded(flex: 1, child: Text(
                                                "${data["name"] ?? ""} (x${data["ticket_quantity"]})",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Color.fromRGBO(102, 102, 102, 1)
                                                )
                                            )),
                                            SizedBox(width: 0.03.sw),
                                            Text(
                                                "Rp${(data["price"] as int) * (data["ticket_quantity"] as int)}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontFamily: MyConstant.STR_INTER_REGULAR,
                                                    fontSize: MyConstant.TEXT_14,
                                                    color: Color.fromRGBO(102, 102, 102, 1)
                                                )
                                            ),
                                            SizedBox(width: 0.03.sw)
                                          ],
                                        )
                                      ],
                                    )
                                );
                              },
                                  itemCount: value.dataList.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  primary: false
                              ),
                              SizedBox(height: 0.02.sh),
                              Container(
                                width: double.maxFinite.w,
                                height: 1,
                                color: Color.fromRGBO(226, 237, 255, 0.5),
                                margin: EdgeInsets.only(left: 0.05.sw),
                              ),
                              SizedBox(height: 0.02.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: Text(
                                      "Pajak",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Color.fromRGBO(102, 102, 102, 1)
                                      )
                                  )),
                                  SizedBox(width: 0.03.sw),
                                  Text(
                                      "Rp0",
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
                              SizedBox(height: 0.01.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: Text(
                                      "Biaya Admin",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_14,
                                          color: Color.fromRGBO(102, 102, 102, 1)
                                      )
                                  )),
                                  SizedBox(width: 0.03.sw),
                                  Text(
                                      "Rp${value.admin}",
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
                              SizedBox(height: 0.01.sh)
                            ],
                          )
                      )),
                      Container(
                          width: double.maxFinite.w,
                          height: 2,
                          color: Color.fromRGBO(226, 237, 255, 0.5)
                      ),
                      Container(
                          width: double.maxFinite.w,
                          padding: EdgeInsets.only(top: 0.015.sh, bottom: 0.015.sh),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: Text(
                                      "Detail Pembayaran",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      )
                                  )),
                                  Text(
                                      "Rp${value.totalTicketPrice + value.admin}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  SizedBox(width: 0.03.sw)
                                ],
                              ),
                              SizedBox(height: 0.02.sh),
                              Container(
                                  width: double.maxFinite.w,
                                  margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                  padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw,
                                      top: 0.01.sh, bottom: 0.01.sh),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(235, 135, 0, 0.1),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(MyConstant.IC_WARNING),
                                      SizedBox(width: 0.03.sw),
                                      Expanded(flex: 1, child: Text(
                                          "Pastikan untuk mengecek atau memfoto bukti pembayaran tiket sebelum konfirmasi pembayaran.",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontFamily: MyConstant.STR_INTER_REGULAR,
                                              fontSize: MyConstant.TEXT_12,
                                              color: Color.fromRGBO(102, 102, 102, 1)
                                          )
                                      ))
                                    ],
                                  )
                              ),
                              SizedBox(height: 0.02.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: GestureDetector(
                                    child: Container(
                                        width: double.maxFinite.w,
                                        height: 0.05.sh,
                                        padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(11, 56, 124, 1),
                                            borderRadius: BorderRadius.all(Radius.circular(8))
                                        ),
                                        child: Center(
                                            child: Text(
                                                "Bayar Sekarang",
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
                                      value.pay(context);
                                    },
                                  )),
                                  SizedBox(width: 0.03.sw)
                                ],
                              )
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