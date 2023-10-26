import 'package:dio/dio.dart';

class ApiClient {
  late Dio _api;

  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  ApiClient._internal() {
    _api = Dio();
    _api.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    _api.options.headers = {'Content-Type': 'application/json'};
    // Set other base options here
  }

  ApiClient addLogger(Interceptor interceptor) {
    _api.interceptors.add(interceptor);

    return _singleton;
  }

  Dio getApiClient() {
    return _api;
  }
}
