import 'package:flutter/material.dart';
import 'package:goal_diary/internal/app.dart';
import 'package:goal_diary/internal/services/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

void main() {
  final talker = TalkerFlutter.init();
  final api = ApiClient()
      .addLogger(TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ))
      .getApiClient();

  runApp(MyApp());
}
