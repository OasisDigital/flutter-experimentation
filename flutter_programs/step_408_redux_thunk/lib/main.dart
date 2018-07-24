import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';

void main() => runApp(new MyApp());

//state
class AppState {
  List employees;
  AppState({this.employees});

  static AppState initial() {
    return AppState(employees: []);
  }
}

//actions
ThunkAction getEmployee = (Store store) async {
  int index = 1 + Random().nextInt(99);
  Future getData() async {
    http.Response response = await http.get(
      'https://api.angularbootcamp.com/employees/' + index.toString(),
    );
    return json.decode(response.body);
  }

  var employeeData = await getData();
  print(employeeData);
  String employeeName =
      employeeData['first_name'] + ' ' + employeeData['last_name'];
  store.dispatch(AddEmployee(employeeName));
};

class AddEmployee {
  String name;
  AddEmployee(this.name);
}

//reducer
AppState reducer(AppState state, dynamic action) {
  if (action is AddEmployee) {
    state.employees.add(action.name);
  }
  return state;
}

class MyApp extends StatelessWidget {
  //store
  final Store<AppState> store = Store<AppState>(
    reducer,
    middleware: [thunkMiddleware],
    initialState: AppState.initial(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: EmployeesPage(),
      ),
    );
  }
}

class EmployeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Employees'),
      ),
      body: StoreBuilder<AppState>(
        builder: (context, store) {
          if (store.state.employees.isNotEmpty) {
            return EmployeeList(store);
          } else {
            return ListTile(
              title: Text('Add some employees.'),
            );
          }
        },
      ),
      floatingActionButton: StoreBuilder<AppState>(
        builder: (context, store) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              store.dispatch(getEmployee);
            },
          );
        },
      ),
    );
  }
}

class EmployeeList extends StatelessWidget {
  final Store<AppState> store;
  EmployeeList(this.store);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.state.employees.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(store.state.employees[index]),
          ),
        );
      },
    );
  }
}
