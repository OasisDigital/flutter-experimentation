import 'package:flutter/material.dart';

class HelpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Help Page',
          textScaleFactor: 2.0,
        ),
        Text('This is the help page.'),
      ],
    );
  }
}
