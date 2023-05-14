import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromRGBO(226, 222, 208, 100), width: 2)),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}