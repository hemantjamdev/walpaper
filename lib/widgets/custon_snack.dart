import 'package:get/get.dart';

customSnackBar({required String msg}) {
  GetSnackBar snackBar =
      GetSnackBar(duration: const Duration(seconds: 3), message: msg);
  Get.showSnackbar(snackBar);
}
