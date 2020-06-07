import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget {
  final String title;
  BaseAppbar(
      {this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(this.title, textAlign: TextAlign.left,),
    );
  }
}
