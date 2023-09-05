import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/personalRegister/service/personalRegister_service.dart';
import 'package:mymoney/src/shared/components/SnackBar_Login.dart';

part 'personalRegister_controller.g.dart';

class PersonalRegisterController = _PersonalRegisterController
    with _$PersonalRegisterController;

abstract class _PersonalRegisterController with Store {
  PersonalRegisterService service = PersonalRegisterService();
  late String name;
  late String email;
  late String senha;
  late BuildContext buildContext;

  @action
  Future<void> checkData(
      {required nameController,
      required emailController,
      required senhaController,
      context}) async {
   
    name = nameController;
    email = emailController;
    senha = senhaController;
    buildContext = context;

    //=====chamada do service=====//
    Map result = await service.sendData(name: name, email: email, senha: senha);

    result.containsKey('success')
        ? AppSnackBar.showMassageValidate(buildContext)
        : throwException(result['exception']);
  }

  void throwException(int code) {
    switch (code) {
      // case 400:
      //   AppSnackBar.showMassageInvalidFormat(buildContext);
      //   break;
      case 500:
        AppSnackBar.showMassageServerError(buildContext);
        break;

      default:
        AppSnackBar.showMassage(buildContext);
    }
  }
}
