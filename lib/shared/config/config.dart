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
  }

  late String _baseApiUrl;

  String get baseApiUrl => _baseApiUrl;
}
