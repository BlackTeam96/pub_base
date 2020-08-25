import 'dart:async';

import 'package:flutter/services.dart';
export 'src/widget/appbar.dart';
export 'src/base_screen.dart';
export 'package:json_annotation/json_annotation.dart';
export 'src/widget/widget.dart';

class PubBase {
  static const MethodChannel _channel = const MethodChannel('pub_base');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
