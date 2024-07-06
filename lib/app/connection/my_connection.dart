import 'package:dio/dio.dart';
import 'package:kolektix/app/constants/my_constants.dart';

class MyConnection {
  Dio getDioConnection(String token) {
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': "Bearer $token",
    };

    Dio dio = Dio();
    dio.options.headers = headers;
    dio.options.baseUrl = MyConstant.BASE_URL;
    return dio;
  }
}