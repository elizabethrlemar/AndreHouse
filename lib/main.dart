import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> fbapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Material App
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: FutureBuilder(
          future: fbapp,
          builder: (context, snapshot){
            if (snapshot.hasError){
              return const Text("Something went wrong");
            }
            else if(snapshot.hasData) {
              return HomeScreen();
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
      }),
    );
  }
}

