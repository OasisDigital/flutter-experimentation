import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        ),
        body: new Center(
          child: RaisedButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.pushNamed(context, '/page2');
            },
          ),
        ),
    );
  }
}