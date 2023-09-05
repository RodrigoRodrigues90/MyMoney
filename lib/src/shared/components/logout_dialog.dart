// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Logout_dialog{

Future<Widget> throwDialog(context)async{
  return await showDialog(
  context: context,
  builder: (BuildContext context) {
    return SimpleDialog(
      elevation: 10,
      title: Text('Fazer Logout?'),
      children: <Widget> [
        SimpleDialogOption(
        child: (
            onPressed: Navigator.pop(),
            backgroundColor: Colors.grey,
            child: Text("voltar"),
            
            ),

        )
      ],
    );
  },      
  );
}

}