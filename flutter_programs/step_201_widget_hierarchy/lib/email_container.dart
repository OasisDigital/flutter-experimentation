import 'package:flutter/material.dart';
import 'folder_list.dart';
import 'message_display.dart';

class EmailContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        height: 400.0,
        width: 250.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FolderList(),
              SizedBox(
                height: 50.0,
              ),
              MessageDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
