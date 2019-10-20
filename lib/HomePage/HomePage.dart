import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/AppBar.dart';
import 'package:flutter_app/Utils/Drawer.dart';
import 'package:flutter_app/routes.dart';

import './Counter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      drawer: getDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You can expect your delivery in'),
            SizedBox(
              height: 30.0,
            ),
            Counter(),
            SizedBox(
              height: 80.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: InkWell(
                onLongPress: () {
                  // Will redirect to ADD/SUB page with option set as a daily
                },
                child: Column(
                  children: <Widget>[
                    Text('3', style: Theme.of(context).textTheme.display1),
                    Text('units', style: Theme.of(context).textTheme.display2)
                  ],
                ),
              ),
            ),
            Text('Long Tap to Update'),
          ],
        ),
      ),
    );
  }
}
