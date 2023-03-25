import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper/utils/google_helper.dart';

import '../../utils/firebase_helper.dart';

class HomeController extends GetxController {
  RxBool isLogin = false.obs;
  GoogleSignIn googleSignIn= GoogleSignIn();
  checkLogin() {
    if(googleSignIn.currentUser!=null){
      log('------> user found in home provider<--------');
      isLogin.value =true;
      log('-----value of isLogin = $isLogin<------');
    }else{
      log('------> user not in home provider<--------');
      isLogin.value=false;
      log('-----value of isLogin = $isLogin<------');
    }
  }
}
