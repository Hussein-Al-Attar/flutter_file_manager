import 'package:permission_handler/permission_handler.dart';

class PermissionApp {
  static Future<bool> getStorgePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      await Permission.storage.request();
      return true;
    } else if (status.isLimited) {
      return false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    } else if (status.isRestricted) {
      return false;
    }
    return false;
  }
}
