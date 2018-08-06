import 'package:flutter/material.dart';

class Employee {
  String name;
  int daysworked;
  String companyName;

  Employee(this.name, this.daysworked, this.companyName);
}

class EmployeeoftheWeek {
  String name;
  String picture;

  EmployeeoftheWeek(this.name, this.picture);
}

void main() {
  Employee employee = new Employee('John Doe', 81, 'Acme, Inc.');
  EmployeeoftheWeek employeeoftheWeek = new EmployeeoftheWeek('Jane Smith',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1kZ2RtGjn1hwXkfJ9QbYVxdHNCB2fixnSL4tRi0iRHdLuLPT');
  runApp(new MyApp(employee, employeeoftheWeek));
}

class MyApp extends StatelessWidget {
  final Employee employee;
  final EmployeeoftheWeek employeeoftheWeek;

  MyApp(this.employee, this.employeeoftheWeek);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text('Hello, ${employee.name}', textDirection: TextDirection.ltr),
        new Text('Days Worked: ${employee.daysworked}',
            textDirection: TextDirection.ltr),
        new Text('Days until next vacation: ${365-employee.daysworked}',
            textDirection: TextDirection.ltr),
        new Text(
            'Thank you for being a dedicated employee of ${employee.companyName}!',
            textDirection: TextDirection.rtl),
        new Text('The employee of the week is ${employeeoftheWeek.name}!',
            textDirection: TextDirection.ltr)
      ],
    );
  }
}
