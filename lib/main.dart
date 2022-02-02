import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icon Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

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
            Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(
              children: const <Widget>[
                IconButton(
                  icon: Icon(Icons.shower),
                  iconSize: 150,
                  color: Colors.blue,
                  onPressed: null,
                ),
                Text(
                  'Shower',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),),
          //icon with label below it
        Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(
            children: const <Widget>[
              IconButton(
                icon: Icon(Icons.checkroom),
                iconSize: 150,
                color: Colors.pink,
                onPressed: null,
              ),
              Text(
                'Clothing Closet',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
