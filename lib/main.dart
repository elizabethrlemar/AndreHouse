import 'package:flutter/material.dart';
import 'guest_homepage.dart';
import 'staff_homepage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icon Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyStaffHomePage(),
    );
  }
}