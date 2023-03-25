import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHelper {
  static bool isUserLoggedIn() {
    GoogleSignIn googleSignIn = GoogleSignIn();
    return googleSignIn.currentUser != null ? true : false;
  }
}