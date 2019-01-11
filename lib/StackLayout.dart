import 'package:flutter/material.dart';

class StackLayout extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    var fontStyle = Theme.of(context)
                      .textTheme.display1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      );
      return Stack(
        alignment: const Alignment(0.6, 0.6),
        // alignment: Alignment.bottomCenter,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://avatars3.githubusercontent.com/u/14101776?v=4'
            ),
            maxRadius: 150
          ),
          Container(
            padding: EdgeInsets.all(4),
            child: Text('Flutter Awesome.', style: fontStyle), 
            decoration: BoxDecoration(color: Colors.black45),
          )
        ],
      );
    }
}
