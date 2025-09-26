// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:dio/dio.dart';
import 'package:mymoney/src/http/app_dio.dart';
import 'package:mymoney/src/modules/login/model/loginDataModel.dart';

class loginRepository {
    String baseURL = "http://192.168.15.72:3099/auth/login";
    
Future<Response<Map<String, dynamic>>> sendLoginData(loginDatamodel loginData)async{
  Dio httpClient = await AppDio.getConnection(isAuth: false);

  return httpClient.post(baseURL,  data: loginData.tojson());

}
    
}
