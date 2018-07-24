import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MyApp());

int count = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cloud Firestore',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cloud Firestore'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
              textScaleFactor: 1.25,
            ),
            //UI that listens to Firestore
            MyStreamBuilder(),
          ],
        ),
      ),
      //Buttons that can change the Firestore data
      floatingActionButton: MyButtonBar(),
    );
  }
}

class MyStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('state').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot documentData = snapshot.data.documents[0];
          return Text(
            '${documentData['count']}',
            textScaleFactor: 2.5,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MyButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        new FloatingActionButton(
          onPressed: () {
            Firestore.instance.runTransaction(
              (transaction) async {
                DocumentReference document =
                    Firestore.instance.document('state/myDocument');
                DocumentSnapshot freshsnap =
                    await transaction.get(document);
                await transaction.update(
                  freshsnap.reference,
                  {'count': freshsnap['count'] + 1},
                );
              },
            );
          },
          child: new Icon(Icons.add),
        ),
        new FloatingActionButton(
          onPressed: () {
            Firestore.instance.runTransaction(
              (transaction) async {
                DocumentReference document =
                    Firestore.instance.document('state/myDocument');
                DocumentSnapshot freshsnap = await transaction.get(document);
                await transaction.update(
                    freshsnap.reference, {'count': freshsnap['count'] - 1});
              },
            );
          },
          child: new Icon(Icons.remove),
        ),
        new FloatingActionButton(
          onPressed: () {
            Firestore.instance.runTransaction(
              (transaction) async {
                DocumentReference document =
                    Firestore.instance.document('state/myDocument');
                DocumentSnapshot freshsnap = await transaction.get(document);
                await transaction.update(freshsnap.reference, {'count': 0});
              },
            );
          },
          child: new Icon(Icons.restore),
        ),
      ],
    );
  }
}
