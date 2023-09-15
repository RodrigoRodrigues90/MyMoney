import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/helpers/data_helper.dart';
import '../model/expense_model.dart';
import '../service/home_service.dart';


part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  HomeService service = HomeService();

  List<ExpenseModel> expenseList = [];

  @observable
  bool isLoading = false;

  @observable
  List<ExpenseModel> expenses = [];

  @observable
  double accValue = 0;

  @observable
  double goalValue = 0;

  @observable
  double dailyExpenseBalance = 0;

  @observable
  double plannedSpentBalance = 0;

  @observable
  double expensesDay = 0;

  @observable
  int dayOfMonth = 1;

  @action
  Future<void> loadData(BuildContext context) async {
    goalValue = await _getGoalValue();
    expenses = await _getExpenses();
    accValue = await _getAccValue();
    dailyExpenseBalance = await _getDailyExpenseBalance();
    plannedSpentBalance = await _getPlannedSpentBalance();
    expensesDay = await _getExpensesDay();
    dayOfMonth = await _getDayOfMonth();
    isLoading = false;
  }

  Future<List<ExpenseModel>> _getExpenses() async {
    expenseList = await service.getExpenses();

    return expenseList
        .getRange(
          0,
          expenseList.length >= 3 ? 3 : expenseList.length,
        )
        .toList();
  }

  Future<double> _getAccValue() async {
    double totalValue = 0.0;

    for (var expense in expenseList) {
      totalValue += expense.value;
    }

    return totalValue;
  }

  Future<double> _getGoalValue() async {
    return await service.getGoalValue();
  }

  Future<double> _getDailyExpenseBalance() async {
    int daysOfMonth = 30;
    double spentBalance = goalValue - accValue;
    return (spentBalance / daysOfMonth).toDouble().floorToDouble();
  }

  Future<double> _getPlannedSpentBalance() async {
    return goalValue - accValue;
  }

  Future<double> _getExpensesDay() async {
    double totalValue = 0;
    String actualDay = DateHelper.getFormatDMY(DateTime.now());

    for (var expense in expenseList) {
      if (expense.registrationDate == actualDay) totalValue += expense.value;
    }

    return totalValue;
  }

  Future<int> _getDayOfMonth() async {
    return int.parse(DateHelper.getDayOfMonth());
  }
}