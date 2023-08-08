// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetutorial/Screens/HomeScreen.dart';
import 'package:firebasetutorial/Screens/MailAuthentication/signup.dart';
import 'package:firebasetutorial/Screens/RecoverPassword/forget_password.dart';
import 'package:firebasetutorial/Screens/PhoneAuthentication/phone_Auth.dart';
import 'package:firebasetutorial/utils/Handle_error.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/CustomButton.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisibility =false;
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void Login(){
    setState(() {
      loading = true;
    });
    if(_formkey.currentState!.validate()){            // check the validation
      _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).then((value){
        ErrorHandle().showError(value.user!.email.toString());
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
      }).onError((error, stackTrace){
        ErrorHandle().showError(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/4.1,
                width: double.infinity,
                child: Center(
                 child: Lottie.asset("assets/animation_lksaxaf7.json",height: 200),
                )
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20,right: 30,left: 30),
                      child:   TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            suffixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Email";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30,right: 30,left: 30),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _passwordVisibility,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              splashRadius: 1,
                              icon: Icon(_passwordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,),
                              onPressed: (){
                                setState(() {
                                  _passwordVisibility =!_passwordVisibility;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                    ),
                     Padding(padding: EdgeInsets.only(left: 30,right: 30),
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextButton(onPressed: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_phone()));
                           }, child: Text('Login With Phone')),
                           TextButton(onPressed: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Forget_Screen()));
                           }, child: Text('Forget Password')),
                         ],
                       ),
                     ),
                  ],
                )
              ),
              SizedBox( height: MediaQuery.of(context).size.height/4.9,),
              Custom_Button(title: 'Login',
                ontap: () {
                  Login();
              }, loading: loading,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?"),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> signUpScreen()));
                  }, child: Text("Sigup",style: TextStyle(color: Colors.blue),)),
                ],
             ),
            ],
          ),
        ),
      ),

    ));
  }
}