import 'package:andre_house/login_page.dart';
import 'package:flutter/material.dart';
import 'package:andre_house/UI/input_field.dart';
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

  final formKey= GlobalKey<FormState>();

  final firstNameEditController = TextEditingController();
  final lastNameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final firstNameForm = TextFormField(
        autofocus: false,
        controller: firstNameEditController,
        keyboardType: TextInputType.name,
        //validator: ,
        onSaved: (value){
          firstNameEditController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final lastNameForm = TextFormField(
        autofocus: false,
        controller: lastNameEditController,
        keyboardType: TextInputType.name,
        //validator: ,
        onSaved: (value){
          lastNameEditController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailEditForm = TextFormField(
        autofocus: false,
        controller: emailEditController,
        keyboardType: TextInputType.emailAddress,
        //validator: ,
        onSaved: (value){
          emailEditController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordEditForm = TextFormField(
        autofocus: false,
        controller: passwordEditController,
        obscureText: true,
        //validator: ,
        onSaved: (value){
          passwordEditController.text = value!;
        },
        textInputAction: TextInputAction.next,
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

    final confirmPasswordEditForm = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditController,
        obscureText: true,
        //validator: ,
        onSaved: (value){
          confirmPasswordEditController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
        color: Colors.transparent,
        child: Material(
          elevation: 5,
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {},
            child: const Text("Sign Up", style: TextStyle(fontSize: 20)),
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
                height: 470,
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
                              const SizedBox(height: 8),
                              firstNameForm,
                              const SizedBox(height: 8),
                              lastNameForm,
                              const SizedBox(height: 8),
                              emailEditForm,
                              const SizedBox(height: 8),
                              passwordEditForm,
                              const SizedBox(height: 8),
                              confirmPasswordEditForm,
                              const SizedBox(height: 8),
                              signUpButton,
                              const SizedBox(height: 8),
                              Row(
                                children: <Widget> [
                                  const Text("Already have an account?", style: TextStyle(fontSize: 20, color: Colors.indigo),),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => const HomeScreen()));
                                    },
                                    child: const Text(
                                      " Log In!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ]
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
