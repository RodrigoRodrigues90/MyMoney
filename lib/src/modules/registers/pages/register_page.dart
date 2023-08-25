// ignore_for_file: prefer_const_constructors, avoid_print, empty_statements

import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/registers/controller/registerController.dart';
import 'package:mymoney/src/shared/components/error_page.dart';
import 'package:mymoney/src/modules/registers/validate/validarEmail.dart';
import 'package:mymoney/src/modules/registers/validate/validate_form_page.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  registerController controller = registerController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController senhaConfirmadaController = TextEditingController();
  bool passVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
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
                          title: "Cadastro My Money",
                          titleSize: 20,
                          iconSize: 80),

                      //------campo de nome--------//

                      TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        controller: nameController,
                        autofocus: false,
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                            label: Text("Nome Completo"),
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
                      ),

                      //----campo Email----//
                      SizedBox(height: 20),
                      TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        controller: emailController,
                        autofocus: false,
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                            label: Text("Email"),
                            border: UnderlineInputBorder(),
                            prefixIconColor: AppColors.logo,
                            prefixIcon: Icon(Icons.email)),

                        //----validar campo----//
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "preencha o campo";
                          }
                          if (!validarEmail(value)) {
                            return "formato inválido";
                          }
                          return null;
                        },
                        //---------------------//
                      ),

                      //----campo de senha-----//
                      SizedBox(height: 20),
                      TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        controller: senhaController,
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

                      //------campo confirmar senha----//
                      SizedBox(height: 20),
                      TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        controller: senhaConfirmadaController,
                        keyboardType: TextInputType.text,
                        obscureText: true,

                        decoration: const InputDecoration(
                            label: Text("Confirmar senha"),
                            border: UnderlineInputBorder(),
                            prefixIconColor: AppColors.logo,
                            prefixIcon: Icon(Icons.lock_person)),

                        //------validar campo------//
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "preencha o campo";
                          }
                          if (value.compareTo(senhaController.text) != 0) {
                            return "senha errada";
                          }
                          return null;
                        },
                        //-------------------------//
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: AppButton(
                            action: () async {
                              if (formularioValido()) {
                                try{
                                await controller.checkData(
                                    nameController: nameController.text,
                                    emailController: emailController.text,
                                    senhaController: senhaController.text,
                                    senhacConfirmadaController:
                                    senhaConfirmadaController.text);
                                    carregarValidado();
                              }catch(exception){
                                print("erro");
                                carregarInvalidado();
                              };

                              }
                            },
                            label: "Cadastrar"),
                      ),
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
      print("formulário invalido");
      return false;
    }
  }
  //---------------------------------------

  //---paginas de valido/invalido---
  void carregarValidado() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ValidateFormPage()));
  }
  void carregarInvalidado(){
     Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ErrorFormPage()));
  }
  //--------------------------------
}
