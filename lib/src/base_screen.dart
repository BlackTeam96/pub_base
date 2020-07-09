import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub_base/src/widget/appbar.dart';
import 'package:pub_base/src/widget/widget.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page>
    with TickerProviderStateMixin {
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
          child:  appBar(context),
        ),
        body: Stack(
          children: [
            Container(
              child: body(context),
            ),
            showLoading() ? Center(child: CircularProgressIndicator()) : Empty()
          ],
        ));
  }

  Widget appBar(BuildContext context) {
    return BaseAppbar(title: "test",);
  }
  Widget body(BuildContext context);
  Widget progress(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
  
}
