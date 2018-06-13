import 'package:flutter/material.dart';
import 'folder_item.dart';

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: <Widget>[
          FolderItem(),
          FolderItem(),
          FolderItem(),
          FolderItem(),
          FolderItem(),
          FolderItem(),
          FolderItem(),
        ],
      ),
    );
  }
}
