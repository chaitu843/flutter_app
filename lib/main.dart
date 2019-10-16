import 'package:flutter/material.dart';
import 'package:flutter_app/AuthPage/AuthPage.dart';
import 'package:flutter_app/HomePage/HomePage.dart';
import 'package:flutter_app/MyAccountPage/MyAccountPage.dart';
import 'package:flutter_app/routes.dart';
// import 'package:flutter_app/AuthPage/AuthPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dodhi',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.lightBlue,
            elevation: 5.0,
            iconTheme:
                IconThemeData(color: Colors.white, size: 8.0, opacity: 1.0),
          ),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          dialogBackgroundColor: Colors.black45,
          bottomAppBarColor: Colors.black,
          buttonColor: Colors.blue,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue,
            disabledColor: Colors.grey,
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            textTheme: ButtonTextTheme.primary,
          ),
          disabledColor: Colors.grey,
          errorColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.blue,
            size: 8.0,
          ),
          primaryColor: Colors.blue,
          textTheme: TextTheme(
            display1: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Nunito',
            ),
            display2: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: 'Nunito',
            ),
            body1: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Nunito Bold',
            ),
            body2: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Nunito',
            ),
            button: TextStyle(color: Colors.white, fontFamily: 'Nunito Bold'),
          ),
          inputDecorationTheme: InputDecorationTheme(
              focusColor: Colors.lightBlue,
              contentPadding: EdgeInsets.all(10.0)),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        onGenerateRoute: (settings) {
          final Map<String, dynamic> arguments = settings.arguments;
          switch (settings.name) {
            case Routes.HOME_PAGE:
              return MaterialPageRoute(builder: (context) => HomePage());
            case Routes.ACCOUNT_PAGE:
              return MaterialPageRoute(builder: (context) => MyAccountPage());
            default:
              return MaterialPageRoute(builder: (context) => AuthPage());
          }
        });
  }
}
