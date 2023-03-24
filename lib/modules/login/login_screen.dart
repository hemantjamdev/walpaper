import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:wallpaper/modules/login/login_provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller=Get.put(LoginController());
  /*
  Future<void> signInAsGuest() async {
    // Sign in anonymously
    UserCredential userCredential = await _auth.signInAnonymously();
    print('User ${userCredential.user!.uid} signed in as guest');
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () async {
                // Sign in with Google
               // UserCredential userCredential = await signInWithGoogle();
               // print('User ${userCredential.user!.uid} signed in with Google');
                Navigator.pushReplacementNamed(context, '/home');
              },
              icon: Icon(Icons.login),
              label: Text('Sign in with Google'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                // Sign in anonymously
             //   await signInAsGuest();
                Navigator.pushReplacementNamed(context, '/home');
              },
              icon: Icon(Icons.person),
              label: Text('Login as Guest'),
            ),
          ],
        ),
      ),
    );
  }
}
