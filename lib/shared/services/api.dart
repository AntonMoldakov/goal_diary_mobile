import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/config/config.dart';

class ApiClient {
  static late Dio _api;

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  ApiClient._internal() {
    final config = GetIt.I<Config>();

    _api = Dio(BaseOptions(
      baseUrl: config.baseApiUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      receiveDataWhenStatusError: true,
      sendTimeout: Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ));
  }

  ApiClient addLogger(Interceptor interceptor) {
    _api.interceptors.add(interceptor);

    return _singleton;
  }

  Future<Response<T>> get<T>(String path) {
    return _api.get<T>(path);
  }

  Future<Response> post(
    String path, {
    Object? data,
  }) {
    return _api.post(
      path,
      data: data,
    );
  }
}
