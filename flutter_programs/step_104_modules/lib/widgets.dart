import 'package:flutter/widgets.dart';

class PayrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1B5682),
      padding: EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text('Payroll Functionality', textDirection: TextDirection.ltr),
          SearchWidget()
        ],
      ),
    );
  }
}

class HRWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1B5682),
      padding: EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text('HR Functionality', textDirection: TextDirection.ltr),
          SearchWidget()
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Color(0xFFF3F9D2),
      child: Text(
        'search box',
        style: TextStyle(color: Color(0xFF000000)),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
