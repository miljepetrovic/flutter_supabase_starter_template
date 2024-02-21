import 'package:flutter/material.dart';
import 'package:flutter_application/core/dialog/confirmation_dialog.dart';

class DialogUtils {
  const DialogUtils._();

  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => ConfirmationDialog(
            title: title,
            message: message,
            confirmText: confirmText,
          ),
        ) ??
        false;
  }
}
