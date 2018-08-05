import 'package:flutter/material.dart';

class MessageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'From: Someone',
            textScaleFactor: 1.5,
          ),
          Text(
            'To: Me',
            textScaleFactor: 1.5,
          ),
          Text(
            'Date: Today',
            textScaleFactor: 1.5,
          ),
        ],
      ),
    );
  }
}
