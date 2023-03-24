import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar({required String msg}) {
  GetSnackBar snackBar = GetSnackBar(
    message: msg,
  );
  Get.showSnackbar(snackBar);
}
