import 'package:flutter/material.dart';

class MessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Text(
        'Hi,\nThis is Lumbergh.\nBye',
        textAlign: TextAlign.center,
      ),
    );
  }
}
