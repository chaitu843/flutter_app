import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/AppBar.dart';
import 'package:flutter_app/Utils/Drawer.dart';

class AddSub extends StatefulWidget {
  final bool daily;

  const AddSub(this.daily);

  @override
  State<StatefulWidget> createState() {
    return AddSubState();
  }
}

class AddSubState extends State<AddSub> {
  int value;
  String errMsg;
  DateTime selectedDate;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
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
                SizedBox(
                  height: 15.0,
                ),
                errMsg == ''
                    ? Text('')
                    : Text(
                        errMsg,
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      ),
              ],
            ),
            this.widget.daily
                ? Column(
                    children: <Widget>[
                      Text(
                        'Updating your Daily Quota',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 15.0,),
                      FlatButton(
                        child: Text('Update'),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
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
                          ).then((dateSelected) {
                            if (dateSelected != null)
                              this.setState(() {
                                selectedDate = dateSelected;
                              });
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        this.selectedDate == null
                            ? 'Pick the Date'
                            : 'You selected: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: TextStyle(
                            fontFamily: 'Nunito Bold',
                            fontSize: 24.0,
                            wordSpacing: 5.0,
                            letterSpacing: 2.0),
                      ),
                      SizedBox(height: 15.0,),
                      FlatButton(
                        child: Text('Update'),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ],
                  ),
          ],
        ));
  }
}
