import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/src/config/appKeys.dart';
import 'package:mymoney/src/config/app_settings.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/modules/home/repository/home_repository.dart';

class HomeService{
  HomeRepository repository = HomeRepository();

  Future<List<ExpenseModel>> getExpenses() async{

    try{
      List<ExpenseModel> expenses = [];
      String? userId = await AppSettings.getData(AppKeys.user_id);

      Response<List<dynamic>> responseList = 
      await repository.getExpenses(userId!);
      
    responseList.data?.forEach((response) {
      expenses.add(ExpenseModel.fromJson(response));
     });

    return expenses;
    
    }catch(e){
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

    
  Future<double> getGoalValue() async {
    try {
      String? userId = await AppSettings.getData(AppKeys.user_id);
      double limitValue = 0.0;
      Response<Map<String,dynamic>> response = await repository.getGoal(userId!);
      print(response.data);
      if (response.data != '') {
        int data = response.data?["limitValue"];
        limitValue = data.toDouble();
        AppSettings.saveData(
          AppKeys.goal_value,
          limitValue.toString(),
        );

        return limitValue;
      } else {
        return limitValue;
      }
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception(ex);
    }
  }

}