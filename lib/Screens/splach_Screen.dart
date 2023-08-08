// ignore_for_file: file_names

import 'package:firebasetutorial/Firebase_Services/isLoginService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Firebase_Service splaceService = Firebase_Service();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splaceService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Center(
                  child: Lottie.asset("assets/animation_lks8874n.json",
                      height: MediaQuery.of(context).size.height / 2)),
            ),
          ),
        ],
      ),
    );
  }
}
