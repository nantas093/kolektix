import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kolektix/app/constants/my_constants.dart';

class CustomToast{
  static showToast(String message, BuildContext context){
    var fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      width: double.maxFinite.w,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromRGBO(243, 14, 14, 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(MyConstant.IC_OCTAGON),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(flex: 1, child: Text(
              message,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: MyConstant.STR_INTER_REGULAR,
                  fontSize: MyConstant.TEXT_14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              )
          ))
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  static showSuccessToast(String message, BuildContext context){
    var fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      width: double.maxFinite.w,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(MyConstant.IC_OCTAGON),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(flex: 1, child: Text(
              message,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: MyConstant.STR_INTER_REGULAR,
                  fontSize: MyConstant.TEXT_14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              )
          ))
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}