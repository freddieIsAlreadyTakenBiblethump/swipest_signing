import 'package:flutter/material.dart';

class SwipestTextFormField extends StatefulWidget {

  String text;
  TextEditingController? textEditingController;
  FormFieldValidator<String>? validator;
  Function()? onEditingComplete;
  Key? widgetKey;

  SwipestTextFormField({
    this.text = '',
    this.textEditingController,
    this.validator,
    this.onEditingComplete,
    this.widgetKey,
  });

  @override
  State<SwipestTextFormField> createState() => _SwipestTextFormFieldState();
}

class _SwipestTextFormFieldState extends State<SwipestTextFormField> {

  final _border = const UnderlineInputBorder(
      borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Colors.black12,
  ));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.widgetKey,
      controller: widget.textEditingController, // from above constructor
      validator: widget.validator, // from above constructor
      onEditingComplete: widget.onEditingComplete, // from above constructor
      decoration: InputDecoration(
        labelText: widget.text, // from above constructor
        labelStyle: const TextStyle(
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
        errorStyle: const TextStyle(fontSize: 10),
      ),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}
