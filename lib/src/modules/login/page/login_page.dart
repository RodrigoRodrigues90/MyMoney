// ignore_for_file: prefer_const_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mymoney/src/modules/login/components/register_link.dart';
import 'package:mymoney/src/modules/login/controller/loginController.dart';
import 'package:mymoney/src/modules/login/page/validate/validate_login_page.dart';
import 'package:mymoney/src/modules/registers/pages/register_page.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/app_loading.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';
import '../../../shared/components/error_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool passVisible = true;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();

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
                              title: 'Login MyMoney',
                              iconSize: 80,
                              titleSize: 20,
                            ),

                            //---nome----//
                            TextFormField(
                              enabled: true,
                              controller: nameController,
                              textAlign: TextAlign.start,
                              autofocus: false,
                              keyboardType: TextInputType.text,

                              decoration: InputDecoration(
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
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: AppButton(
                                    action: () async {
                                      if (formularioValido()) {
                                        try {

                                          var response =
                                              await controller.checkData(
                                            nameController: nameController.text,
                                            senhaController:senhaController.text,  
                                          );

                                          //sucesso!!
                                            if(response == 201){
                                              carregarValidado();
                                            }

                                          //erro usuário não cadastrado ou senha inválida     
                                        }on NoSuchMethodError{
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            backgroundColor: AppColors.expense,
                                            content: Text(
                                                "Usuário ou senha inválidos"),
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 1),
                                          ));
                                          
                                      
                                          //erro interno
                                        }on ClientException {
                                          carregarInvalidado();
                                        }
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

  //---paginas de valido/invalido---
  void carregarValidado() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ValidateLoginPage()));
  }

  void carregarInvalidado() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ErrorFormPage()));
  }
  //--------------------------------
}
