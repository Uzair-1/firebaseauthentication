
// ignore_for_file: prefer_const_constructors, camel_case_types

// ignore_for_file: file_names

import 'package:firebasetutorial/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screens/MailAuthentication/loginScreen.dart';

class Firebase_Service {
  final auth = FirebaseAuth.instance;
  User? user;

  Firebase_Service(){
    user = auth.currentUser;
  }
  void isLogin(BuildContext context){
    if(user!=null){
      Future .delayed(Duration(seconds: 6),() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_Screen()));}
      );} else {
      Future .delayed(Duration(seconds: 6),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const loginScreen()));
      });
    }

  }
}