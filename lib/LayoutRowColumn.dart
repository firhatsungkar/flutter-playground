import 'package:flutter/material.dart';

class ColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(color: Colors.red, width: 100, height: 100,),
        Container(color: Colors.green, width: 100, height: 100,),
        Container(color: Colors.blue, width: 100, height: 100,),
      ],
    );
  }
}

class RowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(color: Colors.red, width: 100, height: 100,),
        Container(color: Colors.green, width: 100, height: 100,),
        Container(color: Colors.blue, width: 100, height: 100,),
      ],
    );
  }
}