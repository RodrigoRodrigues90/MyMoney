import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/home/controller/expense_register_controller.dart';

class ExpenseDeleteButton {
 static Widget? add(BuildContext context, String id) {
    return IconButton(
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("Excluir"),
            content: const Text('Excluir despesa?'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: Text('Não'),
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text('Sim'),
                isDestructiveAction: false,
                onPressed: () {
                  ExpenseRegisterController controller = ExpenseRegisterController();
                  controller.checkDeleteDate(context: context, id: id);
                },
              )
            ],
          ),
        );
      },
      tooltip: 'Deletar Despesa',
      icon: const Icon(Icons.delete_forever, color: Colors.red, size: 20),
    );
  }
}
