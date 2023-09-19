import 'package:dio/dio.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/modules/home/repository/expense_register_repository.dart';

class ExpenseRegisterService {
  ExpenseRegisterRepository repo = ExpenseRegisterRepository();

  Future<bool> postExpense({
    required String? userId,
    required String category,
    required String description,
    required double value,
    required String registrationDate,
  }) async {
    try {
      ExpenseModel expense = ExpenseModel(
          category: category,
          description: description,
          value: value.toDouble(),
          registrationDate: registrationDate);

      Response<Map<String, dynamic>> response =
          await repo.postExpenses(userId!, expense);
      print(response.data);
      return true;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateExpense({
    required String userId,
    required String category,
    required String description,
    required double value,
    required String registrationDate,
  }) async {
    try {
      ExpenseModel expense = ExpenseModel(
          category: category,
          description: description,
          value: value,
          registrationDate: registrationDate);

      Response<Map<String, dynamic>> response =
          await repo.updateExpenses(userId, expense);
      print(response.data);
      return true;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}
