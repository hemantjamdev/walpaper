import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/home/home_screen.dart';

class SplashController extends GetxController {
  goToHomeScreen() {
    Timer(Duration(seconds: 5), () {
      Get.to(HomeScreen());
    });
  }
}
