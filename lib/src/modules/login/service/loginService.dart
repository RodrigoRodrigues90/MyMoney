// ignore_for_file: camel_case_types, file_names, unnecessary_cast, prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/login/model/loginDataModel.dart';
import 'package:mymoney/src/modules/login/repository/loginRepository.dart';

class loginService {
  final loginRepository repository = loginRepository();

  Future<Map<dynamic, dynamic>> sendLoginData({
    required String email,
    required String senha,
  }) async {
    try {
      loginDatamodel loginData = loginDatamodel( username: email, password: senha);
      
      await persistLocalData(await repository.sendLoginData(loginData));// conexão com o back-end e ja tenta gravar dados localmente
      
      return {"success" : true};//retorna um Map{success: true}
   
    } on DioError catch (e) {
      return {"exception": getStatusCode(e)};//retorna um Map{exception: StatusCode}
    } 
  }

//======retorna o StatusCode======//
  int getStatusCode(DioError e) {
    final DioError errorResult = e as DioError;

    if(errorResult.response == null){
      return 0;
    }
    return errorResult.response!.data['statusCode'];
  }
///==============================///  


  
//==================Flutter Secury Storage - SaveData =======================//
  Future<void> persistLocalData(Response<Map<String, dynamic>> response) async {
    Map<String, dynamic>? result = response.data;

    if (result != null) {
      String token = result['access_token'];
      Map<String, dynamic> userData = result["additional_information"];
      String userId = userData['id'].toString();
      String user_fullName = userData['fullName'];
      

      AppSettings.saveData(AppKeys.auth_token, token);
      AppSettings.saveData(AppKeys.user, userData.toString());
      AppSettings.saveData(AppKeys.user_id, userId);
      AppSettings.saveData(AppKeys.user_fullName, user_fullName);
      
    }
  }
///========================================================================///


}

  
