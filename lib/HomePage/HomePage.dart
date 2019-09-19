import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }  
}

class HomePageState extends State<HomePage> {

  void drawerCallback(context, value) {
    switch (value) {
      case 'My Account':
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(Routes.ACCOUNT_PAGE);
        break;
      default:
        Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('Dodhi', style: TextStyle(fontFamily: 'Nunito Bold', fontStyle: FontStyle.italic),), 
          onTap:(){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.HOME_PAGE, (Route route) => route.settings.name == Routes.HOME_PAGE);
          }
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('chaitanyareddy843@gmail.com', style: TextStyle(fontFamily: 'Nunito', fontSize: 12.0,),),
              accountName: Text('Chaitanya', style: TextStyle(fontFamily: 'Nunito Bold', fontSize: 18.0,),),
              // currentAccountPicture: CircleAvatar(child: Image.asset('assets/logo/256x256.jpg'),),
              onDetailsPressed: null,
            ),
            ListTile(
              enabled: true,
              title: Text('My Account', style : TextStyle()),
              onTap: () {
                  drawerCallback(context, 'My Account');
              }
            ),
             ListTile(
              enabled: false,
              title: Text('Payments', style : TextStyle()),
            ),
             ListTile(
              enabled: false,
              title: Text('History', style : TextStyle()),
            ),
             ListTile(
              enabled: false,
              title: Text('Add/Sub', style : TextStyle()),
            ),
             ListTile(
              enabled: false,
              title: Text('Sign Out', style : TextStyle()),
            )
          ],
        ),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor, ),
            child: InkWell(
              onLongPress: () {
               // Will redirect to ADD/SUB page with option set as a daily
              },
              child: Column(children: <Widget>[
              Text('3', style: Theme.of(context).textTheme.display1), 
              Text('units', style: Theme.of(context).textTheme.display2)],),
            ),
            ),
          Text('Long Tap to Update')
        ],
      ),
      ),

    );
  }
}

