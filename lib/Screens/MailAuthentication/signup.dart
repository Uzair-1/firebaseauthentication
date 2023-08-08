
// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:firebasetutorial/Screens/MailAuthentication/loginScreen.dart';
import 'package:firebasetutorial/utils/Handle_error.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add this line for Firebase core initialization
import 'package:lottie/lottie.dart';
import '../../utils/CustomButton.dart';
import '../HomeScreen.dart';


class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final PhoneNumberController = TextEditingController();
  bool _passwordVisibility =false;

  final  _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void SignUp(){
    setState(() {
      loading = true;
    });
    if(_formkey.currentState!.validate()){
      _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).then((value){
        // ErrorHandle().showError(value.user!.email.toString());
        // // ErrorHandle().showError(value.user!.uid.toString());
        // ErrorHandle().showError(value.user!.phoneNumber!.length.toString());
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
        setState(() {
          loading = false;
        });
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
        title: Text('Sigup'),
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
                            else if(value.length<6){
                              return "Enter the 6 digits password";
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
                    ],
                  )
              ),
              SizedBox( height: MediaQuery.of(context).size.height/3.8,),
              Custom_Button(title: 'Signup',
                ontap: () {
                  SignUp();              // check the validation
                }, loading: loading,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already Have Any Account?"),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const loginScreen()));
                  }, child: Text("Login",style: TextStyle(color: Colors.blue),)),
                ],
              ),
            ],
          ),
        ),
      ),

    ));
  }
}