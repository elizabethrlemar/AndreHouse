import 'package:flutter/material.dart';
/* Page that allows guests to sign up for Clothing Closet*/
class GuestClothingPage extends StatefulWidget {
  const GuestClothingPage({Key? key}) : super(key: key);
  @override
  _ClothingState createState() => _ClothingState();
}

class _ClothingState extends State<GuestClothingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clothing Closet'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child: Container(
              width: double.infinity,
            child:
              Align(
                alignment: Alignment.bottomCenter,
                child:
                ButtonTheme.fromButtonThemeData(
                    data: Theme.of(context).buttonTheme.copyWith(
                        minWidth: 300.0,
                        height: 50.0,
                        buttonColor: Colors.green,
                    ),
                    child: RaisedButton(
                    onPressed: (){} ,
                    child: const Text ('Get in Line',
                      style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
              )
          )
      ),
      )
    );
  }
}