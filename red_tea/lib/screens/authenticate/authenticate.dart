import 'package:flutter/material.dart';
import 'package:red_tea/screens/authenticate/sign-in.dart';
import 'package:red_tea/screens/authenticate/register.dart';
import 'package:red_tea/screens/reservation/reservation.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
  setState(()=> showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
   if (showSignIn){
     return SignIn(toggleView: toggleView);
   } else{
     return Register(toggleView: toggleView);
     // return Reservation();
   }
  }
}

