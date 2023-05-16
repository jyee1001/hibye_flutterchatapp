import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/pages/profile_page.dart';

import '../service/auth_service.dart';
import '../widgets/widgets.dart';
import 'auth/login_page.dart';
import 'home_page.dart';

class AboutPage extends StatefulWidget {
  String userName;
  String email;
  AboutPage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("About HiBye"),
          backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        ),
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              //padding: const EdgeInsets.symmetric(vertical: 10),
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
                  userName,
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
                          userName: userName,
                          email: email,
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
                  onTap: () {},
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  leading: const Icon(Icons.info_outline, color: Colors.black),
                  title: const Text(
                    "About",
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
                  "HiBye is a mobile chat app that was created to keep communities in touch with one another through times where in-person interaction is not an option. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Stay in touch and have fun!",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            ),
          ],
        ));
  }
}
