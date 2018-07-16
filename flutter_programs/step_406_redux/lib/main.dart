import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

// List of all possible actions
enum Actions {
  IncrementBerries,
  IncrementApples,
  IncrementApplesByThree,
  EmptyCart,
}

class AppState {
  final int berries;
  final int apples;
  AppState({this.berries, this.apples});

  static AppState initial() {
    return AppState(berries: 0, apples: 0);
  }
}

// The Reducer- the thing that handles actions
AppState myReducer(AppState state, dynamic action) {
  if (action == Actions.IncrementBerries) {
    return AppState(berries: state.berries + 1, apples: state.apples);
  } else if (action == Actions.IncrementApples) {
    return AppState(berries: state.berries, apples: state.apples + 1);
  } else if (action == Actions.IncrementApplesByThree) {
    return AppState(berries: state.berries, apples: state.apples + 3);
  } else if (action == Actions.EmptyCart) {
    return AppState.initial();
  }
  return state;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // A Store is made with our reducer and the initial state we want
  final store = Store<AppState>(
    myReducer,
    initialState: AppState.initial(),
  );
  @override
  Widget build(BuildContext context) {
    // The StoreProvider gives the entire widget tree access to the store
    // through StoreConnectors
    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'flutter redux',
        home: MyReduxExampleWidget(),
      ),
    );
  }
}

class MyReduxExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Redux'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TotalFruit(),
            BerriesWidget(),
            ApplesWidget(),
            SizedBox(height: 100.0),
          ],
        ),
      ),
      floatingActionButton: EmptyCart(),
    );
  }
}

class TotalFruit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // a store builder is used to look at the latest state of the store
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return Text(
          'Total Fruit: ' +
              (store.state.berries + store.state.apples).toString(),
          textScaleFactor: 2.5,
        );
      },
    );
  }
}

class BerriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Berries',
              textScaleFactor: 2.0,
            ),
            // a store connector is used to get the latest state of the store,
            // the converter function changes the state into a ViewModel, and
            // the builder uses that to make the widget
            // (a store builder could also have been used)
            StoreConnector<AppState, String>(
              converter: (store) {
                return store.state.berries.toString();
              },
              builder: (context, berries) {
                return Text(
                  'Current Total: ' + berries,
                  textScaleFactor: 1.5,
                );
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                // a store connector is used to call an action on our store
                // This is done by making a VoidCallBack in the converter function
                // and then using that in the builder function in the onPressed
                // property of the button, this dispatched action is then sent
                // to the reducer to be processed and a new state is created
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () {
                      store.dispatch(Actions.IncrementBerries);
                    };
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      child: Text('Pick'),
                      onPressed: callback,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ApplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Apples',
              textScaleFactor: 2.0,
            ),
            // another store connector displaying text
            StoreConnector<AppState, String>(
              converter: (store) {
                return store.state.apples.toString();
              },
              builder: (context, apples) {
                return Text(
                  'Current Total: ' + apples,
                  textScaleFactor: 1.5,
                );
              },
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () {
                      store.dispatch(Actions.IncrementApples);
                    };
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      child: Text('Pick'),
                      onPressed: callback,
                    );
                  },
                ),
                //another store connector calling an Action
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () {
                      store.dispatch(Actions.IncrementApplesByThree);
                    };
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      child: Text('Pick 3'),
                      onPressed: callback,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //another store connector calling an Action
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) {
        return () {
          store.dispatch(Actions.EmptyCart);
        };
      },
      builder: (context, callback) {
        return RaisedButton(
          child: Text('Empty Cart'),
          onPressed: callback,
        );
      },
    );
  }
}
