import 'package:flutter/material.dart';
import 'package:red_tea/services/auth.dart';


class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[80],
      appBar: AppBar(
        title: Text('RedTea'),
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
