import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar({required String msg}) {
  GetSnackBar snackBar = GetSnackBar(
    margin: EdgeInsets.all(10),
    borderRadius: 15,
    duration: const Duration(seconds: 2),
    messageText: Center(
        child: Text(msg, style: TextStyle(color: Colors.white, fontSize: 16))),
  );
  Get.showSnackbar(snackBar);
}
