import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/spacings.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.textInputAction,
    required this.keyboardType,
    this.helperText,
    this.errorText,
  });

  final Function(String) onChanged;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String labelText;
  final String? errorText;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
      ),
    );
  }
}
