import 'package:dio/dio.dart';





Dio dio(){
  Dio dio = Dio();

  dio.options.baseUrl  = 'http://192.168.43.211:8000/api/';
  return dio;

}
