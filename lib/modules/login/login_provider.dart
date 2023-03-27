
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper/utils/firebase_helper.dart';
import 'package:wallpaper/widgets/custon_snack.dart';

class LoginController extends GetxController {
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