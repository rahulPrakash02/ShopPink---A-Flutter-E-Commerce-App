import 'package:flutter/material.dart';

import 'CustomHomePage.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
