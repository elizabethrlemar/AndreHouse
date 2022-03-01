import 'package:flutter/material.dart';
/*Page that allows guests to sign up for showers*/
class GuestShowerPage extends StatefulWidget {
  const GuestShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<GuestShowerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shower'),
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
            Expanded(
              child: Column(
                children: <Widget>[
                    const Text(
                      "My Spot in Line",
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