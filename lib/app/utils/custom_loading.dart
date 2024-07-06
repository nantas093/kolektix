import 'package:flutter/material.dart';

class CustomLoading {
  static showLoadingDialog(con,messsage) {
    AlertDialog alert = AlertDialog(
      content: Row(children: [
        const CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
        Container(
            margin: const EdgeInsets.only(left: 24.0), child: Text(messsage)),
      ]),
    );

    showDialog(
      barrierDismissible: false,
      context: con,
      builder: (BuildContext _con) {
        return alert;
      },
    );
  }
}