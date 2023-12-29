import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String hintText;

  const LoginTextField({
    super.key,
    required this.controller,
    this.enableSuggestions,
    this.autocorrect,
    this.obscureText,
    this.keyboardType,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableSuggestions: enableSuggestions ?? false,
      autocorrect: autocorrect ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
