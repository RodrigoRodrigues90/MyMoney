// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/login/page/login_page.dart';
import 'package:mymoney/src/shared/components/app_loading.dart';

class Logout_dialog {
  Future<Widget> throwDialog(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 20,
          title: const Text('Fazer Logout?'),
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Não",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SimpleDialogOption(
                onPressed: () {
                  logOut(context);
                },
                child: const Text("Sim",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ],
        );
      },
    );
  }

  void logOut(context) {
    //===delete data====//
    AppSettings.deleteData(AppKeys.auth_token);
    AppSettings.deleteData(AppKeys.user_fullName);
    AppSettings.deleteData(AppKeys.user_id);
    AppSettings.deleteData(AppKeys.user);

    //======tela de loading=====//
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AppLoading()));

    //======volta a tela de login=====//
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
}
