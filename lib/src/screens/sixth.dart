import 'package:flutter/material.dart';

import '../controller.dart';
import '../util/text_field.dart';

class Sixth extends StatefulWidget {

  final Controller controller;

  const Sixth(this.controller, {Key? key}) : super(key: key);

  @override
  State<Sixth> createState() => _SixthState();
}

class _SixthState extends State<Sixth> {

  final _formKey = GlobalKey<FormState>();
  final _genderKey = GlobalKey<FormFieldState>();
  final _otherGenderKey = GlobalKey<FormFieldState>();

  bool _shouldShowGenderTextField = false;

  @override
  Widget build(BuildContext context) {
    const _border = UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          color: Colors.black12,
        ));

    final genderDropdownButton = DropdownButtonFormField(
      key: _genderKey,
      decoration: const InputDecoration(
        labelText: 'PŁEĆ',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          color: Colors.black26,
          fontSize: 13,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: _border,
        disabledBorder: _border,
        enabledBorder: _border,
        errorBorder: _border,
        focusedBorder: _border,
        focusedErrorBorder: _border,
        errorStyle: TextStyle(fontSize: 10),
      ),
      items: <String>['kobieta', 'mężczyzna', 'inna'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        );
      }).toList(),
      onChanged: (selected) {
        if (selected == 'inna') {
          setState((){
            _shouldShowGenderTextField = true;
          });
        } else {
          setState((){
            _shouldShowGenderTextField = false;
          });
        }
        _genderKey.currentState!.validate();
      },
      validator: (value) {
        if (value == null || (value as String).isEmpty) {
          return 'Pole nie może być puste';
        }

        return null;
      },
    );

    final otherGenderTextField = SwipestTextFormField(
      widgetKey: _otherGenderKey,
      text: 'INNA PŁEĆ',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Pole nie może być puste';
        }

        return null;
      },
      onEditingComplete: () => _otherGenderKey.currentState!.validate(),
      onChanged: (_) {

      },
    );

    final continueButton = SizedBox(
      width: 150,
      child: TextButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // TODO registration process
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

    final form = Form(
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
                  child: genderDropdownButton,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: _shouldShowGenderTextField
                      ? otherGenderTextField
                      : Container()
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
                continueButton,
              ],
            ),
          ),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () {
        widget.controller.show(SigningPhase.fifth);
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
              child: Center(child: form),
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
