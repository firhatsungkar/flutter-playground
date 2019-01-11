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
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => PageA(),
        '/b': (BuildContext context) => PageB(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void navigateTo({page}) {
      print('Navigate to: $page');
      Navigator.of(context).pushNamed('$page');
    }
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome Home.'),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Go to Page A'),
                    onPressed: () => navigateTo(page: '/a'),
                  ),
                  RaisedButton(
                    child: Text('Go to Page B'),
                    onPressed: () => navigateTo(page: '/b'),
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void back() {
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Page A'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page A'),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Go Back'),
                    onPressed: back,
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void back() {
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Page B'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Page B'),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Go Back'),
                    onPressed: back,
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}