// ignore_for_file: file_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/personalRegister/controller/personalRegister_controller.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';
import 'package:mymoney/src/shared/components/logout_dialog.dart';

import '../../../shared/helpers/validarEmail.dart';

// ignore: camel_case_types
class personalRegisterPage extends StatefulWidget {
  const personalRegisterPage({super.key});

  @override
  State<personalRegisterPage> createState() => _personalRegisterPageState();
}

// ignore: camel_case_types
class _personalRegisterPageState extends State<personalRegisterPage> {
  PersonalRegisterController controller = PersonalRegisterController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Logout_dialog logout_dialog = Logout_dialog();
  
  bool passVisible = true;
  final _formKey = GlobalKey<FormState>();

  
//======AppBar name=======//

  late String? savedName = '';

  void loadSavedValue() async {
    String? valueName = await AppSettings.getData(AppKeys.user_fullName);
    setState(() {
      savedName = valueName;
    });
  }
//========================//


  @override
  void initState() {
    super.initState();
    loadSavedValue();
  }

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){Navigator.pop(context);}
      ),
      ),
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogoTitle(
                      title: "Meus dados",
                      titleSize: 20,
                      iconSize: 80,
                    ),
          
                    //---nome completo---//
                    TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: savedName,
                            label: Text("Nome Completo"),
                            border: UnderlineInputBorder(),
                            prefixIconColor: AppColors.logo,
                            prefixIcon: Icon(Icons.person)),
          
                        //----validar campo----//
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "preencha o campo";
                          }
                          return null;
                        }
                        //-------------------------------------//
                        ),
          
                    //----campo Email----//
                    const SizedBox(height: 20),
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "name@gmail.com",
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
                    const SizedBox(height: 20),
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
                      keyboardType: TextInputType.text,
                      obscureText: true,
          
                      decoration: const InputDecoration(
                          label: Text("Confirmar senha"),
                          border: UnderlineInputBorder(),
                          prefixIconColor: AppColors.logo,
                          prefixIcon: Icon(Icons.security_sharp)),
          
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
          
                    //---botão---//
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: AppButton(
                          action: () {
                            if (formValido()) {
                              controller.checkData(
                                nameController: nameController.text, 
                                emailController: emailController.text, 
                                senhaController: senhaController.text, 
                                context: context);
                            };
                          },
                          label: "Alterar dados"),
                    )
                  ], //Children
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool formValido(){
    if(_formKey.currentState!.validate()){
      return true;
    }else{
      return false;
    }

  }
}
