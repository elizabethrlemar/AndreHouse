import 'package:flutter/material.dart';

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
        title: const Text('Andre House'),
      ),
      body: Column(children: <Widget>[
        Expanded(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: const <Widget>[
              Expanded(
              child: IconButton(
                icon: Icon(Icons.shower),
                iconSize: 100,
                color: Colors.red,
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
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: const <Widget>[
              Expanded(
              child: IconButton(
                icon: Icon(Icons.checkroom),
                iconSize: 100,
                color: Colors.red,
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
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: const <Widget>[
              Expanded(
              child: IconButton(
                icon: Icon(Icons.help),
                iconSize: 100,
                color: Colors.red,
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
