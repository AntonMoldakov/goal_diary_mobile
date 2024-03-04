import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/config/config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final FormFieldValidator? validator;
  final bool disabled;
  final bool obscureText;
  final String? labelText;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;

  const CodeTextField({
    super.key,
    this.controller,
    this.errorAnimationController,
    this.onChanged,
    this.onCompleted,
    this.validator,
    this.obscureText = false,
    this.disabled = false,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final config = GetIt.I<Config>();

    return PinCodeTextField(
        key: key,
        length: config.emailConfirmationCodeLength,
        obscureText: obscureText,
        appContext: context,
        animationType: AnimationType.fade,
        enabled: !disabled,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            selectedColor: Colors.blue,
            activeColor: Colors.blue,
            inactiveColor: Colors.blueGrey),
        animationDuration: Duration(milliseconds: 300),
        controller: controller,
        errorAnimationController: errorAnimationController,
        onCompleted: onCompleted,
        onChanged: onChanged);
  }
}
