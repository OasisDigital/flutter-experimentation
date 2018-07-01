import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFutureBuilder(
        MyEmployeeGetter(),
      ).run(),
    );
  }
}

abstract class EmployeeInterface {
  dynamic getEmployees();
}

class MyEmployeeGetter implements EmployeeInterface {
  getEmployees() async {
    http.Response response = await http.get(
      'https://api.angularbootcamp.com/employees',
    );
    return json.decode(response.body);
  }
}

class MyFutureBuilder {
  EmployeeInterface employeeGetter;
  MyFutureBuilder(this.employeeGetter);

  Widget run() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Employees'),
      ),
      body: FutureBuilder(
        future: employeeGetter.getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      snapshot.data[index]['first_name'] +
                          ' ' +
                          snapshot.data[index]['last_name'],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
