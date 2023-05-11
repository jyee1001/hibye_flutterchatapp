import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Image.asset("assets/HiByeLogo.jpg"),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(Icons.email, color: Colors.black)),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                          //print(email);
                        });
                      }),
                  const SizedBox(height: 15),
                  TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: Icon(Icons.lock, color: Colors.black)),
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
