import 'package:chat_application/page/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/uihelper.dart';
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  TextEditingController emailcon= TextEditingController();
  TextEditingController passwordcon= TextEditingController();
  void checkValues() {
    String email = emailcon.text.trim();
    String password = passwordcon.text.trim();

    if(email == "" || password == "") {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    }
    else {
      // login(email, password);
    }
  }
  // void login(String email, String password) async {
  //   UserCredential? credential;
  //   try{
  //
  //   }catch{
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
             Container(
               padding: EdgeInsets.only(left: 0),
               width: 355,
               margin: EdgeInsets.only(left: 0,top: 150),
               child: Text(
                 "Welcome...",
                 style: TextStyle(
                   fontWeight:FontWeight.w300 ,
                   fontSize: 70
                 ),
               ),
             ),
              Container(
                width: 355,
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "in your world",
                  style: TextStyle(
                      fontWeight:FontWeight.bold ,
                      fontSize: 40
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25) ,
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                      controller: emailcon,
                    ),
                    SizedBox(height: 20),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                      controller: passwordcon,
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                        onPressed: (){},
                      color: Colors.blue[400],
                      child: Text("Login"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Never go to bed mad. Stay up and
            Text("If not now, then when?",style: TextStyle(fontSize: 16)),
            CupertinoButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return signuppage();
                })
                );
              },
              child: Text("Just Create an Account",style: TextStyle(fontSize: 16)),)
          ],
        ),
      ),
    );
  }
}
