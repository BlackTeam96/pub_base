
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
    // final parser = ParserData();
    // final rep = TestRepository("http://dummy.restapiexample.com", {"":""}, parser);
    // print(rep.fetchMovieList());
  }

  @override
  Widget body(BuildContext context) {
    return Center(child: Text("This is a basic usage of a mixin", style: Theme.of(context).textTheme.body1,));
  }

  @override
  bool showLoading() {
    return false;
  }

  @override
  Widget appBar(BuildContext context) {
    return super.appBar(context);
  }

  @override
  Widget progress(BuildContext context) {
    return super.progress(context);
  }
}