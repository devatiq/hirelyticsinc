import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static void launchURL(
      {required String data, required UrlLaunchType type}) async {
    Uri uri;
    if (type == UrlLaunchType.phone) {
      uri = Uri(scheme: 'tel', path: data);
    } else if (type == UrlLaunchType.email) {
      uri = Uri(scheme: 'mailto', path: data);
    } else if (type == UrlLaunchType.maps) {
      final url = _mapUri(latitude: 0, longitude: 0);
      uri = Uri.parse(url);
    } else {
      uri = Uri.parse(data);
    }
    try {
      await launchUrl(uri);
    } catch (e) {
      throw 'Could not launch $data : $e';
    }
  }

  static String _mapUri({required double latitude, required double longitude}) {
    if (Platform.isIOS) {
      return 'maps:$latitude,$longitude?q=$latitude,$longitude';
    } else if (Platform.isAndroid) {
      return 'geo:$latitude,$longitude?q=$latitude,$longitude';
    }
    return '';
  }
}

enum UrlLaunchType { phone, email, maps, url }
