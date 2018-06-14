import 'package:flutter/material.dart';
import 'folder_item.dart';

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      child: ListBody(
        children: <Widget>[
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
          SizedBox(height: 2.0),
          FolderItem(),
        ],
      ),
    );
  }
}
