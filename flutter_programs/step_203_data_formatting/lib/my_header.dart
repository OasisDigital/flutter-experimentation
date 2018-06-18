import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 100.0,
          child: Center(
            child: Text(
              'Name',
              textScaleFactor: 2.0,
            ),
          ),
        ),
        SizedBox(
          width: 85.0,
          child: Center(
            child: Text(
              '# Sold',
              textScaleFactor: 2.0,
            ),
          ),
        ),
        SizedBox(
          width: 104.0,
          child: Center(
            child: Text(
              'Total',
              textScaleFactor: 2.0,
            ),
          ),
        ),
        SizedBox(
          width: 52.0,
          child: Center(
            child: Text(
              '%',
              textScaleFactor: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}