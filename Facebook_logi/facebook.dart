import 'package:firebase/Facebook_logi/home.dart';
import 'package:firebase/Facebook_logi/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{

        "/homepage":(BuildContext context)=>Screen1()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("fluutter container"),

      ),

      body:
      ElevatedButton(
        onPressed: () {
          signInWithFacebook().then((value)
          {
            FirebaseFirestore.instance.collection("users").doc("facebook").collection("user2").add(
                {"email" : email,
                  });
          }
          ).catchError((e){
            print(e);
          }).then((value)
          {
            Navigator.pushNamed(context, "/homepage");
          }
          );
        },
        child: Text("login with facebook"),),
    );
  }

}



