import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipest_registration/text_field.dart';
import 'package:email_validator/email_validator.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  late final _form = Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SwipestTextFormField(
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
        ),
        SwipestTextFormField(
          widgetKey: _passwordKey,
          text: 'PASSWORD',
          validator: (value) {
            if (value == null || value.isEmpty || value.length < 8) {
              return 'Wprowadź conajmniej 8 znaków';
            }

            if (value.length > 20)  {
              return 'Maksymalna długość to 20 znaków';
            }
          },
          onEditingComplete: () => _passwordKey.currentState!.validate(),
        ),
        const Spacer(),
        SizedBox(
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
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
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
        ),
        SizedBox(
          width: 150,
          child: TextButton(
            onPressed: () {
              // TODO pass to registration
            },
            child: const Text(
              'Załóż konto',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 13
              ),
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
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(70),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: _form),
        ),
      ),
    );
  }
}
