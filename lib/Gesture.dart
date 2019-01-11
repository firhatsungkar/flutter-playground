import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Welcome to Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan,
        brightness: Brightness.light
      ),
      title: 'Learn Padding',
      home: GestureApp(),
      // home: NavigationHomePage(),
    );
  }
}

class GestureApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return GestureDetector(
          child: Scaffold(
            appBar: AppBar(title: Text('Gestures'),),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tap, Long Press, Swipe Horizontally or Vertically '),
                ],
              ),
            ),
          ),
          onTap: () => print('Tapped.'),
          onLongPress: () => print('Long Pressed.'),
          onVerticalDragEnd: (DragEndDetails value) => print('Vertical dragged.'),
          onHorizontalDragEnd: (DragEndDetails value) => print('Horizontal dragged.'),
      );
    }
}