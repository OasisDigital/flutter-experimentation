import 'package:flutter/material.dart';
import 'order_manager.dart';

class OrderHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${activeOrder.customer}', textScaleFactor: 1.3,),
      ),
    );
  }
}
