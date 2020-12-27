import 'package:flutter/material.dart';
// import 'package:red_tea/services/auth.dart';
import 'package:red_tea/screens/authenticate/sign-in.dart';
import 'package:red_tea/shared/constant.dart';


class Reservation extends StatefulWidget {

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

   // final AuthService _auth = AuthService();

  // Test Field States
  String email = '', name = '', phone = '', familySize = '', date = '', time = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        title: Text('Make Reservation'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: (){
                      return  SignIn();                  // Go Back to Sign-in Screen
              },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ListView(
          children: [
          Form(
              child: Column(
              children: <Widget>[
                Text('Fill the fields to make an reservation!'),

                SizedBox(height: 20,),
                TextFormField(                              // For Email
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.email),
                      hintText: 'eample@gmail.com',
                      labelText: 'Email *',
                    ),
                    onChanged: (val) {
                      setState(() => email = val );
                    }
                ),
                SizedBox(height: 20,),
                TextFormField(                            // For Name
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.person),
                      hintText: 'Dilip Singh',
                      labelText: 'Name *',
                    ),
                    onChanged: (val) {
                      setState(() => name = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                               // For Phone
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.phone),
                      hintText: 'Type Your Mobile Number',
                      labelText: 'Phone *',
                    ),
                    onChanged: (val) {
                      setState(() => phone = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                                   // For Size of Family
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.family_restroom),
                      hintText: 'How many people?',
                      labelText: 'Family size *',
                    ),
                    onChanged: (val) {
                      setState(() => familySize = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                               // For Date
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.date_range),
                      hintText: 'DD-MM-YYYY',
                      labelText: 'Date *',
                    ),
                    onChanged: (val) {
                      setState(() => date = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                               // For Time
                    decoration: textInputDecorationReservation.copyWith(
                      icon: Icon(Icons.timelapse),
                      hintText: 'Example:4:30 PM',
                      labelText: 'Time *',
                    ),
                    onChanged: (val) {
                      setState(() => time = val );
                    }
                ),

                // for Owner
                SizedBox(height: 50,),
                RaisedButton(
                  color: Colors.green[400],
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    print(email);
                    print(phone);
                    print(familySize);
                    print(date);
                    print(time);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

