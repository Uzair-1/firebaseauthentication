// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/Screens/PhoneAuthentication/check_OTP.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/CustomButton.dart';

class Login_phone extends StatefulWidget {
  const Login_phone({super.key});

  @override
  State<Login_phone> createState() => _Login_phoneState();
}

class _Login_phoneState extends State<Login_phone> {
  bool loading = false;
  final _keyForm = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextEditingController PhoneNumberController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PhoneNumberController.dispose();
  }
  void SendOPT(){
    setState(() {
      loading=true;
    });
    if(_keyForm.currentState!.validate()){

      setState(() {
        loading =true;
      });

      auth.verifyPhoneNumber(
        phoneNumber: PhoneNumberController.text,
          verificationCompleted: (_){

          },
          verificationFailed: (error){
            setState(() {
              loading=false;
            });
          },
          codeSent: (String VerficationId, int? Token){
          setState(() {
              loading=false;
            });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OPTScreen(VerificationId: VerficationId,)));
          },
          codeAutoRetrievalTimeout: (error){
            setState(() {
              loading=false;
            });
          }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Phonelogin'),
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/3.3,
                  width: double.infinity,
                  child: Center(
                    child: Lottie.asset("assets/animation_lkwitrhq.json",height: 200),
                  )
              ),
               Form(
                 key: _keyForm,
                 child: Padding(padding: const EdgeInsets.only(top: 30,right: 30,left: 30),
                   child:   TextFormField(
                     controller: PhoneNumberController,
                     // keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                         hintText: '+92**********',
                         suffixIcon: const Icon(Icons.person),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                         )
                     ),
                     validator: (value){
                       if(value!.isEmpty){
                         return "Enter PhoneNumber";
                       }
                       return null;
                     },
                   ),
                 ),
               ),
              SizedBox( height: MediaQuery.of(context).size.height/2.9,),
              Custom_Button(title: 'Send OTP',loading: loading,
                ontap: () {
                  SendOPT();
                },),
            ],
          ),
        ),
      ),
    );
  }
}
