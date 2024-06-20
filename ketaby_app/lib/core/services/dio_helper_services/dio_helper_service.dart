import 'package:dio/dio.dart';

class ECommerceDioHelper {

  static Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://codingarabic.online/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData(
      {
        required String url,
        Map<String,dynamic> ?query,
        String? token
      }
      )
  async {
    dio!.options.headers = {
      'Authorization':'Bearer $token',
    };
    return await dio!.get(url,queryParameters:query );
  }






  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
    dynamic? formData
  }) {

    dio!.options.headers = {
      'content-type':'application/json',
      'Authorization':'Bearer $token',
    };
    return dio!.post(url, queryParameters: query, data: formData==null? data:formData);
  }

     static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {

    dio!.options.headers = {
      'Authorization':'Bearer $token',
    };
    return dio!.put(url, queryParameters: query, data: data);

  }
     static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };

    return await dio!.delete(url, queryParameters: query, data: data);
  }








}