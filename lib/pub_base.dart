import 'dart:async';

import 'package:flutter/services.dart';

class PubBase {
  static const MethodChannel _channel =
      const MethodChannel('pub_base');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
