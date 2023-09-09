import 'package:mobx/mobx.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{

  @observable
  late List<ExpenseModel> expenses;
  @observable
  late double accValue;
  @observable
  late double goalValue;

  @action
  Future<void> loadData()async{
    expenses = await _getExpenses();
    accValue = await _getAccValue();
    goalValue = await _getGoalValue();
  }

  Future<List<ExpenseModel>> _getExpenses() async{
    return <ExpenseModel>[];
  }
  Future<double> _getAccValue() async {
    return 0.0;
  }
  Future<double> _getGoalValue() async {
    return 0.0;
  }


}