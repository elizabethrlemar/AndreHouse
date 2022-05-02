import 'package:andre_house/login_page.dart';
import 'package:flutter/material.dart';
import 'anon_clothing.dart';
import 'anon_shower.dart';
import 'help_page.dart';

class AnonHomePage extends StatefulWidget {
  const AnonHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AnonHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome back!"),
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
                        MaterialPageRoute(builder: (context) => const AnonShowerPage()),
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
                                      MaterialPageRoute(builder: (context) => const AnonClothingPage()),
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
                              icon: Icon(Icons.help),
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
