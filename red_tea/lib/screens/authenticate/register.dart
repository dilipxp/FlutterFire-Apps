import 'package:flutter/material.dart';
import 'package:red_tea/services/auth.dart';
import 'package:red_tea/shared/constant.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Test Field States
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Sign up for RedTea'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: (){
              widget.toggleView();                                         // Go Back to Sign-in Screen
              },
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
              TextFormField(                                               // For Email
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  decoration: textInputDecoration.copyWith(
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
                  validator: (val) => val.length < 6 ? 'Password at least 6 characters long' : null,
                  decoration: textInputDecoration.copyWith(
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
                color: Colors.red[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(()=> error = 'please fill form correctly');
                    }
                  }
                },
              ),
              SizedBox(height: 20.0,),
              Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
