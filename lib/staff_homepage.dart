import 'package:flutter/material.dart';

class MyStaffHomePage extends StatefulWidget {
  const MyStaffHomePage({Key? key}) : super(key: key);
  @override
  _MyStaffHomePageState createState() => _MyStaffHomePageState();
}

class _MyStaffHomePageState extends State<MyStaffHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                Expanded(
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.shower),
                    iconSize: 100,
                    color: Colors.blue,
                    onPressed: null,
                  ),),
                Text(
                  'Shower',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),),),
        //icon with label below it
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                Expanded(
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.checkroom),
                    iconSize: 100,
                    color: Colors.pink,
                    onPressed: null,
                  ),),
                Text(
                  'Clothing Closet',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.account_circle),
                    iconSize: 100,
                    color: Colors.purple,
                    onPressed: null,
                  ),),
                Text(
                  'Guests',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),),),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.add_circle),
                    iconSize: 100,
                    color: Colors.orange,
                    onPressed: null,
                  ),),
                Text(
                  'Create New Account',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),),),

        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.help),
                    iconSize: 100,
                    color: Colors.green,
                    onPressed: null,
                  ),),
                Text(
                  'Help',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),),),

      ]),
    );
  }
}