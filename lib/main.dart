import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wallpaper/modules/home/home_provider.dart';
import 'package:wallpaper/modules/home/home_screen.dart';
import 'package:wallpaper/modules/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  final homeController = HomeController();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
 // await homeController.checkLogin();
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
