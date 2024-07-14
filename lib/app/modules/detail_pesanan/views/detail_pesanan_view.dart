import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';

import '../controllers/detail_pesanan_controller.dart';

class DetailPesananView extends GetView<DetailPesananController> {
  const DetailPesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPesananController>(
        id: "detail_pesanan",
        init: DetailPesananController(),
        builder: (value){
          return Scaffold(
              backgroundColor: Color.fromRGBO(246, 250, 255, 1),
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: Column(
                    children: [
                      Container(
                          width: double.maxFinite.w,
                          height: 0.13.sh,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 0.07.sh),
                              Row(
                                children: [
                                  SizedBox(width: 0.03.sw),
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                        MyConstant.IC_LEFT, color: Colors.black),
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(width: 0.03.sw),
                                  Expanded(flex: 1, child: Text(
                                      "Detail Pesanan",
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
                              Container(
                                width: double.maxFinite.w,
                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                                    top: 0.015.sh, bottom: 0.015.sh),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Pesanan Baru",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        )
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Container(
                                        width: double.maxFinite.w,
                                        height: 0.5,
                                        color: Color.fromRGBO(226, 237, 255, 1)
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Row(
                                      children: [
                                        Text(
                                            "INV/2025342/XVI/X/55069657 ",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: Color.fromRGBO(102, 102, 102, 1)
                                            )
                                        ),
                                        SvgPicture.asset(MyConstant.IC_COPY),
                                        Expanded(child: SizedBox(), flex: 1),
                                        Text(
                                            "Lihat detail",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: Color.fromRGBO(11, 56, 124, 1)
                                            )
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Row(
                                      children: [
                                        Expanded(flex: 1, child: Text(
                                            "Nama Pembeli",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: Color.fromRGBO(102, 102, 102, 1)
                                            )
                                        )),
                                        Text(
                                            "Wawan",
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
                                    Row(
                                      children: [
                                        Expanded(flex: 1, child: Text(
                                            "Tanggal Pembelian",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: Color.fromRGBO(102, 102, 102, 1)
                                            )
                                        )),
                                        Text(
                                            "25 Des 2023, 05:00 WIB",
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
                                    Row(
                                      children: [
                                        Expanded(flex: 1, child: Text(
                                            "Batas Respons",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                                fontSize: MyConstant.TEXT_14,
                                                color: Color.fromRGBO(102, 102, 102, 1)
                                            )
                                        )),
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromRGBO(255, 155, 5, 1),
                                              borderRadius: BorderRadius.all(Radius.circular(6))
                                          ),
                                          padding: EdgeInsets.only(left: 0.01.sw, right: 0.01.sw,
                                              top: 0.005.sh, bottom: 0.005.sh
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(MyConstant.IC_TIME, color: Colors.white,
                                                  width: 16, height: 16
                                              ),
                                              SizedBox(width: 0.01.sw),
                                              Text(
                                                  "1 Hari 4 Jam",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                                      fontSize: MyConstant.TEXT_12,
                                                      color: Colors.white
                                                  )
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 0.01.sh),
                              Container(
                                width: double.maxFinite.w,
                                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                                    top: 0.015.sh, bottom: 0.015.sh),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Detail Produk",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: MyConstant.STR_INTER_REGULAR,
                                            fontSize: MyConstant.TEXT_16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        )
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Container(
                                        width: double.maxFinite.w,
                                        height: 0.5,
                                        color: Color.fromRGBO(226, 237, 255, 1)
                                    ),
                                    SizedBox(height: 0.015.sh),
                                    Card(
                                        color: Colors.white,
                                        surfaceTintColor: Colors.white,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw,
                                              top: 0.015.sh, bottom: 0.015.sh),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 0.03.sw),
                                              ClipRRect(
                                                  child: Image.asset(MyConstant.IMG_EVENT, width: 55,
                                                      height: 55, fit: BoxFit.fill),
                                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              SizedBox(width: 0.03.sw),
                                              Expanded(flex: 1, child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Rajasinga Medan Tour Tshirt | Official Merchandise",
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_14,
                                                          color: Colors.black
                                                      )
                                                  ),
                                                  Text(
                                                      "1 x Rp20.000",
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                                          fontSize: MyConstant.TEXT_14,
                                                          color: Color.fromRGBO(102, 102, 102, 1)
                                                      )
                                                  )
                                                ],
                                              )),
                                              SizedBox(width: 0.03.sw)
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      )),
                      Container(
                          width: double.maxFinite.w,
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                              top: 0.03.sh, bottom: 0.03.sh),
                          child: GestureDetector(
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
                                            "Konfirmasi Pesanan",
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

                            },
                          )
                      )
                    ],
                  )
              )
          );
        });
  }
}