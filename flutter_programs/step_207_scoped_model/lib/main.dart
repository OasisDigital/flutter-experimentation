import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'order_manager.dart';
import 'order_model.dart';

void main() => runApp(new MyApp());

class Variables {
  String string = 'hi';
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<OrderModel>(
      model: OrderModel(),
      child: MaterialApp(
        theme: ThemeData(
          buttonColor: Colors.blue,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Order Management Application'),
          ),
          body: Center(
            child: OrderManager(),
          ),
          floatingActionButton: ScopedModelDescendant<OrderModel>(
            builder: (context, child, model) {
              return FloatingActionButton(
                tooltip: 'clear selected order',
                backgroundColor: Colors.red,
                child: Icon(Icons.clear),
                onPressed: model.resetActiveOrder,
              );
            },
          ),
        ),
      ),
    );
  }
}












