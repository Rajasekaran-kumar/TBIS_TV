import 'package:flutter/material.dart';

progressDialogue(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      //prevent Back button press
      return const PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
