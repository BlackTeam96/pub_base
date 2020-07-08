import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pub_base/pub_base.dart';

class UnderContruction extends BasePage {
  UnderContruction({Key key}) : super(key: key);
  @override
  _UnderContructionState createState() => _UnderContructionState();
}

class _UnderContructionState extends BaseState<UnderContruction>
    with BasicPage {

  @override
  void initState() {
    super.initState();
  }

  @override
  String screenName() => "";

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Under Contruction")
      )
    );
  }

  @override
  bool showLoading() {
    return false;
  }

  @override
  AppBar customAppbar() {
    return null;
  }
}
