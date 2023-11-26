import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormValidator {
  final String? value;
  final bool isRequired;
  final BuildContext context;

  FormValidator(
    this.value,
    this.isRequired,
    this.context,
  );

  get emailValidationError {
    if (value == null || value!.trim().isEmpty) {
      return requiredFieldValidationError;
    }

    final emailRegExp = RegExp(r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (emailRegExp.hasMatch(value!)) {
      return null;
    }

    return AppLocalizations.of(context)!.emailFieldError;
  }

  get passwordValidationError {
    if (value == null || value!.trim().isEmpty) {
      return requiredFieldValidationError;
    }

    final passwordRegExp =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[a-zA-Z\d\W]{8,}$');

    if (passwordRegExp.hasMatch(value!)) {
      return null;
    }

    return AppLocalizations.of(context)!.passwordFieldError;
  }

  get requiredFieldValidationError {
    if (isRequired && (value == null || value!.trim().isEmpty)) {
      return AppLocalizations.of(context)!.requiredFieldError;
    }

    return null;
  }
}
