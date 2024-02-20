import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void focusField(
      BuildContext context, FocusNode current, FocusNode nextNode) {
    // current.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static void flashbarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 10),
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.red,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(20),
      )..show(context),
    );
  }
}
