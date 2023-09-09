import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/modules/home/service/home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{
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
  double plannedSpendBalance = 0;
  @observable
  double expensesDay = 0;
  @observable
  int dayOfMonth = 1;

  @action
  Future<void> loadData()async{
    expenses = await _getExpenses();
    accValue = await _getAccValue();
    goalValue = await _getGoalValue();
    dailyExpenseBalance = await _getDailyExpenseBalance();
    plannedSpendBalance = await  _getPlannedSpentBalance();
    expensesDay = await _getExpensesDay();
    dayOfMonth = await _getDayOfMonth();
    isLoading = false; 
  }

  Future<List<ExpenseModel>> _getExpenses() async{
    expenseList = await service.getExpenses();
    return expenseList.getRange(0, 3).toList();
  }

  Future<double> _getAccValue() async {
    double totalValue = 0.0;

    for(var expense in expenseList){
      totalValue += expense.value;
    }
    
    return totalValue;
  }

  Future<double> _getGoalValue() async {
    return await service.getGoalValue();
  }

  Future<double> _getDailyExpenseBalance() async{
    int daysOfMonth = 30;
    double spentBalance = goalValue - accValue;
    return (spentBalance / daysOfMonth).toDouble(); 
  }

  Future<double> _getPlannedSpentBalance() async{
    return goalValue - accValue;
  }

  Future<double> _getExpensesDay() async{
    double totalValue = 0;
    String actualDay = DateTime.now().toString();

    for(var expense in expenseList){
      if(expense.registrationDate == actualDay)
      totalValue += expense.value;
    }
    return totalValue;
  }

  Future<int> _getDayOfMonth() async {
    return DateTime.now().day;
  }



}