import 'package:flutter/material.dart';

class FolderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, 
          ),
          child: new Row(
            children: <Widget>[
              Icon(Icons.folder),
              SizedBox(width: 10.0),
              Text('Folder Name Here'),
            ],
            ),
            )
    );          
  }
}