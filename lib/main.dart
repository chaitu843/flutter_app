import 'package:flutter/material.dart';
import 'package:flutter_app/AuthPage/AuthPage.dart';
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
          iconTheme: IconThemeData(color: Colors.white, size: 8.0, opacity: 1.0),
        ),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        bottomAppBarColor: Colors.black,
        buttonTheme: ButtonThemeData(
           buttonColor: Colors.lightBlue,
           disabledColor: Colors.grey,
           layoutBehavior: ButtonBarLayoutBehavior.constrained,
           textTheme: ButtonTextTheme.primary,
        ),
        disabledColor: Colors.grey,
        errorColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.blue, size: 8.0,),
        primaryColor: Colors.blue,
        primaryTextTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'arial',
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontFamily: 'arial'
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(focusColor: Colors.lightBlue,contentPadding: EdgeInsets.all(10.0)),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      // onGenerateRoute: (settings) {
      //   final Map<String, dynamic> arguments = settings.arguments;
      //   switch (settings.name) {
        
      //     default:
      //       return MaterialPageRoute(builder: (context) => )
      //   }

    );
  }
}

