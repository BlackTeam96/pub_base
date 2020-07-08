import 'dart:ui';

import 'package:flutter/material.dart';
import 'src/dashboard.dart';
import 'package:pub_base/pub_base.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
