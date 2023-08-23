// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

mixin AppDio{

  static Future<Dio> getConnection({bool isAuth = false}) async{

    final Dio dio = Dio();
    final Map<String, String> headers = <String, String>{};

      String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRoaWFnb3JvbWVuZGVzQGdtYWlsLmNvbSIsInN1YiI6IjU4OGVmMDAzLWM0OTYtNDYxMy04N2MyLWNkNGRiMDc4MzdmZiIsInJvbGVzIjoiYWRtaW5pc3RyYXRvciIsImlhdCI6MTY5MjgyNDA2MiwiZXhwIjoxNzIzOTI4MDYyfQ.lozC26I-x1zuw5TdwXvZlzSyi0NgK18G7NtC_W9ZXb4";
    
    if(isAuth){
      headers["Authorization"] = "Bearer $token";
    }
    dio.options = BaseOptions();
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 15000;
    dio.options.headers = headers;
    
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = 
    (HttpClient client){
      client.badCertificateCallback = 
      (X509Certificate cert, String host , int port){
        return true;
      };
    };

    dio.interceptors.add( 
      InterceptorsWrapper(
        onRequest: (options, handler) async{
          onRequest(options);
          handler.next(options);
        },
        onResponse: onResponse,
        onError: (error , handler) async{
          onError(dio, error, handler);
        }
      )
    );

    return dio;
  }

  static void  onRequest(RequestOptions options){
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";

    print("-------------Request Log----------------");
    print(options.uri);
  }

  static void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler){
    print("-------------Request Log----------------");
    print(response.data);
    handler.next(response);
  }

  static void onError( Dio dio, DioError error, ErrorInterceptorHandler handler){
  print("-------------Request Log----------------");
  print(error.response);
  handler.next(error);
  }
}