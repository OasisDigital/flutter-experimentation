import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'order_model.dart';

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScopedModelDescendant<OrderModel>(
          builder: (context, _, model) {
            return Container(
              child: Text(
                '${model.activeOrder.customer}',
                textScaleFactor: 1.3,
              ),
            );
          },
        ),
      ),
    );
  }
}