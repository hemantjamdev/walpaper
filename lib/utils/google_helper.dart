import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHelper {
  static bool isUserLoggedIn() {
    GoogleSignIn googleSignIn = GoogleSignIn();
    return googleSignIn.currentUser != null ? true : false;
  }
}
/*

static User? checkUserLoggedIn
() {

User? user;try {
user = FirebaseAuth.instance.currentUser;
if (user != null) {
customSnackBar(msg: "login successful");
} else if (user == null) {
customSnackBar(msg: "last session expired");
} else {
customSnackBar(msg: "something went wrong ! please try again");
}
} catch
(
e) {
customSnackBar(msg: "something went wrong ! ${e.toString()}");
}
return
user;
}*/
