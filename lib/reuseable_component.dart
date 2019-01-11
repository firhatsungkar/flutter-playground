import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Welcome to Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: 11,
            padding: EdgeInsets.all(6),
            itemBuilder: (BuildContext context, int i) {
              final index = i + 1;
              return CustomCard(index: index, onPress: () => print('$index pressed'),);
            },
          )
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final index;
  final Function onPress;
  CustomCard({@required this.index, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text('Card $index'),
          FlatButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            child: const Text('Press'),
            onPressed: this.onPress,
          )
        ],
      ),
    );
  }
}