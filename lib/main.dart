// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetutorial/Screens/Addpost_Screen.dart';
import 'package:firebasetutorial/Screens/HomeScreen.dart';
import 'package:firebasetutorial/Screens/PhoneAuthentication/phone_Auth.dart';
import 'package:firebasetutorial/Screens/splach_Screen.dart';
import 'package:flutter/material.dart';

import 'Screens/PhoneAuthentication/check_OTP.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
