import 'package:flutter/material.dart';

class FolderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Text('Folder Name Here'),
    );
  }
}
