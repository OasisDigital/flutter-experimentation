import 'package:flutter/material.dart';
import 'folder_item.dart';

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: <Widget>[
        FolderItem(),
        FolderItem(),
        FolderItem(),
        FolderItem(),
        FolderItem(),
        FolderItem(),
        FolderItem(),
      ],
    );
  }
}
