import 'package:flutter/material.dart';
import 'order_list.dart';
import 'order_details.dart';

class Order {
  String customer;
  List orderItems;

  Order(this.customer, this.orderItems);
}

Order oasis = Order('Oasis', ['item1', 'item2', 'item3']);
Order digital = Order('Digital', ['item4', 'item5', 'item6']);

Order activeOrder;

class OrderManager extends StatefulWidget {
  @override
  _OrderManagerState createState() {
    return _OrderManagerState();
  }
}

class _OrderManagerState extends State<OrderManager> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('choose first order'),
              onPressed: () {
                setState(() {
                  activeOrder = oasis;
                });
              },
            ),
            RaisedButton(
              child: Text('choose second order'),
              onPressed: () {
                setState(() {
                  activeOrder = digital;
                });
              },
            ),
          ],
        ),
        OrderList(),
        Expanded(
          child: OrderDetails(),
        ),
      ],
    );
  }
}
