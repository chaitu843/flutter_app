import 'package:flutter/material.dart';
import 'package:flutter_app/AddSub/AddSub.dart';
import 'package:flutter_app/AuthPage/AuthPage.dart';
import 'package:flutter_app/HomePage/HomePage.dart';
import 'package:flutter_app/MyAccountPage/MyAccountPage.dart';
import 'package:flutter_app/Utils/ThemeData.dart';
import 'package:flutter_app/routes.dart';
// import 'package:flutter_app/AuthPage/AuthPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dodhi',
        theme: getThemeData(),
        debugShowCheckedModeBanner: false,
        home: AddSub(true),
        onGenerateRoute: (settings) {
          final Map<String, dynamic> arguments = settings.arguments;
          switch (settings.name) {
            case Routes.HOME_PAGE:
              return MaterialPageRoute(builder: (context) => HomePage());
            case Routes.ACCOUNT_PAGE:
              return MaterialPageRoute(builder: (context) => MyAccountPage());
            case Routes.ADD_SUB_PAGE:
              return MaterialPageRoute(builder: (context) => AddSub(false));
            default:
              return MaterialPageRoute(builder: (context) => AuthPage());
          }
        });
  }
}
