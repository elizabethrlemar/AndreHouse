import 'package:andre_house/StaffPages/staff_clothing.dart';
import 'staff_shower.dart';
import 'package:flutter/material.dart';
/*Staff Homepage, contains all needed links*/
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
      body: Center(
        child: Container(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[ //Shower Button
                      Expanded(
                        child: IconButton(
                            padding: EdgeInsets.all(10),
                            icon: Icon(Icons.shower),
                            iconSize: 100,
                            color: Colors.blue,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StaffShowerPage()),
                              );
                            }),
                      ),
                      Text(
                        'Showers',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[ //Clothing Closet Button
                      Expanded(
                        child: IconButton(
                            padding: EdgeInsets.all(10),
                            icon: Icon(Icons.checkroom),
                            iconSize: 100,
                            color: Colors.pink,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StaffClothingPage()),
                              );
                            }),
                      ),
                      Text(
                        'Clothing Closet',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              // Existing Account Button
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[
                      Expanded(
                        child: IconButton( //Guest List Button
                          icon: Icon(Icons.account_circle),
                          iconSize: 100,
                          color: Colors.purple,
                          onPressed: null,
                        ),
                      ),
                      Text(
                        'Guests',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              // New Account Button
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[ //Account Creation Button
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.add_circle),
                          iconSize: 100,
                          color: Colors.orange,
                          onPressed: null,
                        ),
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: const <Widget>[ // Help Button
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.help),
                          iconSize: 100,
                          color: Colors.green,
                          onPressed: null,
                        ),
                      ),
                      Text(
                        'Help',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
