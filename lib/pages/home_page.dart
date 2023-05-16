import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hibye_flutterchatapp/pages/search_page.dart';
import 'package:hibye_flutterchatapp/service/database_service.dart';

import '../service/auth_service.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  Stream? groups;

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState() {
        groups = snapshot;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
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
      ),
      body: groupList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popUpDialog(context);
        },
        elevation: 0,
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  popUpDialog(BuildContext context) {}
  groupList() {
    return StreamBuilder(
        stream: groups,
        builder: (context, AsyncSnapshot snapshot) {
          //print(snapshot.hasData);
          if (snapshot.hasData) {
            if (snapshot.data['groups'] != null) {
              if (snapshot.data['groups'].length != 0) {
                return Text("hello");
              } else {
                return noGroupWidget();
              }
            } else {
              return noGroupWidget();
            }
          } else {
            //return noGroupWidget();
            return Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          }
        });
  }

  noGroupWidget() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: Color.fromRGBO(51, 51, 51, 1),
              size: 75,
            )
          ],
        ));
  }
}
