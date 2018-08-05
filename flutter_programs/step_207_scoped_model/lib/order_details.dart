import 'package:flutter/material.dart';
import 'order_header.dart';
import 'package:scoped_model/scoped_model.dart';
import 'order_model.dart';
import 'order_items.dart';

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<OrderModel>(
      builder: (context, child, model) {
        return Container(
          width: double.infinity,
          child: model.activeOrder == null
              ? Text(
                  'Please select order to view details',
                  textAlign: TextAlign.center,
                )
              : Card(
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
      },
    );
  }
}
