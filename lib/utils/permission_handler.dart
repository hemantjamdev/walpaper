import 'package:permission_handler/permission_handler.dart';

class Permissions {
  static Future<bool> getPermission() async {
    if (await Permission.storage.isGranted) {
      return true;
    } else {
      PermissionStatus status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
