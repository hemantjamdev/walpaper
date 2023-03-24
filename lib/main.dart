import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/view/splash_page.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(WallpaperApp());
}
class WallpaperApp extends StatelessWidget {
  const WallpaperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
