import 'package:flutter/material.dart';
import 'dart:async';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key, this.title : 'Stateful Widget'}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _MyStatefulWidget();
}
class _MyStatefulWidget extends State<MyStatefulWidget> {
  bool showText = true;
  bool toggleState = true;
  Timer t2;
  void toggleBlinkState() {
    setState(() {
      toggleState = !toggleState;
    });
    if (toggleState == false) {
      var duration = const Duration(milliseconds: 500);
      t2 = Timer.periodic(duration, (Timer t) {
        toggleShowText();
      });
    } else {
      t2.cancel();
    }
  }
  void toggleShowText() {
    setState(() {
      showText = !showText;
    });
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: SafeArea(
          child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (showText
                ? (Text('This execution will be done before you can blink.')) 
                : (Container())
              ), // Show text or not
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: RaisedButton(
                  onPressed: toggleBlinkState,
                  child: (
                    toggleState
                    ? (Text('Blink'))
                    : (Text('Stop Blinking'))
                  ),
                ),
              )
            ],
          ),
        ),
        )     );
    }
}