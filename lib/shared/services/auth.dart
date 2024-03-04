import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/constants/constants.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthService extends ChangeNotifier {
  FlutterSecureStorage secureStorage;

  String? _accessToken;
  bool _isGuestMode = false;

  bool get isAuthorized => _accessToken != null;
  bool get isLoggedIn => _isGuestMode || isAuthorized;

  AuthService(this.secureStorage);

  Future<AuthService> init() async {
    try {
      _accessToken =
          await secureStorage.read(key: secureStorageKeys.accessToken);
    } catch (e) {
      GetIt.I<Talker>().error('AuthService init()', e);
    }
    return this;
  }

  Future<void> loginAsGuest() async {
    _isGuestMode = true;
  }

  Future<void> login(String accessToken) async {
    secureStorage.write(key: secureStorageKeys.accessToken, value: accessToken);
  }

  Future<void> logout() async {
    secureStorage.delete(key: secureStorageKeys.accessToken);
  }
}
