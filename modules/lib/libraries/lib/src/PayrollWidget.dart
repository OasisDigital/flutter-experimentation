import 'package:flutter/widgets.dart';
import 'SearchWidget.dart';

class PayrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xFF1B5682),
      padding: EdgeInsets.all(50.0),
      child: new Column(children: <Widget>[
        new Text('Payroll Functionality', textDirection: TextDirection.ltr),
        new SearchWidget()
      ]));
  }
}