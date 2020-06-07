import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub_base/src/appbar.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page>
    with TickerProviderStateMixin {
  String screenName();
  bool showLoading();
}

mixin BasicPage<Page extends BasePage> on BaseState<Page> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: BaseAppbar(
            title: screenName(),
          ),
        ),
        body: Stack(
          children: [
            Container(
              child: body(context),
            ),
            showLoading() ? Center(child: CircularProgressIndicator()) : Text("")
          ],
        ));
  }

  Widget body(BuildContext context);
}
