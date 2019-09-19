import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Container(color: Theme.of(context).primaryColor, height: 400.0,
            padding: EdgeInsets.only(bottom: 30.0),
            child: Container(child: Text('image'), padding: EdgeInsets.only(bottom: 0.0), decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.brown),)
          ),
        Container(color: Colors.brown, child: Text('container 2'))
        ],);

  }
  
}