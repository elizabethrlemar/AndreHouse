import 'package:flutter/material.dart';

class StaffNewUserPage extends StatefulWidget {
  const StaffNewUserPage({Key? key}) : super(key: key);
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<StaffNewUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New User'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}