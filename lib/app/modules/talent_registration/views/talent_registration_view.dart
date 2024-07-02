import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kolektix/app/constants/my_constants.dart';
import 'package:kolektix/app/modules/email_verification/views/email_verification_view.dart';

import '../controllers/talent_registration_controller.dart';

class TalentRegistrationView extends GetView<TalentRegistrationController> {
  const TalentRegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TalentRegistrationController>(
        id: "talent_registration",
        init: TalentRegistrationController(),
        builder: (value){
          return Scaffold(
              backgroundColor: Colors.white,
              body: SizedBox(
                  width: double.maxFinite.w,
                  height: double.maxFinite.w,
                  child: Column(
                    children: [
                      SizedBox(height: 0.07.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          GestureDetector(
                            child: SvgPicture.asset(
                                MyConstant.IC_LEFT, color: const Color.fromRGBO(
                                15, 14, 14, 1)),
                            onTap: () {
                              Get.back();
                            },
                          ),
                          SizedBox(width: 0.03.sw),
                          Text(
                              "Registrasi",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          SizedBox(width: 0.03.sw)
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Container(
                        width: double.maxFinite.w,
                        height: 1,
                        color: Color.fromRGBO(226, 237, 255, 1),
                      ),
                      SizedBox(height: 0.025.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          Text(
                              "Memulai Sebagai Talent",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      Row(
                        children: [
                          SizedBox(width: 0.05.sw),
                          Text(
                              "Halo, silahkan isi detail Talent dibawah ini ya!",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: MyConstant.STR_INTER_REGULAR,
                                  fontSize: MyConstant.TEXT_14,
                                  color: Color.fromRGBO(102, 102, 102, 1)
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 0.005.sh),
                      Expanded(flex: 1, child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 0.02.sh),
                              //First
                              firstStepHeader(value),
                              firstStepContent(value),
                              //Second
                              secondStepHeader(value),
                              secondStepContent(value),
                              //Third
                              threeStepHeader(value),
                              threeStepContent(value),
                              //Fourth
                              fourStepHeader(value),
                              fourStepContent(value),
                              //Fifth
                              fiveStepHeader(value),
                              fiveStepContent(value)
                            ],
                          )
                      ))
                    ],
                  )
              )
          );
        });
  }

  Widget firstStepHeader(TalentRegistrationController value){
    return Row(
      children: [
        SizedBox(width: 0.05.sw),
        Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value.dropdownPosition == 1 ? const Color.fromRGBO(11, 56, 124, 1) : value.oneFilled ? const Color.fromRGBO(11, 56, 124, 1) : const Color.fromRGBO(246, 250, 255, 1),
                border: value.oneFilled ? null : Border.all(
                    color: Color.fromRGBO(226, 237, 255, 1),
                    width: 2
                )
            ),
            child: Center(
                child: value.oneFilled ? SvgPicture.asset(MyConstant.IC_CHECK, color: Colors.white, width: 16, height: 16) :
                Text(
                    "1",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: value.dropdownPosition == 1 ? Colors.white : value.oneFilled ? Colors.white : Colors.black
                    )
                )
            )
        ),
        SizedBox(width: 0.015.sw),
        Text(
            "Masukkan nama talent",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: MyConstant.STR_INTER_REGULAR,
                fontSize: MyConstant.TEXT_16,
                color: value.dropdownPosition == 1 ? Colors.black : value.oneFilled ? Colors.black : const Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold
            )
        )
      ],
    );
  }

  Widget firstStepContent(TalentRegistrationController value){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.08.sw),
          Container(
              width: 2,
              height: value.dropdownPosition == 1 ? 125 : 20,
              color: value.oneFilled ? const Color.fromRGBO(11, 56, 124, 1)
                  : const Color.fromRGBO(226, 237, 255, 1)
          ),
          value.dropdownPosition == 1 ? Expanded(flex: 1, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02.sh),
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
                          Expanded(child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Nama talent",
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
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 0.05.sh,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(11, 56, 124, 1)
                    ),
                    child: Center(
                        child: Text(
                            "Lanjut",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_BOLD,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.white
                            )
                        )
                    )
                ),
                onTap: (){
                  value.changeFilled(1);
                  value.changeDropdownPosition(2);
                },
              )
            ],
          )) : SizedBox()
        ]
    );
  }

  Widget secondStepHeader(TalentRegistrationController value){
    return Row(
      children: [
        SizedBox(width: 0.05.sw),
        Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value.dropdownPosition == 2 ? const Color.fromRGBO(11, 56, 124, 1) : value.twoFilled ? const Color.fromRGBO(11, 56, 124, 1) : const Color.fromRGBO(246, 250, 255, 1),
                border: value.twoFilled ? null : Border.all(
                    color: Color.fromRGBO(226, 237, 255, 1),
                    width: 2
                )
            ),
            child: Center(
                child: Center(
                    child: value.twoFilled ? SvgPicture.asset(MyConstant.IC_CHECK, color: Colors.white, width: 16, height: 16) :
                    Text(
                        "2",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: value.dropdownPosition == 2 ? Colors.white : value.twoFilled ? Colors.white : Colors.black
                        )
                    )
                )
            )
        ),
        SizedBox(width: 0.015.sw),
        Text(
            "Pilih kategori talent",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: MyConstant.STR_INTER_REGULAR,
                fontSize: MyConstant.TEXT_16,
                color: value.dropdownPosition == 2 ? Colors.black : value.twoFilled ? Colors.black : const Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold
            )
        )
      ],
    );
  }

  Widget secondStepContent(TalentRegistrationController value){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.08.sw),
          Container(
              width: 2,
              height: value.dropdownPosition == 2 ? 125 : 20,
              color: value.twoFilled ? const Color.fromRGBO(11, 56, 124, 1)
                  : const Color.fromRGBO(226, 237, 255, 1)
          ),
          value.dropdownPosition == 2 ? Expanded(flex: 1, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02.sh),
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
                          Expanded(child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Kategori talent",
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
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 0.05.sh,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(11, 56, 124, 1)
                    ),
                    child: Center(
                        child: Text(
                            "Lanjut",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_BOLD,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.white
                            )
                        )
                    )
                ),
                onTap: (){
                  value.changeFilled(2);
                  value.changeDropdownPosition(3);
                },
              )
            ],
          )) : SizedBox()
        ]
    );
  }

  Widget threeStepHeader(TalentRegistrationController value){
    return Row(
      children: [
        SizedBox(width: 0.05.sw),
        Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value.dropdownPosition == 3 ? const Color.fromRGBO(11, 56, 124, 1) : value.threeFilled ? const Color.fromRGBO(11, 56, 124, 1) : const Color.fromRGBO(246, 250, 255, 1),
                border: value.threeFilled ? null : Border.all(
                    color: Color.fromRGBO(226, 237, 255, 1),
                    width: 2
                )
            ),
            child: Center(
                child: Center(
                    child: value.threeFilled ? SvgPicture.asset(MyConstant.IC_CHECK, color: Colors.white, width: 16, height: 16) :
                    Text(
                        "3",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: value.dropdownPosition == 3 ? Colors.white : value.threeFilled ? Colors.white : Colors.black
                        )
                    )
                )
            )
        ),
        SizedBox(width: 0.015.sw),
        Text(
            "Masukkan alamat lokasi talent",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: MyConstant.STR_INTER_REGULAR,
                fontSize: MyConstant.TEXT_16,
                color: value.dropdownPosition == 3 ? Colors.black : value.threeFilled ? Colors.black : const Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold
            )
        )
      ],
    );
  }

  Widget threeStepContent(TalentRegistrationController value){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.08.sw),
          Container(
              width: 2,
              height: value.dropdownPosition == 3 ? 125 : 20,
              color: value.threeFilled ? const Color.fromRGBO(11, 56, 124, 1)
                  : const Color.fromRGBO(226, 237, 255, 1)
          ),
          value.dropdownPosition == 3 ? Expanded(flex: 1, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02.sh),
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
                          Expanded(child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Contoh: Jakarta",
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
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 0.05.sh,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(11, 56, 124, 1)
                    ),
                    child: Center(
                        child: Text(
                            "Lanjut",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_BOLD,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.white
                            )
                        )
                    )
                ),
                onTap: (){
                  value.changeFilled(3);
                  value.changeDropdownPosition(4);
                },
              )
            ],
          )) : SizedBox()
        ]
    );
  }

  Widget fourStepHeader(TalentRegistrationController value){
    return Row(
      children: [
        SizedBox(width: 0.05.sw),
        Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value.dropdownPosition == 4 ? const Color.fromRGBO(11, 56, 124, 1) : value.fourFilled ? const Color.fromRGBO(11, 56, 124, 1) : const Color.fromRGBO(246, 250, 255, 1),
                border: value.fourFilled ? null : Border.all(
                    color: Color.fromRGBO(226, 237, 255, 1),
                    width: 2
                )
            ),
            child: Center(
                child: value.fourFilled ? SvgPicture.asset(MyConstant.IC_CHECK, color: Colors.white, width: 16, height: 16) :
                Text(
                    "4",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: MyConstant.STR_INTER_REGULAR,
                        fontSize: MyConstant.TEXT_14,
                        color: value.dropdownPosition == 4 ? Colors.white : value.fourFilled ? Colors.white : Colors.black
                    )
                )
            )
        ),
        SizedBox(width: 0.015.sw),
        Text(
            "Masukkan no. telepon / handphone",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: MyConstant.STR_INTER_REGULAR,
                fontSize: MyConstant.TEXT_16,
                color: value.dropdownPosition == 4 ? Colors.black : value.fourFilled ? Colors.black : const Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold
            )
        )
      ],
    );
  }

  Widget fourStepContent(TalentRegistrationController value){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.08.sw),
          Container(
              width: 2,
              height: value.dropdownPosition == 4 ? 125 : 20,
              color: value.fourFilled ? const Color.fromRGBO(11, 56, 124, 1)
                  : const Color.fromRGBO(226, 237, 255, 1)
          ),
          value.dropdownPosition == 4 ? Expanded(flex: 1, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  SizedBox(width: 0.03.sw),
                  Container(
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
                              Text(
                                  "ID",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Color.fromRGBO(102, 102, 102, 1)
                                  )
                              ),
                              SizedBox(width: 0.02.sw),
                              Text(
                                  "+62",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: MyConstant.STR_INTER_REGULAR,
                                      fontSize: MyConstant.TEXT_14,
                                      color: Color.fromRGBO(102, 102, 102, 1)
                                  )
                              ),
                              SizedBox(width: 0.02.sw),
                              SvgPicture.asset(MyConstant.IC_CIRCLE_CHECK)
                            ],
                          )
                      )
                  ),
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
                              Expanded(child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: "123 4567 890",
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
                  )),
                  SizedBox(width: 0.03.sw)
                ],
              ),
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 0.05.sh,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(11, 56, 124, 1)
                    ),
                    child: Center(
                        child: Text(
                            "Lanjut",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_BOLD,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.white
                            )
                        )
                    )
                ),
                onTap: (){
                  value.changeFilled(4);
                  value.changeDropdownPosition(5);
                },
              )
            ],
          )) : SizedBox()
        ]
    );
  }

  Widget fiveStepHeader(TalentRegistrationController value){
    return Row(
      children: [
        SizedBox(width: 0.05.sw),
        Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value.dropdownPosition == 5 ? const Color.fromRGBO(11, 56, 124, 1) : value.fiveFilled ? const Color.fromRGBO(11, 56, 124, 1) : const Color.fromRGBO(246, 250, 255, 1),
                border: value.fiveFilled ? null : Border.all(
                    color: Color.fromRGBO(226, 237, 255, 1),
                    width: 2
                )
            ),
            child: Center(
                child: Center(
                    child: value.fiveFilled ? SvgPicture.asset(MyConstant.IC_CHECK, color: Colors.white, width: 16, height: 16) :
                    Text(
                        "5",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: MyConstant.STR_INTER_REGULAR,
                            fontSize: MyConstant.TEXT_14,
                            color: value.dropdownPosition == 5 ? Colors.white : value.fiveFilled ? Colors.white : Colors.black
                        )
                    )
                )
            )
        ),
        SizedBox(width: 0.015.sw),
        Text(
            "Masukkan email",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: MyConstant.STR_INTER_REGULAR,
                fontSize: MyConstant.TEXT_16,
                color: value.dropdownPosition == 5 ? Colors.black : value.fiveFilled ? Colors.black : const Color.fromRGBO(143, 143, 143, 1),
                fontWeight: FontWeight.bold
            )
        )
      ],
    );
  }

  Widget fiveStepContent(TalentRegistrationController value){
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 0.08.sw),
          Container(
              width: 2,
              height: value.dropdownPosition == 5 ? 125 : 0,
              color: value.fiveFilled ? const Color.fromRGBO(11, 56, 124, 1)
                  : const Color.fromRGBO(226, 237, 255, 1)
          ),
          value.dropdownPosition == 5 ?  Expanded(flex: 1, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02.sh),
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
                          Expanded(child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Contoh: kolektix@mail.com",
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
              SizedBox(height: 0.02.sh),
              GestureDetector(
                child: Container(
                    width: 140,
                    height: 0.05.sh,
                    padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(11, 56, 124, 1)
                    ),
                    child: Center(
                        child: Text(
                            "Lanjut",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: MyConstant.STR_INTER_BOLD,
                                fontSize: MyConstant.TEXT_14,
                                color: Colors.white
                            )
                        )
                    )
                ),
                onTap: (){
                  Get.to(()=> const EmailVerificationView());
                },
              )
            ],
          )) : SizedBox()
        ]
    );
  }
}