import 'dart:async';

import 'package:financeapp/Screens/first_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
Timer(Duration(seconds: 4),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>First_Screen()));

});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(  
  color: Color.fromRGBO(122, 201, 10, 1),
  child: Center(child: Padding(
    padding: const EdgeInsets.only(top: 310),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/bird.png'),
  
        Padding(
          padding: const EdgeInsets.only(top: 190,),
          child: Text("duolingo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        )
      ],
    ),
  )),
)

    );
  }
}