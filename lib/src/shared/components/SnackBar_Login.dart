// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppSnackBar {
  static void showMassageUserNotFound(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.error_outline_rounded,
              color: Color.fromARGB(255, 241, 223, 223),
            ),
          ),
          Text(
            "Usuário não encontrado",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageInvalidFormat(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.error_outline_rounded,
              color: Color.fromARGB(255, 241, 223, 223),
            ),
          ),
          Text(
            "Verifique os dados",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageServerError(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.error_outline_rounded,
              color: Color.fromARGB(255, 241, 223, 223),
            ),
          ),
          Text(
            "Erro interno, Tente mais tarde",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassage(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.error_outline_rounded,
              color: Color.fromARGB(255, 241, 223, 223),
            ),
          ),
          Text(
            "Houve algum erro",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageUserAlreadyExists(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.expense,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.error_outline_rounded,
              color: Color.fromARGB(255, 241, 223, 223),
            ),
          ),
          Text(
            "Esse usuário ja existe",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }

  static void showMassageValidate(context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppColors.logo,
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 54, 129, 57),
            ),
          ),
          Text(
            "Enviado",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ));
  }
}
