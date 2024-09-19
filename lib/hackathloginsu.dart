
import 'package:basic_flutter/shiftinsup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hackathloginsu extends StatefulWidget {
  Hackathloginsu({super.key});

  @override
  State<Hackathloginsu> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Hackathloginsu> {
  bool isvisible = true;
  void updatevisibility() {
    setState(() {
      isvisible = !isvisible;
    });
  }
  String hardCodedUsername ="stevin";
  String hardCodedPassword ='stevin@2003';


  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Login Page",style: TextStyle(fontSize: 20, color:Colors.white),),backgroundColor: Colors.black,),

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.network("https://tse2.mm.bing.net/th?id=OIP.VixIl8SYp8qaYA-o_k_IJgHaHa&pid=Api&P=0&h=180"),
            Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Welcome", // Add the welcome text
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              
              child: TextField(decoration: InputDecoration(
                labelText:"Username", border:OutlineInputBorder()
              ),
              controller: usernamecontroller,
              
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                obscureText: isvisible,
                controller: passwordcontroller,
                decoration: InputDecoration(
               hintText:"Password", border:OutlineInputBorder(),
               suffixIcon:  IconButton(
                        onPressed: () {
                          updatevisibility();
                        },
                        icon: Icon(isvisible
                            ? Icons.visibility
                            : Icons.visibility_off))),

                           ),),
             
            ElevatedButton(onPressed: (){
              // print(usernamecontroller.text);
              // print(passwordcontroller.text);
              if(usernamecontroller.text==hardCodedUsername && passwordcontroller.text==hardCodedPassword){
                //storebooldata(true);
                Navigator.push(
                     context,
                      MaterialPageRoute(builder: (context) => const Shiftinsup()),
                    );
              }
              else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Invalid Username and Password'),
                 ));}
              // },
              //  Navigator.push(
              //        context,
              //        MaterialPageRoute(builder: (context) => const MyWidget()),
              //      );
                },
                child: Text("Login", style: TextStyle())),
                
        
          ],
        ),
      ),
    );
  }
}