import 'package:flutter/material.dart';
import '../../../shared/components/app_modal.dart';
import 'expense_register.dart';

class ExpenseButton {
  static Widget? add(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        AppModal.show(
          context,
          const ExpenseRegisterModal(),
          expand: false,
        );
      },
      tooltip: 'Nova despesa',
      child: const Icon(Icons.paid, color: Colors.white, size: 45),
    );
  }
}