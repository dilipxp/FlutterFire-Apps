import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_tea/models/user.dart';
import 'package:red_tea/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red_tea/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You Have an Error! ${snapshot.error.toString()}");
            return Text('Something went Wrong!');
          } else if (snapshot.hasData) {
            return StreamProvider<UserGet>.value(
              value: AuthService().user,
              child: MaterialApp(
                home: Wrapper(),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}