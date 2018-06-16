import 'package:flutter/material.dart';

class LoopWidget extends StatefulWidget {
  @override
  _LoopWidgetState createState() => _LoopWidgetState();
}

class _LoopWidgetState extends State<LoopWidget> {
  List _myList = [
    'folder 1',
    'folder 2',
    'folder 3',
  ];

  void _addToList(String text) {
    setState(() {
      if (text == '') {
        _myList.add('folder ${_myList.length+1}');
      } else {
        _myList.add(text);
        _myController.clear();
      }
    });
  }

  void _removeFromList(int item) {
    setState(() {
      _myList.removeAt(item);
    });
  }

  final _myController = TextEditingController();

  Widget _getList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: IconButton(
              color: Colors.red,
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeFromList(i);
              },
            ),
            title: Text(
              '${_myList[i]}',
              textScaleFactor: 1.5,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getList(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (string) {
              _addToList(_myController.text);
            },
            controller: _myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: FloatingActionButton(
                child: Icon(Icons.create_new_folder),
                onPressed: () {
                  _addToList(_myController.text);
                },
              ),
              hintText: 'folder name (optional)',
            ),
          ),
        ),
      ],
    );
  }
}
