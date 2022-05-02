import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class StaffUserPage extends StatefulWidget {
  const StaffUserPage({Key? key}) : super(key: key);
  @override
  _UserState createState() => _UserState();
}

List<String> userChecked = [];

class _UserState extends State<StaffUserPage> {

  List userList = [];

  @override
  void initState(){
    super.initState();
    getUserData();
  }

  getUserData() async {
    dynamic result = await getLine();

    if(result == null){
      print("Can't get queue");
    }
    else{
      setState(() {
        userList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
        backgroundColor: Colors.purple,
        actions: <Widget> [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => sureCheck(context),
              );
            },
            icon: const Icon(
              Icons.check_circle_outline,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Center(
          child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(userList[index]['firstName'] + " " + userList[index]['lastName']),
                  subtitle: Text(userList[index]['userType']),
                  leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon( Icons.account_circle, color: Colors.blue)
                  ),
                  trailing: Checkbox(
                      value: userChecked.contains(userList[index]['username']),
                      onChanged: (bool? value)
                      {
                        void onSelected(bool selected, String dataName) {
                          if (selected == true) {
                            setState(() {
                              userChecked.add(dataName);
                            });
                          } else {
                            setState(() {
                              userChecked.remove(dataName);
                            });
                          }
                        };
                        onSelected(value!, userList[index]['username']);
                      }),
                ),
              );
            },
          )
      ),
    );
  }
}

void deleteFromList(List<String> line){

  var usersRef = FirebaseFirestore.instance.collection('users');

  for(int i = 0; i < line.length; i++){
    FirebaseFirestore.instance.collection('users')
        .where("username", isEqualTo: line[i])
        .get()
        .then((QuerySnapshot querySnapshot) {
      usersRef.doc(querySnapshot.docs[0].id).delete();
    });
  }
}

Future getLine() async{
  List userList = [];
  try{
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        userList.add(element.data());
      });
    });
    return userList;
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

Widget sureCheck(BuildContext context) {
  return AlertDialog(
    title: const Text("Remove user account?"),

    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(""),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          deleteFromList(userChecked);
        },
        child: const Text('OK'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
    ],
  );
}