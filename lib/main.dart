import 'package:flutter/material.dart' as flutter;
import 'package:swipest_signing/src/container.dart';
import 'package:swipest_signing/src/container_controller.dart';

void main() {
  flutter.runApp(const MyApp());
}

class MyApp extends flutter.StatelessWidget {
  const MyApp({flutter.Key? key}) : super(key: key);

  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.MaterialApp(
      title: 'swipest_signing',
      home: Container(Controller()),
    );
  }
}
