import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/pages/search_page.dart';

import '../service/auth_service.dart';
import '../widgets/widgets.dart';

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
        appBar: AppBar(
      actions: [
        IconButton(
          onPressed: () {
            nextScreen(context, const SearchPage());
          },
          icon: const Icon(Icons.search),
        )
      ],
      centerTitle: true,
      title: Text("Groups", style: TextStyle(color: Colors.white)),
    ));
  }
}
