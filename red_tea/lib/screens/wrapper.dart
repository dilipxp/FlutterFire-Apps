import 'package:flutter/material.dart';
import 'package:red_tea/screens/authenticate/authenticate.dart';
import 'package:red_tea/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final user  = Provider.of<UserGet>(context);
    //print(user);
    // return either Home or Authenticate Widget
    return Authenticate();
  }
}
