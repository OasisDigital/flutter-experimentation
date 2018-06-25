import 'package:flutter/material.dart';
import 'record_list.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recordList.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: new Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 91.0,
                    child: Center(
                      child: Text(
                        recordList.keys.toList()[i],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 68.0,
                    child: Center(
                      child: Text(
                        recordList[recordList.keys.toList()[i]]['units']
                            .toStringAsFixed(1),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 104.0,
                    child: Center(
                      child: Text(
                        '\$' +
                            recordList[recordList.keys.toList()[i]]
                                    ['totalRevenue']
                                .toStringAsFixed(2),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 52.0,
                    child: Center(
                      child: Text(recordList[recordList.keys.toList()[i]]
                                  ['percent']
                              .toStringAsFixed(2) +
                          '%'),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
