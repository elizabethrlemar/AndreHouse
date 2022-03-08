import 'package:flutter/material.dart';
/* Page that allows guests to sign up for Clothing Closet*/
class AnonClothingPage extends StatefulWidget {
  const AnonClothingPage({Key? key}) : super(key: key);
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<AnonClothingPage> {
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