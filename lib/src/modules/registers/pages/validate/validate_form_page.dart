// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mymoney/src/router/app_router.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_validate_logo.dart';

import '../../../../shared/components/app_loading.dart';

class ValidateFormPage extends StatefulWidget {
  const ValidateFormPage({super.key});

  @override
  State<ValidateFormPage> createState() => _ValidatePageState();
}


class _ValidatePageState extends State<ValidateFormPage> {
bool isLoading = true;
late Timer redirectTimer; 
  
  void redirect(BuildContext context) {
    redirectTimer = Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(AppRouter.login);
      });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) => setState(() {
          isLoading = false;
        }
        ));
  }
  @override
  void dispose() {
    redirectTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);
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
                    AppValidateLogo(title: 'cadastrado'),
                  ],
                ),
              ),
            ),
          );
  }
}
