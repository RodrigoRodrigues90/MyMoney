import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/registers/controller/registerController.dart';
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
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogoTitle(
                        title: "Cadastro My Money",
                        titleSize: 20,
                        iconSize: 80),
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      controller: nameController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(label: Text("Nome completo")),
                    ),
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      controller: emailController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(label: Text("E-mail")),
                    ),
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      controller: senhaController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(label: Text("Senha")),
                    ),
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      controller: senhaConfirmadaController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration:
                          const InputDecoration(label: Text("Confirmar Senha")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: AppButton(
                          action: () async{
                            await controller.checkData(
                              nameController: nameController.text,
                              emailController: emailController.text, 
                              senhaController: senhaController.text, 
                              senhacConfirmadaController: senhaConfirmadaController.text);
                          },
                          label: "Cadastrar"),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
