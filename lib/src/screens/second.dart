import 'package:flutter/material.dart';

import '../controller.dart';
import '../util/text_field.dart';

class Second extends StatefulWidget {

  final Controller controller;

  const Second(this.controller, {Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {

  final _formKey = GlobalKey<FormState>();
  final _birthdayKey = GlobalKey<FormFieldState>();

  final _birthdayController = TextEditingController();

  @override
  void initState() {
    _birthdayController.text = widget.controller.dataCollector.getBirthday();

    super.initState();
  }

  late final _birthdayTextField = SwipestTextFormField(
    widgetKey: _birthdayKey,
    controller: _birthdayController,
    text: 'URODZINY',
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Pole nie może być puste';
      }

      return null;
    },
    onEditingComplete: () => _birthdayKey.currentState!.validate(),
  );

  late final _continueButton = SizedBox(
    width: 150,
    child: TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          widget.controller.dataCollector.setBirthday(_birthdayKey.currentState!.value);
          widget.controller.show(SigningPhase.third);
        }
      },
      child: const Text(
        'Kontynuuj',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xffff3379),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
  );

  late final _form = Form(
    key: _formKey,
    child: Stack(
      children: [
        const Positioned(
          top: 145,
          right: 0,
          bottom: 0,
          left: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Kiedy są twoje urodziny?',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
        ),
        Positioned(
          top: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _birthdayTextField,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Column(
            children: [
              _continueButton,
            ],
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.controller.show(SigningPhase.first);
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(70),
            child: SizedBox(
              width: double.infinity,
              height: _calculateMainHeight(),
              child: Center(child: _form),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateMainHeight() {
    double bottomInset;
    bottomInset = MediaQuery.of(context).viewInsets.bottom;

    if (bottomInset != 0) {

      double screenHeight;
      screenHeight = MediaQuery.of(context).size.height;

      double verticalInsets;
      verticalInsets = MediaQuery.of(context).viewInsets.vertical;

      double paddingCorrection;
      paddingCorrection = 25;

      return screenHeight - verticalInsets - paddingCorrection;
    } else {
      return double.infinity;
    }
  }
}
