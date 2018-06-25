import 'package:flutter/material.dart';

void main(){
  String message = '';
  runApp(new MyApp(MyAppState(message)));
}

class MyApp extends StatefulWidget {
  final MyAppState state;

  MyApp(this.state);


  @override createState() {
      return state;
    }
}

class MyAppState extends State<MyApp> {
  String message;

  MyAppState(this.message);

  void clockInEmployee() {
    setState(() {
      message = 'clocked in as employee';
    });
  }

  void clockInManager() {
    setState(() {
      message = 'clocked in as manager';
    });
  }

  void clockOut() {
    setState(() {
      message = 'Have a nice day!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 50.0),
      child:new Column(children: <Widget>[

        new Container(padding: EdgeInsets.only(top: 50.0),
          child: new Text("Hello, John Doe\n$message\nManagers, don't forget to hold the button to clock in!",
            textDirection: TextDirection.ltr)),
        
        new Container(padding: EdgeInsets.only(top: 50.0),
          child: new GestureDetector(
            onLongPress: clockInManager,
            child: new RaisedButton(
              onPressed: clockInEmployee,         
              child: new Text('Clock In (hold if manager)', 
                textDirection: TextDirection.ltr)))),
        
        new Container(padding: EdgeInsets.only(top: 25.0),
          child:new RaisedButton(
            onPressed: clockOut,
            child: new Text('Clock Out', 
              textDirection: TextDirection.ltr))),
    ],));    
  }
}