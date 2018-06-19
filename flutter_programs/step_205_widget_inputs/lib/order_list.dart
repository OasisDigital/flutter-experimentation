import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose an order using buttons above',
                textScaleFactor: 2.0,
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Order 1: Oasis'),
              ),
            ),
            Card(
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Order 2: Digital'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
