import 'package:flutter/material.dart';
import 'package:red_tea/services/auth.dart';
import 'package:red_tea/screens/reservation/reservation.dart';
import 'package:red_tea/shared/constant.dart';
import 'package:red_tea/screens/wrapper.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Test Field States
  String email = '';
  String password = '';
  String error = '';
  String reservation = 'formFilled';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Sgin in to Red Tea'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: (){widget.toggleView();},                                               // Go Back to Register Screen
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,                       // For Email
                  decoration:  textInputDecoration.copyWith(
                    icon: Icon(Icons.email),
                    hintText: 'eample@gmail.com',
                    labelText: 'Email *',
                  ),
                onChanged: (val) {
                  setState(() => email = val );
                }
              ),
              SizedBox(height: 20,),
              TextFormField(

                  validator: (val) => val.length < 6 ? 'Password at least 6 characters long' : null,
                  decoration: textInputDecoration.copyWith(
                    icon: Icon(Icons.lock),
                    hintText: 'eample@gmail.com',
                    labelText: 'Type Password here! *',
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
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'could not sign in check your password');
                    }
                  }
                }
              ),
              SizedBox(height: 20.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              // for Reservation
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.green[400],
                child: Text(
                  'Make Reservation',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  {
                  print('nothing happend');
                  return 0;
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

