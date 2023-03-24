import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/firebase_helper.dart';

class HomeController extends GetxController {
  RxBool isLogin = false.obs;
  final fbHelper = FirebaseHelper();

 void checkLogin() {
    User? user = fbHelper.checkUserLoggedIn();
    if (user != null) {
      isLogin.value = true;
    }
  }
}
