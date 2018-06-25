import 'package:flutter/material.dart';
import 'order_list.dart';
import 'order_details.dart';

class OrderManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OrderList(),
        Expanded(
          child: OrderDetails(),
        ),
      ],
    );
  }
}