import 'package:flutter/material.dart';
import 'message_display.dart';
import 'help.dart';
import 'folder_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[Icon(Icons.search)],
          bottom: TabBar(
            tabs: <Widget>[
              Text('Email'),
              Text('Help'),
            ],
          ),
          title: Text('step_201_widget_hierarchy'),
        ),
        body: new TabBarView(
          children: <Widget>[
            MessageDisplay(),
            HelpWidget(),
          ],
        ),
        drawer: FolderList(),
      ),
    );
  }
}
