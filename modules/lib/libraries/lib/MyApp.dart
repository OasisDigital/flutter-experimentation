import 'package:flutter/widgets.dart';
import 'MyWidgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Container(
        child: PayrollWidget(),
        padding: EdgeInsets.only(bottom: 25.0),),
      new Container(
        child: HRWidget(),
        padding: EdgeInsets.only(bottom: 25.0),)
    ]);
  }
}