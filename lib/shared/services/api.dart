import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:goal_diary/shared/config/config.dart';

class ApiClient {
  static late Dio _api;

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  ApiClient._internal() {
    _api = Dio();

    final config = GetIt.I<Config>();

    _api.options.baseUrl = config.baseApiUrl;
    _api.options.headers = {'Content-Type': 'application/json'};
  }

  ApiClient addLogger(Interceptor interceptor) {
    _api.interceptors.add(interceptor);

    return _singleton;
  }

  Future<Response> get(String path) {
    return _api.get(path);
  }
}
