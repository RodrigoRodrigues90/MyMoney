// ignore_for_file: camel_case_types, file_names
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mymoney/src/modules/login/model/loginDataModel.dart';
import 'package:mymoney/src/modules/login/repository/loginRepository.dart';

class loginService {
  final loginRepository repository = loginRepository();
  late int response;
  FutureOr<int> sendLoginData(
    String nome,
    String senha,
  )async{
    try{
      loginDatamodel datamodel = loginDatamodel(name: nome, password: senha);
      response =
      await repository.sendLoginData(datamodel);

    }catch(exception){
      debugPrint(exception.toString());
      rethrow;
    }
    return response;
  }

  
}