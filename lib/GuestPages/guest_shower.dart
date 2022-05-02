import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/shower_model.dart';
import '../model/user_model.dart';
import 'guest_clothing.dart';
/*Page that allows guests to sign up for showers*/
bool _hasBeenPressed = false;
class GuestShowerPage extends StatefulWidget {
  const GuestShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<GuestShowerPage> {

  late String guestIndex = "Not in line";

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
              crossAxisCount: 1,
              children: <Widget>[
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
                          FutureBuilder(
                            future: findSpot(),
                            builder: (context, snapshot) {
                              return Text("My spot in line : $guestIndex",
                                  style: TextStyle(fontSize: 20));
                            },
                          ),
                        ]
                    )
                ),
                Expanded(
                    child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary:_hasBeenPressed ? Colors.orange : Colors.green ),
                                child: _hasBeenPressed ? const Text('Leave Line', style: TextStyle(fontSize: 20),): const Text('Join Line', style: TextStyle(fontSize: 20),),
                                onPressed: () async {
                                  setState(() {
                                    _hasBeenPressed = !_hasBeenPressed;
                                  });
                                  FirebaseFirestore.instance.collection("showers")
                                      .doc(
                                      FirebaseAuth.instance.currentUser!.uid)
                                      .get()
                                      .then((value) {
                                        if(_hasBeenPressed == true && value.exists == false){
                                          joinLine();
                                        }
                                        else{
                                          leaveLine();
                                        }
                                  });
                                }
                              ),
                            ),
                          )
                        ]
                    )
                ),

              ]
          )
      ),
    );
  }

  findSpot() async {
    final uid = await FirebaseAuth.instance.currentUser!.uid;
    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('showers')
          .where("uid", isEqualTo: uid)
          .get()
          .then((ds) {
        guestIndex = ds.docs[0]["index"].toString();
      }).catchError((e) {
        print(e);
      });
    }
  }

  Future<void> leaveLine() async {

    final uid = FirebaseAuth.instance.currentUser!.uid;
    late var currentIndex = 0;
    var showersRef = FirebaseFirestore.instance.collection('showers');

    FirebaseFirestore.instance.collection('showers')
        .where("uid", isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      showersRef.doc(querySnapshot.docs[0].id).delete();
    });

    if (uid != null) {
      await FirebaseFirestore.instance
          .collection('showers')
          .where("uid", isEqualTo: uid)
          .get()
          .then((ds) {
        currentIndex = ds.docs[0]["index"];
      }).catchError((e) {
        print(e);
      });
    }

    CollectionReference shower = FirebaseFirestore.instance.collection('showers');



    FirebaseFirestore.instance
        .collection('showers')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        if (element["index"] > currentIndex){
          FirebaseFirestore.instance
              .collection('showers')
              .doc(element.id)
              .update({
            'index': FieldValue.increment(-1)});
        }
      });
    });

    guestIndex = "Not in line";

  }

}


void joinLine() {

  CollectionReference shower = FirebaseFirestore.instance.collection('showers');

  var currentUser = FirebaseAuth.instance.currentUser;

  String? firstName = "";
  String? lastName = "";
  String? uid = "";

  if (currentUser != null) {
    FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      firstName = UserModel
          .fromMap(value.data())
          .firstName;
      lastName = UserModel
          .fromMap(value.data())
          .lastName;
      uid = UserModel
          .fromMap(value.data())
          .uid;
    });
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
      'name': firstName! + " " +  lastName!,
      'uid' : uid,
      'index': index
    });
  });
}


