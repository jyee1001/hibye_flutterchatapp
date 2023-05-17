import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/pages/profile_page.dart';

import '../service/auth_service.dart';
import '../widgets/widgets.dart';
import 'about_page.dart';
import 'auth/login_page.dart';
import 'home_page.dart';

class HelpPage extends StatefulWidget {
  String userName;
  String email;
  HelpPage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Help"),
          backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        ),
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.userName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  onTap: () {
                    nextScreenReplace(context, const HomePage());
                  },
                  selectedColor: Color.fromRGBO(51, 51, 51, 1),
                  selected: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.group, color: Colors.black),
                  title: const Text(
                    "Groups",
                    style: TextStyle(color: Colors.black),
                  ),
                ), //List Tile For Groups
                ListTile(
                  onTap: () {
                    nextScreenReplace(
                        context,
                        ProfilePage(
                          userName: widget.userName,
                          email: widget.email,
                        ));
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.group, color: Colors.black),
                  title: const Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {
                    nextScreenReplace(
                        context,
                        AboutPage(
                            userName: widget.userName, email: widget.email));
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.info_outline, color: Colors.black),
                  title: const Text(
                    "About",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.help, color: Colors.black),
                  title: const Text(
                    "Help",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Logout"),
                            content:
                                const Text("Are you sure you want to logout?"),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await authService.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                      (route) => false);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Image.asset("assets/HiByeLogo.jpg", width: 1000, height: 200),
              ],
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/HiByeLogo.jpg", width: 1000, height: 200),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Found a bug? Help us by reporting the problem\n Feedback is appreciated as well!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Developer Contact Info \n 888-888-8888\nhibyeadmin@hibye.com\n\n Thank you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24)),
            ),
          ],
        ));
  }
}
