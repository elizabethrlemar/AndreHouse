
import 'package:flutter/material.dart';
import 'package:andre_house/UI/input_field.dart';
import 'package:andre_house/StaffPages/staff_homepage.dart';
import 'package:andre_house/GuestPages/guest_homepage.dart';
import 'login_page.dart';
import 'guest_signup.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> fbapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: FutureBuilder(
          future: fbapp,
          builder: (context, snapshot){
            if (snapshot.hasError){
              return const Text("Something went wrong");
            }
            else if(snapshot.hasData) {
              return HomeScreen();
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
      }),
    );
  }
}

