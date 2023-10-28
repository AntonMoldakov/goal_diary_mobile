import 'package:dio/dio.dart';

class ApiClient {
  static late Dio _api;

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  ApiClient._internal() {
    _api = Dio();

    _api.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
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
