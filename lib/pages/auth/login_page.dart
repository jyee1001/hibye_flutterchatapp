import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/widgets/widgets.dart';
import 'package:hibye_flutterchatapp/pages/auth/register_page.dart';

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
                    },
                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: Icon(Icons.lock, color: Colors.black)),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: Text("Sign In")),
                  SizedBox(height: 30),
                  Text.rich(TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Register here",
                            style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, const RegisterPage());
                              }),
                      ])),
                ],
              ),
            )),
      ),
    );
  }

  login() {
    if (formKey.currentState!.validate()) {}
  }
}
