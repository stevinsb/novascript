//import 'package:basic_flutter/details_form.dart';
//import 'package:basic_flutter/functions.dart';
import 'package:basic_flutter/hackathlogin.dart';
import 'package:basic_flutter/hackathloginsu.dart';
//import 'package:basic_flutter/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hackathprelogin extends StatelessWidget {
  const Hackathprelogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        // Background image decoration
        decoration: BoxDecoration(
          
        ),
        child: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 312,
        height: 106, // Set a fixed width for both buttons
        child: ElevatedButton(
          onPressed: () {
            //storebooldata(false);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Hackathlogin()),
              (route) => false,
            );
          },
          child: Text(
            "WORKER",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
      SizedBox(height: 50), // Add space between the buttons
      SizedBox(
        width: 312,
        height: 106, // Same width as the first button
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Hackathloginsu()),(route) => false,
            );
          },
          child: Text(
            "SUPERVISOR",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    ],
  ),
),

),);
  }
}