import 'package:flutter/material.dart';

Future<void> showDialogWindow(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          child: Column(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Отмена"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Купить"),
          ),
        ],
      );
    },
  );
}
