
import 'package:flutter/material.dart';
import 'package:andre_house/UI/input_field.dart';
import 'package:andre_house/StaffPages/staff_homepage.dart';
import 'package:andre_house/GuestPages/guest_homepage.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: HomeScreen(),
    );
  }
}

