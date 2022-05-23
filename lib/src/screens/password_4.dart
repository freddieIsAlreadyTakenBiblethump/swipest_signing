import 'package:flutter/material.dart';

import '../controller.dart';
import '../util/text_field.dart';

class Password4Step extends StatefulWidget {

  final Controller controller;

  const Password4Step(this.controller, {Key? key}) : super(key: key);

  @override
  State<Password4Step> createState() => _Password4StepState();
}

class _Password4StepState extends State<Password4Step> {

  final _formKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final _passwordController = TextEditingController();

  @override
  void initState() {
    _passwordController.text = widget.controller.dataCollector.getPassword();

    super.initState();
  }

  late final _passwordTextField = SwipestTextFormField(
    widgetKey: _passwordKey,
    controller: _passwordController,
    text: 'HASŁO',
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Pole nie może być puste';
      }

      if (value.length < 8) {
        return 'Hasło nie może mieć mniej niż 8 znaków';
      }

      return null;
    },
    onEditingComplete: () => _passwordKey.currentState!.validate(),
    obscure: false,
  );

  late final _continueButton = SizedBox(
    width: 150,
    child: TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          widget.controller.dataCollector.setPassword(_passwordKey.currentState!.value);
          widget.controller.show(SigningPhase.fifth);
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
          top: 135,
          right: 0,
          bottom: 0,
          left: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Ustaw hasło',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 170,
          right: 0,
          bottom: 0,
          left: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Twoje hasło powinno mieć conajmniej 8 znaków',
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                ),
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
                child: _passwordTextField,
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
        widget.controller.show(SigningPhase.third);
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
