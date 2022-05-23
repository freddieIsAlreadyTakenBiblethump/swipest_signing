import 'package:flutter/material.dart';

class SwipestTextFormField extends StatefulWidget {
  String text;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  Function()? onEditingComplete;
  Key? widgetKey;
  bool obscure;
  bool enabled;
  Function(String)? onChanged;

  SwipestTextFormField({
    this.text = '',
    this.controller,
    this.validator,
    this.onEditingComplete,
    this.widgetKey,
    this.obscure = false,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<SwipestTextFormField> createState() => _SwipestTextFormFieldState();
}

class _SwipestTextFormFieldState extends State<SwipestTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = widget.obscure;
    super.initState();
  }

  final _border = const UnderlineInputBorder(
      borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Colors.black12,
  ));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure, // from above constructor
      key: widget.widgetKey, // from above constructor
      controller: widget.controller, // from above constructor
      validator: widget.validator, // from above constructor
      onEditingComplete: widget.onEditingComplete, // from above constructor
      enabled: widget.enabled,
      onChanged: widget.onChanged,
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
        suffix: widget.obscure
            ? GestureDetector(
                child: Text(
                  _obscure ? 'pokaż' : 'ukryj',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black26,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
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
