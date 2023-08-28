// ignore_for_file: file_names, camel_case_types, avoid_print
import 'dart:async';
import 'dart:convert';

import 'package:mymoney/src/config/app_settings.dart';

import '../model/loginDataModel.dart';
import 'package:http/http.dart' as http;

class loginRepository {
    var baseURL = Uri.parse("http://192.168.15.72:3099/auth/login");
    late String nome;
    late String senha;
    FutureOr<int> sendLoginData(loginDatamodel loginData) async{
      nome = loginData.name;
      senha = loginData.password;
      var response = await http.post(
        baseURL,  
        body: {
          'username':nome,
          'password': senha,
        },
        );

      //====extraindo dados do Login de Usuário=====//  
      String string = response.body.toString();
      Map<String, dynamic> jsonData = json.decode(string);

      String username = jsonData['additional_information']['fullName'];
      String token = jsonData['access_token'];
      // ============================================
      AppSettings.save(username, token);
      
      return response.statusCode;

    }
}
