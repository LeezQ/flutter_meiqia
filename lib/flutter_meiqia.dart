import 'dart:async';

import 'package:flutter/services.dart';

class FlutterMeiqia {
  static const MethodChannel _channel = MethodChannel('flutter_meiqia');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> initMeiQia(String appKey) async {
    final String res =
        await _channel.invokeMethod('initMeiQia', {"appKey": appKey});
    return res;
  }

  static Future<String> openMeiQia(
      {required String id,
      Map<String, String> userInfo = const {},
      bool isUpdate = false}) async {
    final String res = await _channel.invokeMethod(
        'openMeiQia', {"id": id, "userInfo": userInfo, "isUpdate": isUpdate});
    return res;
  }
}
