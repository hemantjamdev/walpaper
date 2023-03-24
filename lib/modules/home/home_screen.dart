import 'package:flutter/material.dart';
import 'package:wallpaper/modules/home/home_provider.dart';
import 'package:wallpaper/modules/login/login_screen.dart';
import 'package:wallpaper/modules/splash/splash_screen.dart';
import '../splash/splash_screen.dart';
import 'package:get/get.dart';

import '../wallpaper/wallpaper_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLogin.value ? WallpaperListScreen() : LoginScreen(),
      ),
    );
  }
}
