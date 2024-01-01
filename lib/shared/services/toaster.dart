import 'package:flutter/material.dart';
import 'package:goal_diary/shared/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Toaster {
  void showToast(BuildContext context, String errorKey) {
    final message = _getErrorMessage(context, errorKey);

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  String _getErrorMessage(BuildContext context, String errorKey) {
    String message = AppLocalizations.of(context)!.something_went_wrong;

    if (errorKey == somethingWentWrongKey) {
      message = AppLocalizations.of(context)!.something_went_wrong;
    }

    if (errorKey == errorKeys['userAlreadyExists']) {
      message = AppLocalizations.of(context)!.user_already_exists;
    }

    if (errorKey == errorKeys['userDoesNotExist']) {
      message = AppLocalizations.of(context)!.user_does_not_exist;
    }

    if (errorKey == errorKeys['emailOrPasswordIncorrect']) {
      message = AppLocalizations.of(context)!.email_or_password_incorrect;
    }

    if (errorKey == errorKeys['codeExpired']) {
      message = AppLocalizations.of(context)!.code_expired;
    }

    if (errorKey == errorKeys['codeDebounce']) {
      message = AppLocalizations.of(context)!.code_sent;
    }

    if (errorKey == errorKeys['cashedUserDuesNotExist']) {
      message = AppLocalizations.of(context)!.code_expired;
    }

    if (errorKey == errorKeys['incorrectCode']) {
      message = AppLocalizations.of(context)!.incorrect_code;
    }

    return message;
  }
}
