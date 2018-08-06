import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: AppBar(
          title: new Text('step_106_tabs'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              new Text('Payroll'),
              new Text('HR'),
            ],
            ),
        ),
      ),
      body: TabBarView(
        children: [
          PayrollWidget(),
          HRWidget(),
        ],
    ),
    );
    
  }
}

class PayrollWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100.0,
      width: 100.0,
      padding: EdgeInsets.all(50.0),
      child: new Column(
        children: <Widget>[
          new Text(
            'Payroll Functionality',
            textDirection: TextDirection.ltr,
            textScaleFactor: 2.0,
          ),
        ],
      ),
      );
  }
}

class HRWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container( 
      child: new TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'search',
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}