import 'package:andre_house/StaffPages/staff_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class GuestCreatePage extends StatefulWidget {
  const GuestCreatePage({Key? key}) : super(key: key);
  @override
  _CreateState createState() => _CreateState();
}

List<String> userChecked = [];

class _CreateState extends State<GuestCreatePage> {
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
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              signUp(usernameEditController.text + "@andrehouse.com", passwordEditController.text);
            },
            child: const Text("Create Account", style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create Guest'),
        backgroundColor: Colors.orange,
      ),
      //Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                                child: Icon(Icons.account_circle)
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

    if (userModel.userType == "guest"){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyStaffHomePage()));
    }
  }
}
