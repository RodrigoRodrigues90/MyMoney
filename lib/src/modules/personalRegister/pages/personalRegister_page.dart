
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/login/page/login_page.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_button.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';

// ignore: camel_case_types
class personalRegisterPage extends StatefulWidget {
  const personalRegisterPage({super.key});
  
  @override
  State<personalRegisterPage> createState() => _personalRegisterPageState();
}
// ignore: camel_case_types
class _personalRegisterPageState extends State<personalRegisterPage> {

late Future<String> nameUser;
late String savedValue = '';

void loadSavedValue() async {
    String value = await AppSettings.get();
    setState(() {
      savedValue = value;
    });
  }
  
  @override
  void initState(){
    super.initState();
    nameUser = AppSettings.get();
    loadSavedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.logo,
        elevation:10,
        leading: const Icon((Icons.person_2 ),color: AppColors.initialPageBackground,),       
        title: Text('${savedValue}'),
        titleTextStyle: 
          const TextStyle(color: AppColors.initialPageBackground),
          titleSpacing: -10,         
        shadowColor: AppColors.black,
        actions: [
          IconButton(onPressed: (){
             Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginPage()));
          }, icon: const Icon(Icons.logout), color: AppColors.appPageBackground,),          
        ], 
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogoTitle(
                    title: "Meus dados",
                    titleSize: 20,
                    iconSize: 80,
                    ),
                   
                   
                    TextFormField(
                      enabled: true,
                      textAlign: TextAlign.start,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text("Limite de gastos")),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 20),
                    child: AppButton(action: (){}, label: "Enviar dados"),
                    )

                ],//Children
              
              ),
            ),
          ),
        ),
      ),
    );
  }
}