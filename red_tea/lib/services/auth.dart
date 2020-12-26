import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_tea/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final User user

  // create a user obj based on FirebaseUser
  UserGet _userFromFirebaseUser(User user) {
    return user != null ? UserGet(uid:user.uid) : null;
  }

  // AuthChange User Steam
  Stream<UserGet> get  user {
    return _auth.authStateChanges()
    // .map((User user) => _userFromFirebaseUser(user));
    //   is line bellow works same as line above
        .map(_userFromFirebaseUser);
  }

  // sign-in  anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
// sign-in with email and password

// register with email and password

// sign-out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}