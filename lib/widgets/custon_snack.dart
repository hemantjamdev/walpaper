import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

customSnackBar({required String msg}) {
  GetSnackBar snackBar = GetSnackBar(
    margin: EdgeInsets.all(10),
    borderRadius: 15,
    duration: const Duration(seconds: 3),
    messageText: Center(
        child: Text(msg, style: TextStyle(color: Colors.white, fontSize: 18))),
  );
  Get.showSnackbar(snackBar);
}
