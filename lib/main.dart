import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icon Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Andre House'),
      ),
      body: Column(children: <Widget>[
        //icon with label below it
        Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Icon(Icons.shower, color:Colors.blue, size: 150),
              Text('Shower', style: TextStyle(fontSize: 25)),
            ],
          ),
        )
      ]),
    );
  }


}