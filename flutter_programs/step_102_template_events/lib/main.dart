import 'package:flutter/material.dart';

String message = '';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void clockInEmployee() {
    setState(
      () {
        message = 'clocked in as employee';
      },
    );
  }

  void clockInManager() {
    setState(
      () {
        message = 'clocked in as manager';
      },
    );
  }

  void clockOut() {
    setState(
      () {
        message = 'Have a nice day!';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              "Hello, John Doe\n$message\nManagers, don't forget to hold the button to clock in!",
              textDirection: TextDirection.ltr,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: GestureDetector(
              onLongPress: clockInManager,
              child: RaisedButton(
                onPressed: clockInEmployee,
                child: Text(
                  'Clock In (hold if manager)',
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.5,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 25.0),
            child: RaisedButton(
              onPressed: clockOut,
              child: Text(
                'Clock Out',
                textDirection: TextDirection.ltr,
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
