import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallpaper/widgets/custon_toast.dart';

class FirebaseHelper {
   User? checkUserLoggedIn() {
    User? user;
    try {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        customSnackBar(msg: "login successful");
      } else if (user == null) {
        customSnackBar(msg: "last session expired");
      } else {
        customSnackBar(msg: "something went wrong ! please try again");
      }
    } catch (e) {
      customSnackBar(msg: "something went wrong ! ${e.toString()}");
    }
    return user;
  }
}
