import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/shared/components/SnackBar_Login.dart';

import '../../../shared/helpers/autenticated_user.dart';
import '../../../shared/models/user_model.dart';
import '../service/personalRegister_service.dart';

part 'personalRegister_controller.g.dart';

class PersonalRegisterController = _PersonalRegisterController
    with _$PersonalRegisterController;

abstract class _PersonalRegisterController with Store {
  PersonalRegisterService service = PersonalRegisterService();

  @observable
  bool isLoading = true;

  @observable
  bool isSuccess = false;

  late String name;
  late String email;
  late double limitValue;
  late BuildContext buildContext;

  @action
  Future<UserModel> loadUser() async {
    UserModel user = await AuthenticatedUser.getUserData();
    isLoading = false;
    return user;
  }

  @action
  Future<void> checkData({
    required String nameController,
    required String emailController,
    required String limitValueController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;
    limitValueController =
        limitValueController.isEmpty ? "0" : limitValueController;
    if (double.parse(limitValueController) > 0) {
      name = nameController;
      email = emailController;
      limitValue = double.parse(limitValueController);
      isLoading = true;
      await sendData();
      isLoading = false;
    } else {
      AppSnackBar.showMassageInvalidFormat(context);
    }
  }

  @action
  Future<void> sendData() async {
    isSuccess = await service.sendData(
      name: name,
      email: email,
      limitValue: limitValue,
    );
  }
}
