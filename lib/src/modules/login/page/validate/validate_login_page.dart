// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/home/pages/home_page.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';
import '../../../../shared/colors/app_colors.dart';

class ValidateLoginPage extends StatefulWidget {
  const ValidateLoginPage({super.key});

  @override
  State<ValidateLoginPage> createState() => _ValidateLoginPageState();
}

class _ValidateLoginPageState extends State<ValidateLoginPage> {
  late Timer redirectTimer;
  late String? savedValue = '';

  void redirect() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void loadSavedValue() async {
    String? value = await AppSettings.getData(AppKeys.user_fullName);
    setState(() {
      savedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSavedValue();
    setState(() {
      redirectTimer = Timer(const Duration(seconds: 2), redirect);
    });
  }

  @override
  void dispose() {
    redirectTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
