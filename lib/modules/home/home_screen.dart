import 'package:flutter/material.dart';
import 'package:wallpaper/modules/home/home_provider.dart';
import 'package:wallpaper/modules/login/login_screen.dart';
import 'package:get/get.dart';

import '../wallpaper/wallpaper_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    controller.checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLogin.value ? const WallpaperListScreen() : const LoginScreen(),
      ),
    );
  }
}
