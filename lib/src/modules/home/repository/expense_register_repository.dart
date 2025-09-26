import 'package:dio/dio.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';

import '../../../http/app_dio.dart';

class ExpenseRegisterRepository{

  Future<Response<Map<String,dynamic>>> postExpenses(String? userId, ExpenseModel model) async{
    String URL = "http://192.168.15.72:3099/expense/create";
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.post(URL, data: model.toJson(userId));
  }

  Future<Response<Map<String,dynamic>>> updateExpenses(String userId , ExpenseModel model) async{
    String URL = "http://172.18.0.1:3099/expense/update/$userId";
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.patch(URL, data: model.toJsonUpdate());
  }
  
  Future<Response<Map<String, dynamic>>> deleteExpense(String userId) async{
    String URL = "http://172.18.0.1:3099/expense/delete/$userId";
    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.delete(URL);
  }

}