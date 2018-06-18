import 'package:flutter/material.dart';

class FolderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.folder),
          title: Text('Folder Name Here'),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
