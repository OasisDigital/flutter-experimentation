import 'package:flutter/material.dart';
import 'my_header.dart';
import 'my_list_view.dart';

import 'package:date_format/date_format.dart';

void main() => runApp(new MyApp());

DateTime date = DateTime(2058, 12, 25);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'step 203',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sales Report: ' + formatDate(date, [MM, ' ', d, ', ', yyyy]),
          ),
        ),
        body: new Column(
          children: <Widget>[
            MyHeader(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 455.0,
              child: MyListView(),
            ),
          ],
        ),
      ),
    );
  }
}
