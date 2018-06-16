import 'package:flutter/material.dart';
import 'profile_widget.dart';
import 'loop.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Step 202',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.yellow,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Text('Conditionals'),
              Text('Loops'),
            ],
          ),
          title: Text('Step 202'),
        ),
        body: TabBarView(
          children: [
            ProfileWidget(),
            LoopWidget(),
          ],
        ),
      ),
    );
  }
}
