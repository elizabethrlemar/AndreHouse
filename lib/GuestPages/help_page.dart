import 'package:flutter/material.dart';
class GuestHelpPage extends StatefulWidget {
  const GuestHelpPage({Key? key}) : super(key: key);
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<GuestHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: ListView(
            children: <Widget>[
              Container(
                child: Container(
                  alignment: Alignment.center,
                  padding:const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget> [
                      Container(
                        child: Text("Address ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ),
                      Container(
                        child: Text(" 213 S 11th Ave.", style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child: Text("Phoenix, AZ", style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child: Text("85007 \n", style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child: Text("Contact Us ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
                      ),
                      Container(
                        child: Text("(602)-255-0580\n", style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child: Text("Showers Hours ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
                      ),
                      Container(
                        child: Text("Monday - Thursday and Saturday", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        child: Text("1:00 pm - 3:00 pm\n", style: TextStyle(fontSize: 20),),
                      ),
                      Container(
                        child: Text("Clothing Closet Hours ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),),
                      ),
                      Container(
                        child: Text(" Monday and Thursday", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                        )
                      ),
                      Container(
                          child: Text("10:00 am - 12:00 pm", style: TextStyle(fontSize: 20,)
                          )
                      ),
                      Container(
                          child: Text("Saturday", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                          )
                      ),
                      Container(
                          child: Text("1:00 pm - 3:00 pm\n", style: TextStyle(fontSize: 20,)
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],

          ),
      );
  }
}