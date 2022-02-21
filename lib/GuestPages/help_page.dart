import 'package:flutter/material.dart';
class GuestHelpPage extends StatefulWidget {
  const GuestHelpPage({Key? key}) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<GuestHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}