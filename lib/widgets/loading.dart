import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

customLoading(bool load) {
  if (load) {
    Get.defaultDialog(
        backgroundColor: Colors.transparent,
        titlePadding: EdgeInsets.zero,
        title: "",
        contentPadding: EdgeInsets.symmetric(horizontal: 80),
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
        barrierDismissible: false);
  } else {
    Get.isDialogOpen! ? Get.back() : null;
  }
}
