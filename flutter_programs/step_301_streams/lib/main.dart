import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(new MyApp());

int numberOfEmployees = 5;

Stream employeesStream() async* {
  List data = await getEmployees();
  for (int i = 0; i < numberOfEmployees; i++) {
    await Future.delayed(Duration(milliseconds: 250));
    yield '${data[i]['first_name']}' + ' ' + '${data[i]['last_name']}';
  }
}

Future getEmployees() async {
  http.Response response = await http.get(
    'https://api.angularbootcamp.com/employees',
  );
  return json.decode(response.body);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStreamBuilder(),
    );
  }
}

class MyStreamBuilder extends StatelessWidget {
  final Stream employees = employeesStream().asBroadcastStream().take(numberOfEmployees);
  void makeWidgetsList(List list) {
    employees.forEach(
      (employee) {
        list.add(
          Card(
            child: ListTile(
              title: Text(employee),
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    List<Widget> widgetsList = List();
    makeWidgetsList(widgetsList);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top 5 Employees'),
      ),
      body: StreamBuilder(
        stream: employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: widgetsList.length,
              itemBuilder: (context, i) {
                return widgetsList[i];
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
