import 'package:flutter/material.dart';

class LayoutContainer extends StatelessWidget {
  final String title = 'Welcome to Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        home: ContainerWithBoxConstraint()
    );
  }
}

class ContainerWithText extends StatelessWidget {
  final String customText;
  ContainerWithText({this.customText: 'Hello there.'});
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Learn Container'),
            ),
            body: Container(
              alignment: Alignment.bottomCenter,
              height: 400,
              color: Colors.teal,
              child: Text(customText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
            )
    );
  }
}
class ContainerWithBoxConstraint extends StatelessWidget {
  final String customText;
  ContainerWithBoxConstraint({this.customText: 'Hello there.'});
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Learn Container With Box Constraint'),
            ),
            body: Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              margin: EdgeInsets.all(12),
              color: Colors.pinkAccent,
              alignment: Alignment.center,
              child: Text(customText, style: Theme.of(context).textTheme.display1.copyWith(color: Colors.purple, fontWeight: FontWeight.bold)),
            )
    );
  }
}
