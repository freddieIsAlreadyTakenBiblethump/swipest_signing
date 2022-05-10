import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:swipest_signing/src/controller.dart';

import '../controller.dart';
import '../util/text_field.dart';

class SignIn extends StatefulWidget {

  final Controller controller;

  const SignIn(this.controller, {Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  late final _emailTextField = SwipestTextFormField(
    widgetKey: _emailKey,
    text: 'EMAIL',
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Pole nie może być puste';
      }

      if (!EmailValidator.validate(value)) {
        return 'Niewłaściwy email';
      }

      return null;
    },
    onEditingComplete: () => _emailKey.currentState!.validate(),
    obscure: false,
  );

  late final _passwordTextField = SwipestTextFormField(
    widgetKey: _passwordKey,
    text: 'PASSWORD',
    validator: (value) {
      if (value == null || value.isEmpty || value.length < 8) {
        return 'Wprowadź conajmniej 8 znaków';
      }

      if (value.length > 20) {
        return 'Maksymalna długość to 20 znaków';
      }
    },
    onEditingComplete: () => _passwordKey.currentState!.validate(),
    obscure: true,
  );

  late final _logInButton = SizedBox(
    width: 150,
    child: TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // TODO implement action
        }
      },
      child: const Text(
        'Zaloguj',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
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

  late final _createAccoundButton = SizedBox(
    width: 150,
    child: TextButton(
      onPressed: () {
        // TODO pass to registration
      },
      child: const Text(
        'Załóż konto',
        style: TextStyle(
            color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
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
        Positioned(
          top: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _emailTextField,
              ),
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
              _logInButton,
              _createAccoundButton,
            ],
          ),
        ),
      ],
    ),
  );

  double calculateMainHeight() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: SizedBox(
            width: double.infinity,
            height: calculateMainHeight(),
            child: Center(child: _form),
          ),
        ),
      ),
    );
  }
}
