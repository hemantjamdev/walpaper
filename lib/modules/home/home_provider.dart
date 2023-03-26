
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeController extends GetxController {
  RxBool isLogin = false.obs;
  GoogleSignIn googleSignIn= GoogleSignIn();
  checkLogin() {
    if(googleSignIn.currentUser!=null){
      isLogin.value =true;
    }else{
      isLogin.value=false;
    }
  }
}
