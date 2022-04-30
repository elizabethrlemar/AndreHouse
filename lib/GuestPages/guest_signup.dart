import 'package:andre_house/login_page.dart';
import 'package:andre_house/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final auth = FirebaseAuth.instance;

  final firstNameEditController = TextEditingController();
  final lastNameEditController = TextEditingController();
  final usernameEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final firstNameForm = TextFormField(
        autofocus: false,
        controller: firstNameEditController,
        keyboardType: TextInputType.name,
        validator: (value){
          RegExp reg = RegExp(r'^.{2,}$');
          if(value!.isEmpty){
            return("First name cannot be empty");
          }
          if(!reg.hasMatch(value)){
            return("First name must be at least 2 letters");
          }
          return null;
        },
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
        validator: (value){
          RegExp reg = RegExp(r'^.{2,}$');
          if(value!.isEmpty){
            return("Last name cannot be empty");
          }
          if(!reg.hasMatch(value)){
            return("Last name must be at least 2 letters");
          }
          return null;
        },
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

    final usernameEditForm = TextFormField(
        autofocus: false,
        controller: usernameEditController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          RegExp reg = RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return("Username cannot be empty");
          }
          if(!reg.hasMatch(value)){
            return("Password must be at least 6 letters");
          }
          return null;
        },
        onSaved: (value){
          usernameEditController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordEditForm = TextFormField(
        autofocus: false,
        controller: passwordEditController,
        obscureText: true,
        validator: (value){
          RegExp reg = RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return("Password cannot be empty");
          }
          if(!reg.hasMatch(value)){
            return("Password must be at least 6 letters");
          }
          return null;
        },
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
        validator: (value){
          if(confirmPasswordEditController.text != passwordEditController.text){
            return("Passwords don't match");
          }
          return null;
        },
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
            onPressed: () {
              signUp(usernameEditController.text + "@andrehouse.com", passwordEditController.text);
            },
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
                              usernameEditForm,
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

  void signUp(String email, String password) async{
    if(formKey.currentState!.validate()) {
      await auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
      });
    }
  }

  postDetailsToFirestore() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();

    userModel.username = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditController.text;
    userModel.lastName = lastNameEditController.text;
    userModel.userType = "guest";

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MyHomePage()));
  }
}
