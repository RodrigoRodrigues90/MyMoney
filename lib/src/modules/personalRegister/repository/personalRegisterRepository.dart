// ignore_for_file: file_names, camel_case_types, avoid_print

import 'package:dio/dio.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/http/app_dio.dart';

import '../model/personalRegisterData_model.dart';

class PersonalRegisterRepository {
    String baseURL = "http://192.168.15.72:3099/user/update";
    Future<String?> iduser = AppSettings.getData(AppKeys.user_id);
    
Future<Response<Map<String, dynamic>>> sendPersonalData(PersonalRegisterDatamodel personalRegisterDatamodel)async{
  Dio httpClient = await AppDio.getConnection(isAuth: true);
  print(iduser.toString());
  return httpClient.patch('$baseURL/$iduser',  data: personalRegisterDatamodel.toJson());

}

    
}