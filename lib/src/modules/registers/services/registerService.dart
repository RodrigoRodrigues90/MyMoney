// ignore_for_file: file_names, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:mymoney/src/modules/registers/Model/registerModel.dart';

import '../repositories/registerRepository.dart';

class registerService {
  final registerRepository repository = registerRepository();

  Future<void> sendRegisterData(
    String nome,
    String email,
    String senha,
  )async{
    try{
      registerDatamodel datamodel = registerDatamodel(name: nome, email: email, password: senha);
      await repository.sendRegisterData(datamodel);

    }catch(exception){
      debugPrint(exception.toString());
      rethrow;
    }
  }

  
}