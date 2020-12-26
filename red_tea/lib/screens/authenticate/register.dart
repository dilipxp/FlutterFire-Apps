import 'package:flutter/material.dart';
import 'package:red_tea/services/auth.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  // Test Field States
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Sign up for RedTea (OWNER)'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text('For Owners Only'),

              SizedBox(height: 20,),
              TextFormField(                                  // For Email
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'example@gmail.com',
                    labelText: 'Email *',
                  ),
                  onChanged: (val) {
                    setState(() => email = val );
                  }
              ),
              SizedBox(height: 20,),
              TextFormField(                                     // For Password
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Keep Password safe!',
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val );
                  }
              ),

              // for Owner
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
