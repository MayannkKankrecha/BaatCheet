import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                CupertinoButton(
                  onPressed: (){},
                  child: CircleAvatar(
                    radius: 70,
                    child: Icon(Icons.person,size: 80),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "User Name",
                  ),
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  onPressed: (){},
                  color: Colors.blue[400],
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
