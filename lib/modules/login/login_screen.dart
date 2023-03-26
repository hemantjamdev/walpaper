import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/login/login_provider.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_list_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Image.asset(
             fit:BoxFit.contain ,
              'assets/images/login.jpg'),
            const SizedBox(height: 50),
            SignInButton(
              Buttons.google,
              onPressed: () {
                controller.signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.anonymous,
              onPressed: () {
                Get.to(() => const WallpaperListScreen());
              },
              text: 'Login as Guest',
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
