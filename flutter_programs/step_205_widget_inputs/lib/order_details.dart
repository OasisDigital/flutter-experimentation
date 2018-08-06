import 'package:flutter/material.dart';
import 'order_header.dart';
import 'order_items.dart';
import 'order_manager.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (activeOrder == null) {
      return Text('Please select order to view details');
    } else {
      return Container(
        width: double.infinity,
        child: Card(
          child: Column(
            children: <Widget>[
              Text(
                'Details',
                textScaleFactor: 2.0,
              ),
              OrderHeader(),
              Card(
                child: OrderItems(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
