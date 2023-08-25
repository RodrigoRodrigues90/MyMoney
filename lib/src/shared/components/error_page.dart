// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'app_error_logo.dart';
import 'app_loading.dart';

class ErrorFormPage extends StatefulWidget {
  const ErrorFormPage({super.key});

  @override
  State<ErrorFormPage> createState() => _ErrorFormPageState();
}

bool isLoading = true;

class _ErrorFormPageState extends State<ErrorFormPage> {
  void redirect(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
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
    isLoading = true;
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
                    AppErrorLogo(title: 'Tente Novamente'),
                  ],
                ),
              ),
            ),
          );
  }
}
