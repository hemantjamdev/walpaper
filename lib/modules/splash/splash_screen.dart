import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/constants/colors.dart';
import 'package:wallpaper/modules/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
     controller.goToHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: Center(
          child: Lottie.asset(
            repeat: false,
            "assets/animations/4.json",
            fit: BoxFit.fill,
            height: Get.height * 0.5,
            width: Get.width,
          ),
        ),
      ),
    );
  }
}
