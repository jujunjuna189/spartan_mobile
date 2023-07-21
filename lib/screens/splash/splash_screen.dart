import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spartan_mobile/repository/auth_repo.dart';
import 'package:spartan_mobile/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkAuth() {
    Timer(const Duration(seconds: 2), () async {
      await AuthRepo.instance.getSession("user").then((value) {
        if(value != null){
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
        }else{
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
        }
      });
    });
  }

  @override
  void initState(){
    checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("SPARTAN MOBILE", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textDark),),
                SizedBox(height: 10,),
                Text("Versi 1.0.0"),
                SizedBox(height: 100,),
                CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(bgDark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
