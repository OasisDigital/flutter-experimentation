import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          String myTitle;
          orientation == Orientation.portrait
              ? myTitle = 'Portrait'
              : myTitle = 'Landscape';
          return Scaffold(
            appBar: AppBar(
              title: Text(myTitle),
            ),
            body: GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List<Widget>.generate(99, (index) {
                var random = Random();
                return Container(
                  color: Color.fromRGBO(
                    random.nextInt(255),
                    random.nextInt(255),
                    random.nextInt(255),
                    1.0,
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index+1}',
                      textScaleFactor: 2.0,
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
