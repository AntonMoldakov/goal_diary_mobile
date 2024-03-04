import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/app.dart';
import 'package:goal_diary/features/auth/data/repository/auth/auth_abstract_repository.dart';
import 'package:goal_diary/features/auth/data/repository/auth/auth_repository.dart';
import 'package:goal_diary/shared/config/config.dart';
import 'package:goal_diary/shared/services/api.dart';
import 'package:goal_diary/shared/services/auth.dart';
import 'package:goal_diary/shared/services/toaster.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  await runZonedGuarded(() async {
    await dotenv.load(fileName: '.env');

    final config = Config();
    GetIt.I.registerSingleton(config);

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);

    final secureStorage = FlutterSecureStorage();

    final authService = await AuthService(secureStorage).init();
    GetIt.I.registerSingleton<AuthService>(authService);

    final toaster = Toaster();
    GetIt.I.registerSingleton(toaster);

    final api = ApiClient().addLogger(TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: true,
      ),
    ));
    GetIt.I.registerSingleton(api);

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: true,
        printEventFullData: true,
      ),
    );

    WidgetsFlutterBinding.ensureInitialized();

    GetIt.I.registerLazySingleton<AuthAbstractRepository>(
      () => AuthRepository(
        api: api,
      ),
    );

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    return runApp(MyApp());
  }, (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
