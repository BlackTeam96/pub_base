
import 'package:flutter/material.dart';
import 'package:pub_base/pub_base.dart';
import 'package:pub_base_example/src/repository/api_parse.dart';
import 'package:pub_base_example/src/repository/repository.dart';

class Dashboard extends BasePage {
  Dashboard({Key key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends BaseState<Dashboard> with BasicPage{

  @override
  void initState() {
    super.initState();
    final parser = ParserData();
    final rep = TestRepository("url here", {"":""}, parser);
    print(rep.getBaseUrl());
  }

  @override
  String screenName() => "Dashboard";

  @override
  Widget body(BuildContext context) {
    return Center(child: Text("This is a basic usage of a mixin"));
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