// ignore_for_file: must_be_immutable, unused_import, file_names, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/Screens/HomeScreen.dart';
import 'package:firebasetutorial/utils/Handle_error.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/CustomButton.dart';
import '../../utils/OPT.dart';

class OPTScreen extends StatefulWidget {
  String VerificationId;
  OPTScreen({super.key,required this.VerificationId});

  @override
  State<OPTScreen> createState() => _OPTScreenState();
}

class _OPTScreenState extends State<OPTScreen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  TextEditingController PhoneNumberController = TextEditingController();

  void confirmOTP()async{
    setState(() {
      loading = true;
    });
    final Confirmcredential = PhoneAuthProvider.credential(
      verificationId: widget.VerificationId,
      smsCode: PhoneNumberController.text.toString(),
    );
    try{
      await auth.signInWithCredential(Confirmcredential);
      setState(() {
        loading = true;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home_Screen()));
    }catch(error){
      setState(() {
        loading = false;
      });
    }
    ErrorHandle().showError("errorOccur");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('OTP'),
      ),
      body: Form(
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
              SizedBox(height: 10,),
              Row(
                children: const [
                  Text("Verification Code" , style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 20,),
              Form(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30,right: 30,left: 30),
                      child: TextFormField(
                        controller: PhoneNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter OPT ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Correct OPT";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox( height: MediaQuery.of(context).size.height/3.2,),
              Custom_Button(title: 'Confirm OTP',loading: loading,
                ontap: () {
                  confirmOTP();
                },),
            ],
          ),
        ),
      ),
    );
  }
}
