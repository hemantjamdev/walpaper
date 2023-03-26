import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/splash/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.orange, Colors.white],
          ),
        ),
        child: Center(
          child: Lottie.asset(
            repeat: false,
            "assets/animations/splash.json",
            fit: BoxFit.fill,
            height: Get.height * 0.5,
            width: Get.width,
          ),
        ),
      ),
    );
  }
}
