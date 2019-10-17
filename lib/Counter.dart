import 'dart:async';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<Counter> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  static var time = DateTime.now();
  int hour, minute, second;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState((){}));
    animationController.forward();
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer time) {
      if (second == 0) {
        setState(() {
          second = 59;
          if (minute != 0)
            minute = minute - 1;
          else {
            minute = 59;
            if (hour != 0)
              hour = hour - 1;
            else
              hour = 23;
          }
        });
      } else {
        setState(() {
          second--;
        });
      }
    });
    DateTime bTime;
    bTime = DateTime(time.year, time.month, time.day, 8, 0);
    List<String> countDown = bTime.difference(time).toString().split(':');
    if (int.parse(countDown[0]) > 0)
      this.setState(() {
        hour = int.parse(countDown[0], radix: 10);
        minute = int.parse(countDown[1], radix: 10);
        second = int.parse(countDown[2].split('.')[0], radix: 10);
      });
    else {
      this.setState(() {
        hour = 23 + int.parse(countDown[0], radix: 10);
        minute = 59 - int.parse(countDown[1], radix: 10);
        second = 59 - int.parse(countDown[2].split('.')[0], radix: 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   margin: EdgeInsets.only(right: 10.0),
        //   child: hour < 10 ? Text('0$hour', style: TextStyle(color: Colors.white),) : Text('$hour', style: TextStyle(color: Colors.white),),
        //   padding: EdgeInsets.all(10.0),
        //   decoration: BoxDecoration(
        //     color: Colors.red
        //   ),
        // ),
        // Text(':'),
        // Container(
        //   margin: EdgeInsets.only(right: 10.0, left:10.0),
        //   child: minute < 10 ? Text('0$minute', style: TextStyle(color: Colors.white),) : Text('$minute', style: TextStyle(color: Colors.white),),
        //   padding: EdgeInsets.all(10.0),
        //   decoration: BoxDecoration(
        //     color: Colors.red
        //   ),
        // ),
        // Text(':'),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Container(
              margin: EdgeInsets.only(left: 10.0),
              height: animation.value * 45.0,
              child: second < 10
                  ? Text(
                      '0$second',
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      '$second',
                      style: TextStyle(color: Colors.white),
                    ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.red),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: second < 10
              ? Text(
                  '0$second',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  '$second',
                  style: TextStyle(color: Colors.white),
                ),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.red),
        )
      ],
    );
  }
}
