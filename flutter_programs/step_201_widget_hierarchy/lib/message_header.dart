import 'package:flutter/material.dart';

class MessageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: <Widget>[
          Text('FROM: Lumbergh'),
          Text('TO: Me'),
          Text('DATE: Today'),
        ],
      ),
    );
  }
}
