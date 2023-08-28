import 'package:flutter/material.dart';

class appError500_dialog{

Future<Widget> throwDialog(context)async{
  return await showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Erro de Conexão'),
      content: const Text('O servidor encontrou um erro interno. Por favor, tente novamente mais tarde.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Fechar o diálogo
          },
          child: const Text('OK'),
        ),
      ],
    );
  },      
  );
}

}