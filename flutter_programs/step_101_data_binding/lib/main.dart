import 'package:flutter/material.dart';

void main() {
  Employee employee = new Employee('John Doe', 81, 'Acme, Inc.');
  EmployeeOfTheWeek employeeOfTheWeek = new EmployeeOfTheWeek('Jane Smith', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc1kZ2RtGjn1hwXkfJ9QbYVxdHNCB2fixnSL4tRi0iRHdLuLPT');
  runApp(new MyApp(employee, employeeOfTheWeek));
}

class MyApp extends StatelessWidget {
  final Employee employee;
  final EmployeeOfTheWeek employeeOfTheWeek;

  MyApp(this.employee, this.employeeOfTheWeek);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Text(
          'Hello, ${employee.name}', 
          textDirection: TextDirection.ltr),
        new Text(
          'Days Worked: ${employee.daysWorked}', 
          textDirection: TextDirection.ltr),
        new Text(
          'Days until next vacation: ${365-employee.daysWorked}', 
          textDirection: TextDirection.ltr),
        new Text(
          'Thank you for being a dedicated employee of ${employee.company}!', 
          textDirection: TextDirection.ltr),
        new Image.network(employeeOfTheWeek.picture, height: 100.0, width: 100.0,),
        new Text(
          'Employee of the weeek is ${employeeOfTheWeek.name}!!',
          textDirection: TextDirection.ltr),
      ]);
  }
}

class Employee {
  String name;
  int daysWorked;
  String company;

  Employee(this.name, this.daysWorked, this.company);
}

class EmployeeOfTheWeek {
  String name;
  String picture;

  EmployeeOfTheWeek(this.name, this.picture);
}