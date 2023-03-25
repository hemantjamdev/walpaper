import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/login/login_provider.dart';
import 'package:wallpaper/modules/wallpaper/wallpaper_list_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            SignInButton(
              Buttons.google,
              onPressed: () {
                controller.signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.anonymous,
              onPressed: () {
                Get.to(() => WallpaperListScreen());
              },
              text: 'Login as Guest',
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
