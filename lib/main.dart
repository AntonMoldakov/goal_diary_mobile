import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/app.dart';
import 'package:goal_diary/shared/services/api.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  final api = ApiClient().addLogger(TalkerDioLogger(
    talker: talker,
    settings: const TalkerDioLoggerSettings(
      printResponseData: false,
    ),
  ));
  GetIt.I.registerSingleton(api);

  runApp(MyApp());
}
