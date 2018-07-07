import 'package:flutter/material.dart';
import 'package:validator/validator.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
        title: 'Reactive Forms',
        home: PageView(
          children: <Widget>[
            EmployeeForm(),
            EmployeeDataPage(),
          ],
        ),
      ),
    );

class EmployeeData {
  String firstName = '';
  String lastName = '';
  String middleInitial = '';
  String position = '';
  String department = '';
  String supervisor = '';
  String phoneNumber = '';
  String eMail = '';
}

EmployeeData employeeData = EmployeeData();

class EmployeeForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmployeeFormState();
}

class EmployeeFormState extends State<EmployeeForm> {
  String selection;
  bool autoValidate = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Employee Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              formKey.currentState.reset();
            },
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                autovalidate: autoValidate,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value.length == 0) {
                    return '';
                  }
                },
                onSaved: (value) {
                  employeeData.firstName = value;
                },
              ),
              SizedBox(height: 3.0),
              TextFormField(
                autovalidate: autoValidate,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value.length == 0) {
                    return '';
                  }
                },
                onSaved: (value) {
                  employeeData.lastName = value;
                },
              ),
              SizedBox(height: 3.0),
              TextFormField(
                autovalidate: autoValidate,
                decoration: InputDecoration(labelText: 'Middle Initial'),
                validator: (string) {
                  if (string.length == 0) {
                    return '';
                  }
                  if (string.length > 1) {
                    return 'only one character please';
                  }
                },
                onSaved: (value) {
                  employeeData.middleInitial = value;
                },
              ),
              SizedBox(height: 3.0),
              TextFormField(
                autovalidate: autoValidate,
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) {
                  if (value.length == 0) {
                    return '';
                  }
                },
                initialValue: 'Sales',
                onSaved: (value) {
                  employeeData.position = value;
                },
              ),
              Center(
                child: DropdownButton(
                  hint: Text('Department'),
                  value: selection,
                  onChanged: (myValue) {
                    employeeData.department = myValue;
                    setState(() {
                      selection = myValue;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'HR',
                      child: Text('HR'),
                    ),
                    DropdownMenuItem(
                      value: 'Payroll',
                      child: Text('Payroll'),
                    ),
                  ],
                ),
              ),
              TextFormField(
                autovalidate: autoValidate,
                decoration: InputDecoration(labelText: 'Supervisor'),
                validator: (value) {
                  if (value.length == 0) {
                    return '';
                  }
                },
                onSaved: (value) {
                  employeeData.supervisor = value;
                },
              ),
              SizedBox(height: 3.0),
              TextFormField(
                autovalidate: autoValidate,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (string) {
                  if (string.length == 0) {
                    return '';
                  }
                  if (!isNumeric(string) && string.length != 0) {
                    return ('has to be number');
                  }
                  if (string.length != 10 && string.length != 0) {
                    return ('invalid');
                  }
                },
                onSaved: (value) {
                  employeeData.phoneNumber = value;
                },
              ),
              SizedBox(height: 3.0),
              TextFormField(
                autovalidate: autoValidate,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (string) {
                  if (string.length == 0) {
                    return '';
                  }
                  if (!isEmail(string) && string != '') {
                    return 'invalid';
                  }
                },
                onSaved: (value) {
                  employeeData.eMail = value;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            key.currentState.showSnackBar(
              SnackBar(
                content:
                    Text('employee data submitted, swipe left to see data'),
              ),
            );
          } else {
            key.currentState.showSnackBar(
              SnackBar(
                content: Text('please fix the errors above'),
              ),
            );
          }
        },
      ),
    );
  }
}

class EmployeeDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'first name: ' + employeeData.firstName,
              textScaleFactor: 1.5,
            ),
            Text(
              'last name: ' + employeeData.lastName,
              textScaleFactor: 1.5,
            ),
            Text(
              'middle initial: ' + employeeData.middleInitial,
              textScaleFactor: 1.5,
            ),
            Text(
              'position: ' + employeeData.position,
              textScaleFactor: 1.5,
            ),
            Text(
              'department: ' + employeeData.department,
              textScaleFactor: 1.5,
            ),
            Text(
              'supervisor: ' + employeeData.supervisor,
              textScaleFactor: 1.5,
            ),
            Text(
              'phone number: ' + employeeData.phoneNumber,
              textScaleFactor: 1.5,
            ),
            Text(
              'Email: ' + employeeData.eMail,
              textScaleFactor: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
