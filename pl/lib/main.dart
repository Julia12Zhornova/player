import 'package:flutter/material.dart';
import 'package:pl/auth.dart';

void main() {
  runApp(PlayerApp());
}

class PlayerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: AuthorizationPage()
    );
  }
}




