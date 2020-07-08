import 'package:flutter/material.dart';
import 'package:pub_base/pub_base.dart';

class NavigatorUtils {
  static void pushToScreen(BasePage page, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => page));
  }
}
