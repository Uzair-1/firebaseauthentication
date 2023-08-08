// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unused_import


import 'package:firebasetutorial/Screens/Addpost_Screen.dart';
import 'package:firebasetutorial/Screens/MailAuthentication/loginScreen.dart';
import 'package:firebasetutorial/utils/Handle_error.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.logout_sharp),
          onTap: (){
            debugPrint('error ');
            _auth.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginScreen()));
            }).onError((error, stackTrace) {
              ErrorHandle().showError(error.toString());
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddPost()));
        },
      child: Icon(Icons.upload),
      ),
    );
  }
}
