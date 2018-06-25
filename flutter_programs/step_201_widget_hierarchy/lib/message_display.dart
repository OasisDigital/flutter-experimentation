import 'package:flutter/material.dart';
import 'message_header.dart';
import 'message_body.dart';

class MessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: MessageHeader(),
          ),
          SizedBox(
            height: 25.0,
          ),
          Divider(
            color: Colors.black,
          ),
          MessageBody(),
        ],
      ),
    );
  }
}
