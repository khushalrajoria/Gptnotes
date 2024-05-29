// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Home_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}
bool animate =false;
class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    startAnimation();
  }

 Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 800));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: animate? 1:0,
          child: Center(
            
            child: "Welcome".text.xl.color(Colors.grey).make(),
          ),
        ),
      ),
    );
  }
}