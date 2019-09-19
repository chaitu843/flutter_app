import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      child: Stack(
        children: <Widget>[
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/4,
            alignment: Alignment.center,
            margin: EdgeInsets.all(70.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor),
            child: Icon(
              Icons.add_a_photo,
              size: 108.0,
              color: Colors.lightBlue,
            ),
          ),
          Expanded(child : Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Flexible(
                      child: Text(
                        'Chaitanya',
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Email Id',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Flexible(
                      child: Text(
                        'chaitanyareddy843@gmail.com',
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  runSpacing: 5.0,
                  children: <Widget>[
                    Text(
                      'Address',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Text(
                        'B214, Adithya Esquina, Sorahunese Main Road, Varthur, Bangalore - 560087',
                        style: Theme.of(context).textTheme.body2,
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Phone No.',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Flexible(
                      child: Text(
                        '8500369646',
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),)
        ],
      ),
      Positioned(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).backgroundColor),
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_back, size: 30.0,),
        ),
        ),
        top: 30.0,
        left: 10.0,
      )
        ],
      )
    );
  }
}
