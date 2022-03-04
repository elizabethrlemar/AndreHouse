import 'package:flutter/material.dart';
/*Page that allows guests to sign up for showers*/
class AnonShowerPage extends StatefulWidget {
  const AnonShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<AnonShowerPage> {
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
                      onPressed: () {},
                    )
                  ),
                    const Text(
                      'Sign-Up',
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