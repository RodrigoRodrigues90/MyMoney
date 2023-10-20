import 'package:flutter/material.dart';
import '../../../shared/components/app_modal.dart';
import 'expense_update.dart';

class ExpenseEditingButton {
  static Widget? add(BuildContext context, String id, String category,
      String description, double valor) {
    return IconButton(
      onPressed: () {
        AppModal.show(
          context,
          ExpenseUpdateModal(
            id: id,
            category: category,
            description: description,
            value: valor,
          ),
          expand: false,
        );
      },
      tooltip: 'Editar despesa',
      icon: const Icon(Icons.edit, color: Colors.black, size: 20),
    );
  }
}
