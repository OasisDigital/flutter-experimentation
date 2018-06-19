import 'package:flutter/material.dart';
import 'order_manager.dart';

class OrderItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Order Items',
          textScaleFactor: 2.0,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${activeOrder.orderItems[0]}',
              textScaleFactor: 1.3,
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${activeOrder.orderItems[1]}',
              textScaleFactor: 1.3,
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${activeOrder.orderItems[2]}',
              textScaleFactor: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
