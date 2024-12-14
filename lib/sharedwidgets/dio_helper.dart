import 'dart:developer';

import 'package:dio/dio.dart';


class DioHelper {
  static late Dio _dio;


  static init() {
    _dio = Dio();
    _dio.options.baseUrl  = 'http://192.168.43.211:8000/api/';
    _dio.options.receiveTimeout = 5 * 1000; // 60 sec
    _dio.options.connectTimeout = 5 * 1000; // 60 seconds

    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.headers = {
      'Accept': 'application/json',
       '_method': 'put'
    };
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    
    required Map<String, dynamic> data,

    String? token,
  }) async {
    _dio.options.headers = {
      
      'Authorization': 'Bearer $token',
       
      
    };
 
    Response response = await _dio
        .post(
      url,
      queryParameters: query ?? {},
      data: data,
    );
    
    return response;
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String branchId = '1',
    String? token,
  }) async {
    log('token is $token');
    _dio.options.headers = {
    
      'Authorization': 'Bearer $token',
     
    };
    
    Response response = await _dio
        .get(
      url,
      queryParameters: query ?? {},
    )
        .catchError((onError) {
print('$onError');
  return null;
    });
    return response;
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    //String branchId = '1',
    String? token,
  }) async {
    _dio.options.headers = {
    
      'Authorization': 'Bearer $token',
     
    };
     
    Response response = await _dio
        .put(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((onError) {
     
    });
    return response;
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    //  String branchId = '1',
    required Map<String, dynamic> data,
    // String lang = 'ar',
    String? token,
  }) async {
    _dio.options.headers = {
    
      'Authorization': 'Bearer $token',
     
    };
     
    Response response = await _dio
        .delete(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((onError) {
     
    });
    return response;
  }
}
