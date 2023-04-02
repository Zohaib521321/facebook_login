import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home screen")
          ,ElevatedButton(onPressed: () async{
        await FirebaseAuth.instance.signOut();

        await FacebookAuth.instance.logOut();
        Navigator.pop(context);


    }, child: Text("Logout"))
          ],

        ),
      ),
    );

  }
}
