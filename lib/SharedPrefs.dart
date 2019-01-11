import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class CountWidgetWithPref extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountWidgetWithPref();
}
class _CountWidgetWithPref extends State<CountWidgetWithPref> {
  int count = 0;
  void onPress() {
    getCountPref().then((value) {
      setState(() {
        count = count;
      });
    });
  }
  Future getCountPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.getKeys().contains('count')) {
      prefs.setInt('count', count);
    }
    count = prefs.getInt('count');
    prefs.setInt('count', ++count);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Count Widget'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Number count $count', style: TextStyle(fontSize: 30),),
          RaisedButton(
            child: Text('Add'),
            onPressed: onPress,
            )
        ],
      ) ,
    );
  }
}