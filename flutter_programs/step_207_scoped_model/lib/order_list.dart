import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'order_model.dart';
import 'order_class.dart';


class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: ScopedModelDescendant<OrderModel>(builder: (context, _, model) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose an order',
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    model.changeActiveOrder(oasis);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Order 1: Oasis',
                      style: TextStyle(color: Colors.blue),
                      textScaleFactor: 1.3,
                    ),
                  ),
                ),
              ),
              Card(
                child: new InkWell(
                  onTap: () {
                    model.changeActiveOrder(digital);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Order 2: Digital',
                      style: TextStyle(color: Colors.blue),
                      textScaleFactor: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

