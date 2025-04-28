import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void showSuccessSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    margin: const EdgeInsets.all(12),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: Colors.green.shade600,
    duration: const Duration(seconds: 3),
    icon: const Icon(
      Icons.check_circle,
      color: Colors.white,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    leftBarIndicatorColor: Colors.white,
    animationDuration: const Duration(milliseconds: 400),
  ).show(context);
}
