import 'package:flutter/material.dart';

import '../service/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
          child: ElevatedButton(
              child: Text("LOGOUT"),
              onPressed: () {
                authService.signOut();
              })),
    );
  }
}
