import 'package:flutter/material.dart';
import 'package:mymoney/src/shared/colors/app_colors.dart';
import 'package:mymoney/src/shared/components/app_modal.dart';

import '../../modules/home/components/expense_register.dart';

class ExpenseButton {
  static Widget? add(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(side: BorderSide.none),
      backgroundColor: AppColors.logo,
      onPressed: () {
        AppModal.show(
          context,
          const ExpenseRegisterModal(),
          expand: false,
        );
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
