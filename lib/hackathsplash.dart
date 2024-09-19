
import 'package:basic_flutter/hackathprelogin.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hackathsplash extends StatefulWidget {
  const Hackathsplash({super.key});

  @override
  State<Hackathsplash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Hackathsplash> {
  @override
  void initState()
  {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen()async{
    await Future.delayed(Duration(seconds: 4));
    //final response = await retreivebooldata();
    
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Hackathprelogin()),
      );
    
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Image.asset("asset/coalhack.jpg",),
      )
    );
  }
}