import 'package:flutter/material.dart';
import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonColor: Colors.blue,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: {
        '/page1': (BuildContext context) => new Page1(),
        '/page2': (BuildContext context) => new Page2(),
        '/page3': (BuildContext context) => new Page3()
      },
      home: Page1(),
    );
  }
}
