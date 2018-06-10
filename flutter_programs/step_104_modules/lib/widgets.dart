import 'package:flutter/widgets.dart';

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

class HRWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xFF1B5682),
      padding: EdgeInsets.all(50.0,),
      child: new Column(children: <Widget>[
        new Text('HR Functionality', textDirection: TextDirection.ltr),
        new SearchWidget()
    ]));
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      color: Color(0xFFF3F9D2),
      child: new Text('search box',
        style: new TextStyle(color: Color(0xFF000000)),
        textDirection: TextDirection.ltr,),
    );
  }
}