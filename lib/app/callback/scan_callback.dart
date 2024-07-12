import 'package:flutter/cupertino.dart';

abstract class ScanCallback{
  void success(Map data, BuildContext context);
  void failed(Map data, BuildContext context);
}