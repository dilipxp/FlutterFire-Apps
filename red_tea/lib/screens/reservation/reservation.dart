import 'package:flutter/material.dart';


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
        backgroundColor: Colors.red[400],
        elevation: 0.0,
        title: Text('Make Reservation'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ListView(
          children: [
          Form(
              child: Column(
              children: <Widget>[
                Text('Fill the fields'),

                SizedBox(height: 20,),
                TextFormField(                              // For Email
                    decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Type Your Mobile Number',
                      labelText: 'Phone *',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => phone = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                                   // For Size of Family
                    decoration: const InputDecoration(
                      icon: Icon(Icons.family_restroom),
                      hintText: 'How many people?',
                      labelText: 'Family size *',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => familySize = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                               // For Date
                    decoration: const InputDecoration(
                      icon: Icon(Icons.date_range),
                      hintText: 'DD-MM-YYYY',
                      labelText: 'Date *',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => date = val );
                    }
                ),

                SizedBox(height: 20,),
                TextFormField(                               // For Time
                    decoration: const InputDecoration(
                      icon: Icon(Icons.timelapse),
                      hintText: '4:30 PM',
                      labelText: 'Time *',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => time = val );
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

