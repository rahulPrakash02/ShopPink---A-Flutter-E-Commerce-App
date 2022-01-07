// @dart=2.9

import 'package:flutter/material.dart';

import 'CustomHomePage.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        color: Colors.pink[400],
        home: Scaffold(
          body: CustomHomePage(),
        ));
  }
}
