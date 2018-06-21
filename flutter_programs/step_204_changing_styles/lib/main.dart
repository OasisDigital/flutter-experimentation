import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

Color myColor = Colors.black;
double myWidth = 175.0;
double myHeight = 175.0;
double myFontSize = 2.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Changing Styles'),
        ),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('blue'),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  myColor = Colors.blue;
                });
              },
            ),
            RaisedButton(
              child: Text('red'),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  myColor = Colors.red;
                });
              },
            ),
            RaisedButton(
              child: Text('green'),
              color: Colors.green,
              onPressed: () {
                setState(() {
                  myColor = Colors.green;
                });
              },
            )
          ],
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('small font'),
              onPressed: () {
                setState(() {
                  myFontSize = 1.0;
                });
              },
            ),
            RaisedButton(
              child: Text('normal font'),
              onPressed: () {
                setState(() {
                  myFontSize = 2.0;
                });
              },
            ),
            RaisedButton(
              child: Text('big font'),
              onPressed: () {
                setState(() {
                  myFontSize = 3.0;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'set width',
          textScaleFactor: 2.0,
        ),
        Slider(
          value: myWidth,
          onChanged: (double value) {
            setState(() {
              myWidth = value;
            });
          },
          min: 0.0,
          max: 350.0,
        ),
        SizedBox(
          height: 25.0,
        ),
        Container(
          color: myColor,
          width: myWidth,
          height: myHeight,
          child: Center(
            child: Text(
              'Hello!',
              textScaleFactor: myFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
