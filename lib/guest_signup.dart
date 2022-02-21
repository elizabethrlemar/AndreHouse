import 'package:andre_house/login_page.dart';
import 'package:flutter/material.dart';
import 'package:andre_house/UI/input_field.dart';
import 'package:andre_house/StaffPages/staff_homepage.dart';
import 'package:andre_house/GuestPages/guest_homepage.dart';
//import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Guest Sign-up",
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  //StateFullWidget
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Form(
                      child: InputField(
                        //Calling inputField  class
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          "Full Name"),
                    ),
                    Form(
                      child: InputField(
                        //Calling inputField  class

                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          "Username"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Password"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Confirm Password"),
                    ),
                    Container(
                      width: 150,
                      child: RaisedButton(
                        //Raised Button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                        },
                        color: Colors.indigo,
                        textColor: Colors.white,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child:
                        Row(
                          children: <Widget> [
                            const Text ("Already have an account?"),
                            TextButton(
                              child: const Text(
                                "Log In!",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
