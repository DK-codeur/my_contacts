import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_contacts/utils/my_colors.dart';

class Methods {

  static void customToast(String msg, {Color color = MyColors.black}) {
    Fluttertoast.showToast(
      msg: msg.toString(),
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
    );
  }

}
