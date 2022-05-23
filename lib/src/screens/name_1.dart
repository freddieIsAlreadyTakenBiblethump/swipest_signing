import 'package:flutter/material.dart';

import '../controller.dart';
import '../util/text_field.dart';

class Name1Step extends StatefulWidget {

  final Controller controller;

  const Name1Step(this.controller, {Key? key}) : super(key: key);

  @override
  State<Name1Step> createState() => _Name1StepState();
}

class _Name1StepState extends State<Name1Step> {

  final _formKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _surenameKey = GlobalKey<FormFieldState>();

  final _nameController = TextEditingController();
  final _surenameController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.controller.dataCollector.getName();
    _surenameController.text = widget.controller.dataCollector.getSurename();

    super.initState();
  }

  late final _nameTextField = SwipestTextFormField(
    widgetKey: _nameKey,
    controller: _nameController,
    text: 'IMIĘ',
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Pole nie może być puste';
      }

      return null;
    },
    onEditingComplete: () => _nameKey.currentState!.validate(),
    obscure: false,
  );

  late final _surnameTextField = SwipestTextFormField(
    widgetKey: _surenameKey,
    controller: _surenameController,
    text: 'NAZWISKO',
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Pole nie może być puste';
      }

      return null;
    },
    onEditingComplete: () => _nameKey.currentState!.validate(),
    obscure: false,
  );

  late final _signUpAndAcceptButton = SizedBox(
    width: 220,
    child: TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          widget.controller.dataCollector.setName(_nameKey.currentState!.value);
          widget.controller.dataCollector.setSurname(_surenameKey.currentState!.value);
          widget.controller.show(SigningPhase.second);
        }
      },
      child: const Text(
        'Stwórz konto i zaakceptuj',
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
              'Jak ci na imię?',
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
                child: _nameTextField,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _surnameTextField,
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
              _signUpAndAcceptButton,
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
        widget.controller.show(SigningPhase.signIn);
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
