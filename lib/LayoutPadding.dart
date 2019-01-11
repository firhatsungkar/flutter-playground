import 'package:flutter/material.dart';

class LearnPadding extends StatelessWidget {
  final String customText;
  LearnPadding({this.customText: 'Hello there.'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        child: Text(customText, style: Theme.of(context).textTheme.display1,),
      ),
    );
  }
}