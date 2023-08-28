// ignore_for_file: camel_case_types, library_private_types_in_public_api, file_names

import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/login/service/loginService.dart';

part 'loginController.g.dart';

class LoginController = _loginController with _$LoginController;
loginService service = loginService();

abstract class _loginController with Store {
  late String nome;
  late String senha;
  late int responseStatusCode;
  
  FutureOr<int> checkData({
    required String nameController,
    required String senhaController,

  }) async {
    nome = nameController;
    senha = senhaController;
    return await sendData();
  }

  FutureOr<int> sendData() async {
    return responseStatusCode =
    await service.sendLoginData(nome, senha);
  }
}
