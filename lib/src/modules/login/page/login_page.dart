import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/login/components/register_link.dart';
import 'package:mymoney/src/modules/login/controller/loginController.dart';
import 'package:mymoney/src/modules/login/page/validate/validate_login_page.dart';
import 'package:mymoney/src/modules/registers/pages/register_page.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/app_loading.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool passVisible = true;
  final _formKey = GlobalKey<FormState>();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactTosendDataSuccess();
  }

  void reactTosendDataSuccess() {
    sendDataReactionDisposer =
      reaction((_) => controller.isSuccess, (bool success) {
      if (success) {
        controller.setIsSuccess();
        Timer(const Duration(seconds: 2), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ValidateLoginPage()));
          controller.setIsLoading();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPageBackground,
      body: Observer(builder: (_) {
        return controller.isLoading
            ? const AppLoading()
            : SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 140,
                        left: 25,
                        right: 25,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AppLogoTitle(
                                title: 'Login MyMoney',
                                iconSize: 80,
                                titleSize: 20,
                              ),

                              //---nome----//
                              TextFormField(
                                enabled: true,
                                controller: emailController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.text,

                                decoration: const InputDecoration(
                                    label: Text("Email do Usuário"),
                                    border: UnderlineInputBorder(),
                                    prefixIconColor: AppColors.logo,
                                    prefixIcon: Icon(Icons.person)),

                                //---validar---//
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "preencha o campo";
                                  }
                                  return null;
                                }, //------------//
                              ),

                              //----senha----//
                              TextFormField(
                                enabled: true,
                                controller: senhaController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                obscureText: passVisible,

                                decoration: InputDecoration(
                                  label: const Text("Senha"),
                                  border: const UnderlineInputBorder(),
                                  prefixIconColor: AppColors.logo,
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passVisible = !passVisible;
                                      });
                                    },
                                    child: Icon(passVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),

                                //------validar campo------//
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "preencha o campo";
                                  }
                                  return null;
                                },
                                //-------------------------//
                              ),

                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: AppButton(
                                      action: () async {
                                        if (formularioValido()) {
                                          await controller.checkData(
                                            emailController:
                                                emailController.text,
                                            senhaController:
                                                senhaController.text,
                                            buildContext: context,
                                          );
                                        }
                                      },
                                      label: "Login")),

                              //-----faça seu cadastro no MYMONEY------//
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()),
                                    );
                                  },
                                  child: const RegisterLink()),
                            ]),
                      ),
                    ),
                  ),
                ),
              );
      }),
    );
  }

  //----------validando os campos----------
  bool formularioValido() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      print("form invalido");
      return false;
    }
  }
  //---------------------------------------
}
