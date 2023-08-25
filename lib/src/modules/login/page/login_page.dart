// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/login/components/register_link.dart';
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
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passVisible = true;
  final _formKey = GlobalKey<FormState>();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) => setState(() {
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: AppLoading(),
          )
        : Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
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
                                title: 'Login My Money',
                                iconSize: 80,
                                titleSize: 20,
                              ),
                              //---nome----//
                              TextFormField(
                                enabled: true,
                                controller: loginController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.text,

                                decoration: InputDecoration(
                                    label: Text("Nome"),
                                    border: UnderlineInputBorder(),
                                    prefixIconColor: AppColors.logo,
                                    prefixIcon: Icon(Icons.person)),

                                //---validar---//
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "preencha o campo";
                                  }
                                  return null;
                                },
                                //------------//

                                //----senha----//
                              ),
                              TextFormField(
                                enabled: true,
                                controller: passwordController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                obscureText: passVisible,

                                decoration: InputDecoration(
                                  label: Text("Senha"),
                                  border: UnderlineInputBorder(),
                                  prefixIconColor: AppColors.logo,
                                  prefixIcon: Icon(Icons.lock),
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
                                  child:
                                      AppButton(action: () {}, label: "Login")),
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
                            ])),
                  ),
                ),
              ),
            ),
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
