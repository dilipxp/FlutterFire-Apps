import 'package:flutter/material.dart';
import 'package:red_tea/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        title: Text('Sgin in to Red Tea'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val );
                }
              ),
              SizedBox(height: 20,),
              TextFormField(
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
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              ),

              // for Reservation
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.green[400],
                child: Text(
                  'Make Reservation',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error in Sign in");
                  } else {
                    print("Customer Signed In");
                    print(result.uid);
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
