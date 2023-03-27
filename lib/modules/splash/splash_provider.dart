import 'dart:async';

import 'package:get/get.dart';
import 'package:wallpaper/modules/home/home_screen.dart';

class SplashController extends GetxController {
  goToHomeScreen() {
    Timer(const Duration(seconds: 2), () {
      Get.to(const HomeScreen());
    });
  }
}
