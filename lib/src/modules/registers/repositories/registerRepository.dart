// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:dio/dio.dart';
import 'package:mymoney/src/http/app_dio.dart';
import 'package:mymoney/src/modules/registers/Model/registerModel.dart';

class registerRepository {
    String baseURL = "http://179.83.29.37:3099/user";

    Future<Response<Map<String, dynamic>>> sendRegisterData(registerDatamodel registerData) async{
      final Dio clientHttp = await AppDio.getConnection(isAuth: true);

      print("Dados: ${registerData.toJson()}");

      return clientHttp.post('$baseURL/create', data: registerData.toJson());
    }  
}
