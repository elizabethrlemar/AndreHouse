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
        centerTitle: true,
        title: const Text('Shower'),
        backgroundColor: Colors.blue,
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