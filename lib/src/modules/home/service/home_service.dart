import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/modules/home/repository/home_repository.dart';
import 'package:mymoney/src/modules/personalRegister/model/personalRegisterData_model.dart';

class HomeService{
  HomeRepository repository = HomeRepository();

  Future<List<ExpenseModel>> getExpenses() async{

    try{
      List<ExpenseModel> expenses = [];
      String? userId = await AppSettings.getData(AppKeys.user_id);

      Response<List<dynamic>> responseList = 
      await repository.getExpenses(userId!);

    print('Service - result: ${responseList.data}');

    responseList.data?.forEach((response) {
      expenses.add(ExpenseModel.fromJson(response));
     });

    return expenses;
    
    }catch(e){
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<double> getGoalValue() async{
    try{
      String? userId = await AppSettings.getData(AppKeys.user_id);

      Response<Map<String, dynamic>> response = 
      await repository.getGoal(userId!);

      PersonalRegisterModel personalRegister = 
      PersonalRegisterModel.fromJson(response.data!);

      return personalRegister.limitValue;
    }catch(e){
      debugPrint(e.toString());
      throw Exception(e);
    }

  }

}