import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;

import 'container_controller.dart';

class Container extends StatefulWidget {

  final Controller controller;

  const Container(this.controller, {Key? key}) : super(key: key);

  @override
  State<Container> createState() => _ContainerState();
}

class _ContainerState extends State<Container> {

  Widget? _content;

  Widget _placeContent() {
    if (_content == null) {
      return flutter.Container();
    } else {
      return _content!;
    }
  }

  @override
  Widget build(BuildContext context) {

    _setContent(Widget content) {
      setState(() {
        _content = content;
      });
    }
    widget.controller.setContent = _setContent;

    return Scaffold(
      body: _placeContent(),
    );
  }
}
