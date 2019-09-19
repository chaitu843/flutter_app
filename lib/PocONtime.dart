 Text('$hour:$minute:$second'),

 
  @override
  void initState() {
    super.initState();
     Timer.periodic(Duration(seconds: 1,), (Timer time) {
       int sec = second - 1;
       if(sec==0) {
         setState(() {
          second = 60;
          if(minute != 1) minute = minute-1;
          else {
            minute = 60;
            hour = hour-1;
          }
         });
       } else {
          setState(() {
          second =  second-1;
      });
       }
    });
  }
  static var time = DateTime.now();
  int hour = 1 - time.hour;
  int minute = 60 - time.minute;
  int second = 60 - time.second;