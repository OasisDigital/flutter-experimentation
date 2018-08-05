import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(),
      child: new Column(
        children: <Widget>[
          Text(
            'Message',
            textScaleFactor: 2.0,
            textAlign: TextAlign.center,
          ),
          Text(
            'Hi,\nThis is Someone and this is an email.\nBye',
            textAlign: TextAlign.left,
            textScaleFactor: 1.5,
          ),
        ],
      ),
    );
  }
}
