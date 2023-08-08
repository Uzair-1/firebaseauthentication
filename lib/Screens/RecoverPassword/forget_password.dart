// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/Screens/HomeScreen.dart';
import 'package:firebasetutorial/utils/Handle_error.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/CustomButton.dart';

class Forget_Screen extends StatefulWidget {
  const Forget_Screen({super.key});

  @override
  State<Forget_Screen> createState() => _Forget_ScreenState();
}

class _Forget_ScreenState extends State<Forget_Screen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();

  void ForgetPassword(){
    setState(() {
      loading = true;
    });
    auth.sendPasswordResetEmail(
      email: emailController.text.toString(),
    ).then((value) {
      setState(() {
        loading = true;
      });
      ErrorHandle().showError('Check The MailBox');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home_Screen()));
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      ErrorHandle().showError(error.toString());
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('ForgetPassword'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/3.3,
                  width: double.infinity,
                  child: Center(
                    child: Lottie.asset("assets/animation_lkwyecj9.json",height: 200),
                  )
              ),
              SizedBox(height: 10,),
             Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
             child:  const Row(
               children: [
                 Text("Enter the Mail,\nTo change the Password" , style: TextStyle(fontSize: 20),),
               ],
             ),
             ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.only(top: 30,right: 30,left: 30),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Correct Email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox( height: MediaQuery.of(context).size.height/3.7,),
              Custom_Button(title: 'Confirm OTP',loading: loading,
                ontap: () {
                  ForgetPassword();
                },),
            ],
          ),
        ),
      ),
    );
  }
}
