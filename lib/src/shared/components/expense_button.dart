import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
class ExpenseButton {
  static Widget? add(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(side: BorderSide.none),
      backgroundColor: AppColors.logo,
      onPressed: () {
      },
      tooltip: "Nova Despesa",
      child: const Icon(
        Icons.paid,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}
