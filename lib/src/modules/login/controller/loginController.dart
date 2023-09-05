// ignore_for_file: camel_case_types, library_private_types_in_public_api, file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/shared/components/SnackBar_Login.dart';
import 'package:mymoney/src/modules/login/service/loginService.dart';
import 'package:mymoney/src/shared/helpers/validarEmail.dart';

part 'loginController.g.dart';

class LoginController = _loginController with _$LoginController;

abstract class _loginController with Store {
  loginService service = loginService();
  late String email;
  late String senha;
  late BuildContext buildContext;

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  @action
  Future<void> checkData({
    required String emailController,
    required String senhaController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;

    if (_validateData(email: emailController, senha: senhaController)) {
      email = emailController;
      senha = senhaController;

      setIsLoading();
      await sendData(); //---chama o loginService
    } else {
      AppSnackBar.showMassageInvalidFormat(buildContext);
    }
  }

  @action
  void setIsLoading({bool? value}) => isLoading = value ?? !isLoading;

  @action
  void setIsSuccess({bool? value}) => isSuccess = value ?? !isSuccess;

//======validar formato dos campos======//
  bool _validateData({required String email, required String senha}) {
    return (validarEmail(email) && senha.isNotEmpty);
  }

  ///================================///

  //=====chamada do service=====//
  Future<void> sendData() async {
    Map result = await service.sendLoginData(email: email, senha: senha);

    result.containsKey('success')
        ? setIsSuccess()
        : throwException(result['exception']);
  }
  ///==========================///


//======mensagens de erro=========//
  @action
  void throwException(int code) {
    setIsLoading();
    switch (code) {
      case 401:
        AppSnackBar.showMassageUserNotFound(buildContext);
        break;
      case 400:
        AppSnackBar.showMassageInvalidFormat(buildContext);
        break;
      case 0:
        AppSnackBar.showMassageServerError(buildContext);
        break;

      default:
        AppSnackBar.showMassage(buildContext);
    }
  }

  ///================================///
}
