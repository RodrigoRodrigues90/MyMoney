import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/home/model/expense_model.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';

class ExpenseList extends StatefulWidget {
  final String? title;
  final List<ExpenseModel> expenses;

  const ExpenseList({super.key, this.title, required this.expenses});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              const Icon(Icons.paid, color: AppColors.logo),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.title!,
                style: const TextStyle(
                    color: AppColors.logo,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _expenseItem(widget.expenses[index]);
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: widget.expenses.length),
        )
      ],
    );
  }

  Widget _expenseItem(ExpenseModel expense) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
            const Icon(
              Icons.price_change,
              color: AppColors.expense,
              size: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense.description,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Text(
                      expense.category,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ]),
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${expense.value.toString()}',
                style: const TextStyle(
                  color: AppColors.expense,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                expense.registrationDate,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
