// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/personalRegister/pages/personalRegister_page.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';
import '../../../../shared/colors/app_colors.dart';
import '../../../../shared/components/app_loading.dart';

class ValidateLoginPage extends StatefulWidget {
  const ValidateLoginPage({super.key});

  @override
  State<ValidateLoginPage> createState() => _ValidateLoginPageState();
}

class _ValidateLoginPageState extends State<ValidateLoginPage> {
  bool isLoading = true;
  late Timer redirectTimer;
  late String? savedValue = '';

  void redirect() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const personalRegisterPage()));
  }

   void loadSavedValue() async {
    String? value = await AppSettings.getData(AppKeys.user);
    setState(() {
      savedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) => setState(() {
          isLoading = false;
        }));
    redirectTimer = Timer(const Duration(seconds: 3), redirect);
    loadSavedValue();
  }

  @override
  void dispose() {
    redirectTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: AppLoading(),
          )
        : Scaffold(
            backgroundColor: AppColors.initialPageBackground,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLogoTitle(title: 'Olá, ${savedValue}'),
                  ],
                ),
              ),
            ),
          );
  }
}
