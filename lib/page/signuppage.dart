import 'package:chat_application/model/user.dart';
import 'package:chat_application/page/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/uihelper.dart';
class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  TextEditingController emailcon= TextEditingController();
  TextEditingController passwordcon= TextEditingController();
  TextEditingController cpasswordcon= TextEditingController();

  void checkValues() {
    String email = emailcon.text.trim();
    String password = passwordcon.text.trim();
    String cPassword = cpasswordcon.text.trim();

    if(email == "" || password == "" || cPassword == "") {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    }
    else if(password != cPassword) {
      UIHelper.showAlertDialog(context, "Password Mismatch", "The passwords you entered do not match!");
    }
    else {
      signup(email, password);
    }
  }

  void signup(String email,String password){
    UserCredential? credential;
    UIHelper.showLoadingDialog(context, "Creating new account..");
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(ex) {
      Navigator.pop(context);

      UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
    }
    if(credential != null) {
      String uid = credential.user!.uid;
      usermodel newUser = usermodel(
          uid: uid,
          email: email,
          fullname: "",
          profilePic: ""
      );
      
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: 355,
                margin: EdgeInsets.only(left: 0,top: 125),
                child: Text(
                  "Peek-a-boo!",
                  style: TextStyle(
                      fontWeight:FontWeight.bold ,
                      fontSize: 50
                  ),
                ),
              ),
              Container(
                width: 355,
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "You are Doing good.",
                  style: TextStyle(
                      fontWeight:FontWeight.w500 ,
                      fontSize: 20
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
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Conform Password",
                        ),
                      controller: cpasswordcon,
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return profile();
                        }));
                      },
                      color: Colors.blue[400],
                      child: Text("Create Account"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
