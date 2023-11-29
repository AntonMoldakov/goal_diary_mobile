import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormValidationBuilder {
  final String? value;
  List<String> _errors = [];
  final BuildContext context;

  FormValidationBuilder(
    this.value,
    this.context,
  );

  FormValidationBuilder required() {
    if ((value == null || value!.trim().isEmpty)) {
      _errors.add(AppLocalizations.of(context)!.requiredFieldError);
    }

    return this;
  }

  FormValidationBuilder email() {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegExp.hasMatch(value!)) {
      _errors.add(AppLocalizations.of(context)!.emailFieldError);
    }

    return this;
  }

  FormValidationBuilder password() {
    final passwordRegExp =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[a-zA-Z\d\W]{8,}$');

    if (!passwordRegExp.hasMatch(value!)) {
      _errors.add(AppLocalizations.of(context)!.passwordFieldError);
    }

    return this;
  }

  String? build() {
    if (_errors.isEmpty) {
      return null;
    }

    return _errors.first;
  }
}
