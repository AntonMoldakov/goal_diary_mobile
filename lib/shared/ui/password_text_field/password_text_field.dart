import 'package:flutter/material.dart';
import 'package:goal_diary/shared/ui/ui.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final FormFieldValidator? validator;
  final bool disabled;

  const PasswordTextField({
    super.key,
    this.controller,
    this.labelText,
    this.validator,
    this.disabled = false,
  });

  @override
  createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        validator: widget.validator,
        controller: widget.controller,
        labelText: widget.labelText,
        disabled: widget.disabled,
        obscureText: isObscure,
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(48, 48),
                ),
              ),
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.black,
              ),
            )));
  }
}
