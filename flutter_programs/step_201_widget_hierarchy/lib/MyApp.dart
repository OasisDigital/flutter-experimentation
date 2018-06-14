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
          centerTitle: true,
          title: Text(
            'step_201_widget_hierarchy',
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            MessageDisplay(),
            HelpWidget(),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(
                'Folders',
                textScaleFactor: 2.5,
              ),
              SizedBox(
                height: 10.0,
              ),
              FolderList(),
            ],
          ),
        ),
      ),
    );
  }
}
