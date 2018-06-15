import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: new Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
            RaisedButton(
              child: Text('Next'),
              onPressed: () {
                Navigator.pushNamed(context, '/page3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
