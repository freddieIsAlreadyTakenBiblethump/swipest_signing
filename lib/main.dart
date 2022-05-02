import 'package:flutter/material.dart';
import 'package:swipest_registration/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'swipest_signing',
      home: Scaffold(
        body: Landing(),
      ),
    );
  }
}
