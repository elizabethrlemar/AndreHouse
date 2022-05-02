
import 'package:andre_house/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'guest_shower.dart';
import 'guest_clothing.dart';
import 'help_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome back!"),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset("images/door.png"),
          onPressed: () { },
        ),
      ),
      body: Center(
          child: Container(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: <Widget>[
                  Expanded(
                  child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.shower),
                          iconSize: 100,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                        MaterialPageRoute(builder: (context) => const GuestShowerPage()),
                            );}, // onPressed
                        ),
                      ),
                        const Text(
                          'Showers',
                          style: TextStyle(fontSize: 20),
                        ),
                    ],
                  ),
                  ),
                  ),
              //icon with label below it
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                                icon: const Icon(Icons.checkroom),
                                iconSize: 100,
                                color: Colors.pink,
                                onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const GuestClothingPage()),
                                    );} // onPressed
                             ),
                          ),
                          const Text(
                            'Clothing Closet',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.help),
                              iconSize: 100,
                              color: Colors.green,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const GuestHelpPage()),
                                );}
                            ),),
                          const Text(
                            'Help',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: IconButton(
                                  icon: const Icon(Icons.logout),
                                  iconSize: 100,
                                  color: Colors.black,
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                                    );}
                              ),),
                            const Text(
                              "Logout",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
          ),
        ),
    );
  }
}


