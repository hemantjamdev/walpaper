import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper/widgets/custon_toast.dart';

import '../modules/profile/user_model.dart';

class FirebaseHelper {
  static bool checkUserLoggedIn() {
    User? user;
    try {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        log('------ user already logged in -- this is user = ${user.displayName}');
        return true;
      }else{
        log('------>user not logged in<------');

      }
    } catch (e) {
      customSnackBar(msg: "something went wrong ! ${e.toString()}");
    }
    return false;
  }

  static newUserCreate(GoogleSignInAccount user) async {
    UserModel newUser = UserModel(
        uid: user.id, name: user.displayName, profilePic: user.photoUrl);
    FirebaseFirestore.instance
        .collection("users")
        .doc(newUser.uid)
        .set(newUser.toMap());
    log('------new user createdd-------');
  }

  static getUserById() {}
}
