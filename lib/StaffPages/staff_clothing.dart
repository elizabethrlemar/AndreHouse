import 'package:flutter/material.dart';
/*Page for staff to manage clothing closet*/
class StaffClothingPage extends StatefulWidget {
  const StaffClothingPage({Key? key}) : super(key: key);
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<StaffClothingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clothing Closet'),
        backgroundColor: Colors.pink,
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
                                icon: const Icon(Icons.checkroom),
                                iconSize: 100,
                                color: Colors.red,
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
                                icon: const Icon(Icons.tune),
                                iconSize: 100,
                                color: Colors.green,
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