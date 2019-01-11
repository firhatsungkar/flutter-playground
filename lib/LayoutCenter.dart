import 'package:flutter/material.dart';

class LayoutCenter extends StatelessWidget {
  final String customText;
  LayoutCenter({this.customText: 'Hello there.'});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(customText, style: Theme.of(context).textTheme.display1,),
    );
  }
}
