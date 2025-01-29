import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionHelper {
  static Future<bool> storagePermissionHandler() async {
    // if (Platform.isAndroid) {
    //   if (!((await Permission.storage.request()).isGranted)) {
    //     return false;
    //   }
    // } else if (Platform.isIOS) {
    //   if (!await Permission.storage.request().isGranted) {
    //     return false;
    //   }
    // }
    // return true;

    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        if (!((await Permission.photos.request()).isGranted)) {
          return false;
        }
        if (!((await Permission.audio.request()).isGranted)) {
          return false;
        }

        if (!((await Permission.videos.request()).isGranted)) {
          return false;
        }
      } else {
        if (!((await Permission.storage.request()).isGranted)) {
          return false;
        }
      }
    } else if (Platform.isIOS) {
      if (!await Permission.storage.request().isGranted) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> imagePermissionHandler() async {
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        if (!((await Permission.photos.request()).isGranted)) {
          return false;
        }
        if (!((await Permission.audio.request()).isGranted)) {
          return false;
        }

        if (!((await Permission.videos.request()).isGranted)) {
          return false;
        }
      } else {
        if (!((await Permission.storage.request()).isGranted)) {
          return false;
        }
      }
    } else if (Platform.isIOS) {
      if (!await Permission.storage.request().isGranted) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> microphonePermissionHandler() async {
    if (!(await Permission.microphone.request().isGranted)) {
      return false;
    }
    if (Platform.isIOS) {
      if (!await Permission.speech.request().isGranted) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> notificationPermissionHandler() async {
    return await Permission.notification.request().isGranted;
  }



  static Future<bool> hasWhenInUseLocationPermission(
      {bool requestIfNotGranted = false}) async {
    bool hasPermission = false;
    if (requestIfNotGranted) {
      final result = await Permission.locationWhenInUse.request();
      hasPermission = result.isGranted;
    } else {
      hasPermission = await Permission.locationWhenInUse.isGranted;
    }

    return hasPermission;
  }



  static Future<bool> hasAlwaysLocationPermission(
      {bool request = false}) async {
    if (request) {
      final result = await Permission.locationAlways.request();
      return result.isGranted;
    } else {
      return await Permission.locationAlways.isGranted;
    }
  }
}
