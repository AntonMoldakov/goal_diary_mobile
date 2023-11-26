import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool disabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? labelText;

  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.disabled = false,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      enabled: !disabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
