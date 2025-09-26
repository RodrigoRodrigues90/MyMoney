import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/home/components/expense_list.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/router/app_router.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_logo_title.dart';

class HistoryPage extends StatelessWidget{
  const HistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, List<ExpenseModel>>;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.home),
          icon: const Icon(Icons.arrow_back , color: AppColors.logo,
          ) ),
        ),
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogoTitle(title: "Historico de gastos",
                  titleSize: 20,
                  iconSize: 50,),

                  Padding(padding: const EdgeInsets.only(bottom: 20),
                  child: ExpenseList(expenses: args["expenses"]!),)
                  
                ]),),
            )) ),
    );
  }
}