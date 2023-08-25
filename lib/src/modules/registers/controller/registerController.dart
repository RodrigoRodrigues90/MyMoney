// ignore_for_file: camel_case_types, avoid_print, file_names

import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/registers/services/registerService.dart';

part 'registerController.g.dart';

// ignore: library_private_types_in_public_api
class registerController = _registerController with _$registerController;
registerService service = registerService();

abstract class _registerController with Store {
  late String nome;

  late String email;

  late String senha;

  late String senhaConfirmada;

  Future<void> checkData({
    required String nameController,
    required String emailController,
    required String senhaController,
    required String senhacConfirmadaController,
  }) async {
    if (senhaController.compareTo(senhacConfirmadaController) == 0) {
      nome = nameController;
      email = emailController;
      senha = senhaController;
      await sendData();
    } else {
      print("senha incorreta.");
    }
  }

  Future<void> sendData() async {
    await service.sendRegisterData(nome, email, senha);
  }
}
