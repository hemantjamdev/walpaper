import 'dart:async';
import 'package:get/get.dart';
import '../wallpaper/wallpaper_list_screen.dart';

class SplashController extends GetxController {
  goToHomeScreen() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => const WallpaperListScreen());
    });
  }
}
