import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Profile',
            textScaleFactor: 2.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Text(
                'Phone number: 555-123-1345\nEmail address: test@abccompany.com\nAddress: 1 Main Street, St. Louis, MO 63105'),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: _visible ? Text('Hide Profile') : Text('Show Profile'),
          )
        ],
      ),
    );
  }
}
