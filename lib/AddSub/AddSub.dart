import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/AppBar.dart';
import 'package:flutter_app/Utils/Drawer.dart';

import '../routes.dart';

class AddSub extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddSubState();
  }
}

class AddSubState extends State<AddSub> {
  int value;
  String errMsg;
  DateTime date;

  @override
  void initState() {
    super.initState();
    this.setState(() {
      value = 1;
      errMsg = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        drawer: getDrawer(context),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 24.0,
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      if (value == 10)
                        this.setState(() {
                          errMsg = 'Can\'t go more than that';
                        });
                      else
                        this.setState(() {
                          if (value == 0) errMsg = '';
                          value++;
                        });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Text(value.toString()),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.minimize),
                    iconSize: 24.0,
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {
                      if (value == 0)
                        this.setState(() {
                          errMsg = 'Can\'t go less than that';
                        });
                      else
                        this.setState(() {
                          if (value == 10) errMsg = '';
                          value--;
                        });
                    },
                  ),
                ),
              ],
            ),
            errMsg == ''
                ? Text('')
                : Text(
                    errMsg,
                    style: TextStyle(color: Colors.red),
                  ),
            IconButton(
              icon: Icon(Icons.date_range),
              iconSize: 48.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                DateTime currentDate = DateTime.now();
                showDatePicker(
                  context: context,
                  firstDate: currentDate.add(Duration(days: 1)),
                  lastDate: currentDate.add(Duration(days: 5)),
                  initialDate: currentDate.add(Duration(days: 1)),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light(),
                      child: child,
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
