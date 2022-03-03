import 'package:flutter/material.dart';
import 'package:andre_house/GuestPages/guest_signup.dart';
import 'package:andre_house/UI/input_field.dart';
import 'package:andre_house/StaffPages/staff_homepage.dart';
import 'package:andre_house/GuestPages/guest_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super (key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final emailForm = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: ,
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

    final passwordForm = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //validator: ,
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
        color: Colors.transparent,
        child: Material(
          elevation: 5,
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage()));
            },
            child: const Text("Login", style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
          ),
        ));

    return Scaffold(
      //Scaffold
      backgroundColor: Colors.indigo,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
          child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 400,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child:
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 90,
                              child: Image.asset("images/logo.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 25),
                            emailForm,
                            const SizedBox(height: 8),
                            passwordForm,
                            const SizedBox(height: 25),
                            loginButton,
                            const SizedBox(height: 25),
                            Row(
                              children: <Widget> [
                                const Text("Don't have an account?", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const SignUpScreen()));
                                  },
                                  child: const Text(
                                    " Sign Up!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            const SizedBox(height: 25),
                          ]
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: RaisedButton(
                        //Raised Button
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: const Text(
                          "Anonymous Login",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
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