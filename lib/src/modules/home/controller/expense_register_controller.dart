import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/home/service/expense_register_service.dart';
import 'package:mymoney/src/shared/components/SnackBar_Login.dart';

import '../../../router/app_router.dart';

part 'expense_register_controller.g.dart';

class ExpenseRegisterController = _ExpenseRegisterController
    with _$ExpenseRegisterController;

abstract class _ExpenseRegisterController with Store {
  ExpenseRegisterService service = ExpenseRegisterService();
  late String id;
  late String category;
  late String description;
  late double value;
  late String registrationDate;
  late BuildContext buildContext;

  Future<void> checkData({
    required String category,
    required String description,
    required double value,
    required String registrationDate,
    required BuildContext buildContext,
  }) async {
    this.category = category;
    this.description = description;
    this.value = value.toDouble();
    this.registrationDate = registrationDate;
    this.buildContext = buildContext;

    if (description.isEmpty || value <= 0.0) {
      AppSnackBar.showMassageInvalidFormat(buildContext);
    } else {
      senData();
    }
  }

  Future<void> checkDataUpDate({
    required String id,
    required String category,
    required String description,
    required double value,
    required String registrationDate,
    required BuildContext buildContext,
  }) async {
    this.id = id;
    this.category = category;
    this.description = description;
    this.value = value.toDouble();
    this.registrationDate = registrationDate;
    this.buildContext = buildContext;

    if (description.isEmpty || value <= 0.0) {
      AppSnackBar.showMassageInvalidFormat(buildContext);
    } else {
      senDataUpdate();
    }
  }

  Future<void> checkDeleteDate({
    required String id,
    required BuildContext context,
  }) async {
    this.id = id;
    this.buildContext = context;

    senDataToDelete();
  }

  Future<void> senData() async {
    String? userId = await AppSettings.getData(AppKeys.user_id);
    bool response = await service.postExpense(
        userId: userId!,
        category: category,
        description: description,
        value: value.toDouble(),
        registrationDate: registrationDate);
    if (response) {
      AppSnackBar.showMassageValidate(buildContext);
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(buildContext, AppRouter.home);
      });
    } else {
      AppSnackBar.showMassageServerError(buildContext);
    }
  }

  Future<void> senDataUpdate() async {
    bool response = await service.updateExpense(
        expenseId: id,
        category: category,
        description: description,
        value: value.toDouble(),
        registrationDate: registrationDate);
    if (response) {
      AppSnackBar.showMassageValidate(buildContext);
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(buildContext, AppRouter.home);
      });
    } else {
      AppSnackBar.showMassageServerError(buildContext);
    }
  }

  Future<void> senDataToDelete() async {
    bool response = await service.deleteExpense(userId: id);
    if (response) {
      AppSnackBar.showMassageValidateDelete(buildContext);
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(buildContext, AppRouter.home);
      });
    } else {
      AppSnackBar.showMassageServerError(buildContext);
      Timer(const Duration(seconds: 2), () {
        Navigator.pop(buildContext);
      });
    }
  }
}
