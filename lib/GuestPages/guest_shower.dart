import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
/*Page that allows guests to sign up for showers*/
class GuestShowerPage extends StatefulWidget {
  const GuestShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<GuestShowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shower'),
        backgroundColor: Colors.blue,
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
                      icon: const Icon(Icons.shower),
                      iconSize: 100,
                      color: Colors.blue,
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
  CollectionReference shower = FirebaseFirestore.instance.collection('showers');

  var currentUser = FirebaseAuth.instance.currentUser;

  String? email = "";

  if (currentUser != null) {
    email = currentUser.email;
  }

  FirebaseFirestore.instance
      .collection('showers')
      .orderBy("index", descending: true)
      .limit(1)
      .get()
      .then((QuerySnapshot querySnapshot) {
    var index = querySnapshot
        .docs[0]["index"]; //Everything above here in the method is to find the highest previous index
    index = index + 1;
    shower.add({ //add new name to shower line with an incremented index
      'name': email,
      'index': index
    });
  });
}

void findSpot()
{}