import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddEmployeeAction {
  int index;
  AddEmployeeAction({this.index});
}

class RemoveEmployeeAction {
  int index;
  RemoveEmployeeAction({this.index});
}

class HireAllAction {}

class AppState {
  List currentEmployees;
  List potentialEmployees;

  AppState({this.currentEmployees, this.potentialEmployees});

  static AppState initial() {
    return AppState(
      currentEmployees: [
        'Alice Anderson',
        'Billy Burton',
        'Carol Carson',
        'David Dennison',
      ],
      potentialEmployees: [
        'Erin Ericcson',
        'Frank Ferdinand',
        'Grover Garfield',
        'Helen Henderson',
        'Joshua Jacobs',
        'Karen Kent',
        'Matthew McNair'
      ],
    );
  }
}

AppState myReducer(AppState state, dynamic action) {
  if (action is AddEmployeeAction) {
    return AppState(
      currentEmployees: state.currentEmployees
        ..add(state.potentialEmployees[action.index]),
      potentialEmployees: state.potentialEmployees..removeAt(action.index),
    );
  } else if (action is RemoveEmployeeAction) {
    return AppState(
      currentEmployees: state.currentEmployees..removeAt(action.index),
      potentialEmployees: state.potentialEmployees,
    );
  } else if (action == HireAllAction) {
    AppState newState = AppState(
      currentEmployees: state.currentEmployees,
      potentialEmployees: state.potentialEmployees,
    );
    for (int i = newState.potentialEmployees.length - 1; i >= 0; i--) {
      newState.currentEmployees.add(newState.potentialEmployees[i]);
      newState.potentialEmployees.removeAt(i);
    }
    return newState;
  }
  return state;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    myReducer,
    initialState: AppState.initial(),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          'currentEmployees': (context) {
            return CurrentEmployeesPage();
          },
          'potentialEmployees': (context) {
            return PotentialEmployeesPage();
          }
        },
        home: CurrentEmployeesPage(),
      ),
    );
  }
}

class CurrentEmployeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Employees'),
      ),
      body: StoreBuilder<AppState>(
        builder: (context, store) {
          if (store.state.currentEmployees.isNotEmpty) {
            return CurrentEmployeeList(store);
          } else {
            return ListTile(
              title: Text('You have no more employees.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'potentialEmployees');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CurrentEmployeeList extends StatelessWidget {
  final Store<AppState> store;
  CurrentEmployeeList(this.store);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.state.currentEmployees.length,
      itemBuilder: (context, index) {
        return StoreConnector<AppState, VoidCallback>(
          converter: (store) {
            return () {
              store.dispatch(RemoveEmployeeAction(index: index));
            };
          },
          builder: (context, callback) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (details) {
                callback();
              },
              child: Card(
                child: ListTile(
                  title: Text(store.state.currentEmployees[index]),
                ),
              ),
              background: Container(
                color: Colors.red,
                child: ListTile(
                  leading: Icon(Icons.delete),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: ListTile(
                  trailing: Icon(Icons.delete),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class PotentialEmployeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Potential Employees'),
      ),
      body: StoreBuilder<AppState>(
        builder: (context, store) {
          if (store.state.potentialEmployees.isNotEmpty) {
            return PotentialEmployeesList(store);
          } else {
            return ListTile(
              title: Text('There are no more potential new employees.'),
            );
          }
        },
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(HireAllAction);
          };
        },
        builder: (context, callback) {
          return RaisedButton(
            child: Text('Hire All'),
            onPressed: callback,
          );
        },
      ),
    );
  }
}

class PotentialEmployeesList extends StatelessWidget {
  final Store<AppState> store;
  PotentialEmployeesList(this.store);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: store.state.potentialEmployees.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(store.state.potentialEmployees[index]),
            trailing: StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () {
                  store.dispatch(AddEmployeeAction(index: index));
                };
              },
              builder: (context, callback) {
                return RaisedButton(
                  child: Text('Hire'),
                  onPressed: callback,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
