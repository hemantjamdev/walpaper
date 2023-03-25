import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar({required String msg}) {
  GetSnackBar snackBar = GetSnackBar(
    duration: Duration(seconds: 3),
    message: msg,
  );
   Get.showSnackbar(snackBar);
}
