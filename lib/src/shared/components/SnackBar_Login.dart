// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppSnackBar {

  static void showMassageUserNotFound(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Text("Usuário não encontrado"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageInvalidFormat(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Text("Formato inválido"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageServerError(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Text("Erro interno, tente mais tarde"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassage(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Text("Houve algum Erro"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageUserAlreadyExists(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Text("Esse usuário ja existe"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageValidate(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.logo,
      content: Text("validado"),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }
}
