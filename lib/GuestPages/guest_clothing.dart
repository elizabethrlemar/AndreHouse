import 'package:flutter/material.dart';

class GuestClothingPage extends StatefulWidget {
  const GuestClothingPage({Key? key}) : super(key: key);
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<GuestClothingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clothing Closet'),
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