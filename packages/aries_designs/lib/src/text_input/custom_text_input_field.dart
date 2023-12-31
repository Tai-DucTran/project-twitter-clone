import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? autofocus;
  final bool? obscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String hintText;
  final String? counterText;

  const CustomTextInputField({
    super.key,
    required this.controller,
    this.enableSuggestions,
    this.autocorrect,
    this.autofocus,
    this.obscureText,
    this.maxLength,
    this.keyboardType,
    this.counterText = '',
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableSuggestions: enableSuggestions ?? false,
      autocorrect: autocorrect ?? false,
      autofocus: autofocus ?? false,
      maxLength: maxLength ?? TextField.noMaxLength,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        hintText: ' $hintText',
        counterText: counterText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
