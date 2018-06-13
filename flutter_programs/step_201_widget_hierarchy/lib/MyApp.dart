import 'package:flutter/material.dart';
import 'email_container.dart';
import 'help.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Text('Email'),
                Text('Help'),
              ],
            ),
            centerTitle: true,
            title: Text(
              'step_201_widget_hierarchy',
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              EmailContainer(),
              HelpWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
