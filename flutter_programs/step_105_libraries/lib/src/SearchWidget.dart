import 'package:flutter/widgets.dart';

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