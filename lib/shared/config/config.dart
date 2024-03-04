import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final Config _singleton = Config._internal();

  factory Config() => _singleton;

  Config._internal() {
    final baseApiUrl = dotenv.env['BASE_API_URL'] ?? '';

    if (baseApiUrl.isEmpty) {
      throw 'Missing BASE_API_URL in dotenv configuration';
    }

    _baseApiUrl = dotenv.env['BASE_API_URL']!;

    final emailConfirmationCodeLength =
        dotenv.env['EMAIL_CONFIRMATION_CODE_LENGTH'] ?? '';

    if (emailConfirmationCodeLength.isEmpty) {
      throw 'Missing EMAIL_CONFIRMATION_CODE_LENGTH in dotenv configuration';
    }

    _emailConfirmationCodeLength =
        int.parse(dotenv.env['EMAIL_CONFIRMATION_CODE_LENGTH']!);
  }

  late String _baseApiUrl;
  late int _emailConfirmationCodeLength;

  String get baseApiUrl => _baseApiUrl;
  int get emailConfirmationCodeLength => _emailConfirmationCodeLength;
}
