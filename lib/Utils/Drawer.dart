import 'package:flutter/material.dart';

import '../routes.dart';

void drawerCallback(context, value) {
  switch (value) {
    case 'My Account':
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(Routes.ACCOUNT_PAGE);
      break;
    case 'Add/Sub':
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(Routes.ADD_SUB_PAGE);
      break;
    case 'Sign Out':
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Are you sure you want to Sign Out?'),
              backgroundColor: Colors.white,
              contentPadding:
                  EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              actions: <Widget>[
                FlatButton(
                  child: Text('SIGN OUT'),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.AUTH_PAGE, (Route route) {
                      if (route == null) return true;
                      return false;
                    });
                  },
                ),
                FlatButton(
                  child: Text('GO BACK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      break;
    default:
      Navigator.of(context).pop();
  }
}

Drawer getDrawer(context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(
            'chaitanyareddy843@gmail.com',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 12.0,
            ),
          ),
          accountName: Text(
            'Chaitanya',
            style: TextStyle(
              fontFamily: 'Nunito Bold',
              fontSize: 18.0,
            ),
          ),
          // currentAccountPicture: CircleAvatar(child: Image.asset('assets/logo/256x256.jpg'),),
          onDetailsPressed: null,
        ),
        ListTile(
            enabled: true,
            title: Text('My Account', style: TextStyle()),
            onTap: () {
              drawerCallback(context, 'My Account');
            }),
        ListTile(
          enabled: false,
          title: Text('Payments', style: TextStyle()),
        ),
        ListTile(
          enabled: false,
          title: Text('History', style: TextStyle()),
        ),
        ListTile(
          enabled: true,
          title: Text('Add/Sub', style: TextStyle()),
          onTap: () {
            drawerCallback(context, 'Add/Sub');
          },
        ),
        ListTile(
          enabled: true,
          title: Text('Sign Out', style: TextStyle()),
          onTap: () {
            drawerCallback(context, 'Sign Out');
          },
        )
      ],
    ),
  );
}
