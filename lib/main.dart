import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp(new Worker('joe', 300)));
}
adsf
class MyApp extends StatefulWidget {
  final Worker worker;

  MyApp(this.worker);

  @override
  createState() {
    return new MyAppState(worker);
  }
}

class MyAppState extends State<MyApp> {
  Worker worker;

  MyAppState(this.worker);

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        child: new Text(
            '\n\n\nmy name is ${worker.employee} and I have worked ${365-worker.daysWorked} days'),
        textDirection: TextDirection.ltr);
  }
}

class Worker {
  String employee;
  int daysWorked;

  Worker(this.employee, this.daysWorked);
}
