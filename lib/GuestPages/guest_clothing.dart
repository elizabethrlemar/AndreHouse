import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
/* Page that allows guests to sign up for Clothing Closet*/
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
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: <Widget>[
                Expanded(
                    child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.checkroom),
                                iconSize: 100,
                                color: Colors.red,
                                onPressed: () {joinLine();},
                              )
                          ),
                          const Text(
                            'Sign-Up',
                            style: TextStyle(fontSize: 20),
                          )
                        ]
                    )
                ),
                Expanded(
                    child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.shower),
                                iconSize: 100,
                                color: Colors.blue,
                                onPressed: () {findSpot();},
                              )
                          ),
                          const Text(
                            'My Spot in Line',
                            style: TextStyle(fontSize: 20),
                          )
                        ]
                    )
                ),
              ]
          )
      ),
    );
  }
}

void joinLine() {
  var name = "test";
  CollectionReference clothing = FirebaseFirestore.instance.collection('clothing');

  FirebaseFirestore.instance
      .collection('clothing')
      .orderBy("index", descending: true)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) {
    var index = querySnapshot
        .docs[0]["index"]; //Everything above here in the method is to find the highest previous index
    index = index + 1;
    clothing.add({ //add new name to clothing line with an incremented index
      'name': name,
      'index': index
    });
  });
}

void findSpot()
{

  CollectionReference clothing = FirebaseFirestore.instance.collection('clothing');

  var currentUser = FirebaseAuth.instance.currentUser;

  String? email = "";
  if (currentUser != null) {
    email = currentUser.email;
  }

  FirebaseFirestore.instance
      .collection('clothing')
      .where('name', isEqualTo: email)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) {
    var index = querySnapshot.docs[0]["index"];
    print("The user's index is " + index.toString());
  });

}