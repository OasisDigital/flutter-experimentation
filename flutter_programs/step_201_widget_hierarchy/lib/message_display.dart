import 'package:flutter/material.dart';
import 'message_header.dart';
import 'message_body.dart';

class MessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: <Widget>[
          MessageHeader(),
          SizedBox(
            height: 25.0,
          ),
          MessageBody(),
        ],
      ),
    );
  }
}
