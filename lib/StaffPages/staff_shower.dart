import 'package:flutter/material.dart';
/*Page for staff to manage showers*/
class StaffShowerPage extends StatefulWidget {
  const StaffShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<StaffShowerPage> {
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
                            'View Line',
                            style: TextStyle(fontSize: 20),
                          )
                        ]
                    )
                ),
                Expanded(
                    child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.numbers),
                                iconSize: 100,
                                color: Colors.red,
                                onPressed: () {},
                              )
                          ),
                          const Text(
                            "Manage Line",
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