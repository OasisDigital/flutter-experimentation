import 'package:flutter/material.dart';
import 'widgets.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'step_106',
      home: MyWidget(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}