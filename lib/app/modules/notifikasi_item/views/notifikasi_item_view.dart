import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/detail_pesanan/views/detail_pesanan_view.dart';

import '../controllers/notifikasi_item_controller.dart';

class NotifikasiItemView extends GetView<NotifikasiItemController> {
  const NotifikasiItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                                      "Pesanan",
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: MyConstant.STR_INTER_REGULAR,
                                          fontSize: MyConstant.TEXT_16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ))),
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
                                    controller: controller.tabController,
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
                                      Tab(text: 'Merchandise'),
                                      Tab(text: 'Venue'),
                                      Tab(text: 'Tiket'),
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
                        controller: controller.tabController,
                        children: <Widget>[
                          merchandiseView(controller),
                          merchandiseView(controller),
                          merchandiseView(controller),
                        ],
                       ))
                     ],
                   )
               )
           );
  }

  Widget merchandiseView(NotifikasiItemController value){
    return Container(
        width: double.maxFinite.w,
        height: double.maxFinite.w,
        child: Column(
          children: [
            SizedBox(height: 0.02.sh),
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
                            color: controller.merchandiseTabIndex == index ?
                            Color.fromRGBO(246, 250, 255, 1) : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                                color: controller.merchandiseTabIndex == index ?
                                Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1),
                                width: 1
                            )
                        ),
                        child: Text(
                            controller.tabs[index],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                fontWeight: FontWeight.bold,
                                color: controller.merchandiseTabIndex == index ?
                                Color.fromRGBO(11, 56, 124, 1) : Color.fromRGBO(102, 102, 102, 1)
                            )
                        )
                    ),
                    onTap: (){
                      controller.changeMerchandiseTabIndex(index);
                    },
                  );
                },
                  itemCount: controller.tabs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                )
            ),
            SizedBox(height: 0.02.sh),
            Container(
                width: double.maxFinite.w,
                height: 0.005.sh,
                color: Color.fromRGBO(246, 250, 255, 1)
            ),
            SizedBox(height: 0.02.sh),
            Expanded(child: ListView.builder(itemBuilder: (context,index){
              return Container(
                width: double.maxFinite.w,
                margin: EdgeInsets.only(top: index == 0 ? 0 : 0.02.sh),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        Expanded(flex: 1, child: Text(
                            "Pesanan Baru",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )
                        )),
                        SizedBox(width: 0.03.sw)
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        Expanded(flex: 1, child: Text(
                            "INV/2043245523/MPL/43254353",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_REGULAR,
                                fontSize: MyConstant.TEXT_14,
                                color: Color.fromRGBO(102, 102, 102, 1)
                            )
                        )),
                        Text(
                            "Batas Respons",
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
                            "Mr. Rudi",
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
                        ),
                        SizedBox(width: 0.03.sw)
                      ],
                    ),
                    SizedBox(height: 0.015.sh),
                    Container(
                        margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                        width: double.maxFinite.w,
                        height: 0.5,
                        color: Color.fromRGBO(226, 237, 255, 1)
                    ),
                    SizedBox(height: 0.015.sh),
                    Row(
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
                                "+1 Produk lainnya",
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
                    SizedBox(height: 0.015.sh),
                    Container(
                        margin: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                        width: double.maxFinite.w,
                        height: 0.5,
                        color: Color.fromRGBO(226, 237, 255, 1)
                    ),
                    SizedBox(height: 0.015.sh),
                    Row(
                      children: [
                        SizedBox(width: 0.03.sw),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(MyConstant.IC_CAR),
                                Text(
                                    " SiCepat - Halu",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_14,
                                        color: Colors.black
                                    )
                                )
                              ],
                            ),
                            SizedBox(height: 0.01.sh),
                            Row(
                              children: [
                                SvgPicture.asset(MyConstant.IC_LOCATION),
                                Text(
                                    " Jawa Barat",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: MyConstant.STR_INTER_REGULAR,
                                        fontSize: MyConstant.TEXT_14,
                                        color: Colors.black
                                    )
                                )
                              ],
                            )
                          ],
                        )),
                        SizedBox(width: 0.03.sw),
                        GestureDetector(
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(11, 56, 124, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(6))
                              ),
                              padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw,
                                  top: 0.005.sh, bottom: 0.005.sh
                              ),
                              child: Text(
                                  "Terima Pesanan",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_16,
                                      color: Colors.white
                                  )
                              )
                          ),
                          onTap: (){
                            Get.to(()=> DetailPesananView());
                          },
                        ),
                        SizedBox(width: 0.03.sw)
                      ],
                    ),
                    SizedBox(height: 0.02.sh),
                    Container(
                        width: double.maxFinite.w,
                        height: 0.005.sh,
                        color: Color.fromRGBO(246, 250, 255, 1)
                    )
                  ],
                ),
              );
            },
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero
            ))
          ],
        )
    );
  }
}