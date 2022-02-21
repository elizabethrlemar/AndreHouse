import 'package:flutter/material.dart';

class StaffClothingPage extends StatefulWidget {
  const StaffClothingPage({Key? key}) : super(key: key);
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<StaffClothingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clothing Closet'),
        backgroundColor: Colors.pink,
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