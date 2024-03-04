import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/constants/constants.dart';
import 'package:talker_flutter/talker_flutter.dart';

const guestModeOn = 'true';

class AuthService extends ChangeNotifier {
  FlutterSecureStorage secureStorage;

  String? _accessToken;
  bool _isGuestMode = false;

  bool get isAuthorized => _accessToken != null;
  bool get isLoggedInAsGuest => _isGuestMode;
  bool get isLoggedIn => _isGuestMode || isAuthorized;

  AuthService(this.secureStorage);

  Future<AuthService> init() async {
    try {
      _accessToken =
          await secureStorage.read(key: secureStorageKeys.accessToken);

      await _initForGuest();
    } catch (e) {
      GetIt.I<Talker>().error('AuthService init()', e);
    }
    return this;
  }

  Future<void> login(String accessToken) async {
    secureStorage.write(key: secureStorageKeys.accessToken, value: accessToken);
    _accessToken = accessToken;
  }

  Future<void> logout() async {
    _accessToken = null;
    secureStorage.delete(key: secureStorageKeys.accessToken);

    _logoutForGuest();
  }

  Future<void> _initForGuest() async {
    final guestMode =
        (await secureStorage.read(key: secureStorageKeys.isGuestMode));

    if (guestMode == guestModeOn) {
      _isGuestMode = true;
    }
  }

  Future<void> loginAsGuest() async {
    _isGuestMode = true;
    secureStorage.write(key: secureStorageKeys.accessToken, value: guestModeOn);
  }

  Future<void> _logoutForGuest() async {
    _isGuestMode = false;
    secureStorage.delete(key: secureStorageKeys.isGuestMode);
  }
}
