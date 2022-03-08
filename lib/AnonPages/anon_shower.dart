import 'package:flutter/material.dart';
/*Page that allows guests to sign up for showers*/
class AnonShowerPage extends StatefulWidget {
  const AnonShowerPage({Key? key}) : super(key: key);
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<AnonShowerPage> {

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameForm = TextFormField(
        autofocus: false,
        controller: nameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your name");
          }
          return null;
        },
        onSaved: (value) {
          nameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
          hintText: "Your name",
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
            minWidth: MediaQuery
                .of(context)
                .size
                .width,
            onPressed: () {
              print(nameController.text);
            },
            child: const Text("Submit Name", style: TextStyle(fontSize: 20)),
            textColor: Colors.white,
          ),
        ));

    return Scaffold(
      //Scaffold
      backgroundColor: Colors.indigo,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.lightBlueAccent,
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 400,
                height: 460,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child:
                      Form(
                        child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 90,
                                child: Image.asset("images/logo.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 25),
                              nameForm,
                              const SizedBox(height: 25),
                              loginButton,
                              const SizedBox(height: 25),
                              const SizedBox(height: 25),
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