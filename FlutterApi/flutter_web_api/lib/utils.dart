import 'package:flutter/material.dart';
import 'package:flutter_web_api/api_handler.dart';

ApiHandler apiHandler = ApiHandler();


void returnToMainPage(BuildContext context) async {
  Navigator.of(context).pop(); 

  final listCutomers = await apiHandler.getCustomerData();
  Navigator.pop(context, listCutomers);
}

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              returnToMainPage(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}