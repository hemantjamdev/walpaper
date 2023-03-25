import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper/modules/profile/user_model.dart';
import 'package:wallpaper/utils/firebase_helper.dart';
import 'package:wallpaper/widgets/custon_toast.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  signOut() {
    if (googleSignIn.currentUser != null) {
      customSnackBar(msg: 'User Found and Logged Out');
      googleSignIn.signOut();
    } else {
      customSnackBar(msg: 'user not found');
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user != null) {
        FirebaseHelper.newUserCreate(user);
      } else {
        customSnackBar(msg: 'please choose google account to sign in');
        return;
      }
    } catch (e) {
      customSnackBar(msg: e.toString());
    }
  }
}

// Obtain the auth details from the request
// final GoogleSignInAuthentication googleSignInAuthentication =
//   await user!.authentication;

/*// Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
log("---< credential s---${credential}----");
    // Once signed in, return the UserCredential*/
// return await _auth.signInWithCredential(credential);
