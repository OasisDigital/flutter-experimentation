import 'package:flutter/material.dart';
import 'folder_item.dart';

class FolderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: DrawerHeader(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Folders',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 2.0,
                  ),
                ],
              ),
            ),
          ),
          ListBody(
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
        ],
      ),
    );
  }
}
