import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class StaffShowerPage extends StatefulWidget {
  const StaffShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

List<String> userChecked = [];

class _ShowerState extends State<StaffShowerPage> {

  List showerLine = [];
  bool checkBox = false;

  @override
  void initState(){
    super.initState();
    getShowerData();
  }

  getShowerData() async {
    dynamic result = await getLine();

    if(result == null){
      print("Can't get queue");
    }
    else{
      setState(() {
        showerLine = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shower'),
        backgroundColor: Colors.blue,
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
            itemCount: showerLine.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(showerLine[index]['name']),
                  leading: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon( Icons.shower, color: Colors.blue)
                  ),
                  trailing: Checkbox(
                      value: userChecked.contains(showerLine[index]['name']),
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
                        onSelected(value!, showerLine[index]['name']);
                      }),
                ),
              );
            },
          )
      ),
    );
  }
}

void deleteFromLine(List<String> line){

  var showersRef = FirebaseFirestore.instance.collection('showers');

  for(int i = 0; i < line.length; i++){
    FirebaseFirestore.instance.collection('showers')
        .where("name", isEqualTo: line[i])
        .get()
        .then((QuerySnapshot querySnapshot) {
          showersRef.doc(querySnapshot.docs[0].id).delete();
    });
  }
}

Future getLine() async{
  List showerList = [];
  try{
    await FirebaseFirestore.instance
        .collection('showers')
        .orderBy("index", descending: false)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        showerList.add(element.data());
      });
    });
    return showerList;
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

Widget sureCheck(BuildContext context) {
  return AlertDialog(
    title: const Text("Remove from shower line?"),

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
          deleteFromLine(userChecked);
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