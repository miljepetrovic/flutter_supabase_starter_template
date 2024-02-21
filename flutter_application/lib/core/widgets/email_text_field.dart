import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/base_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.onChanged,
    required this.errorText,
    required this.textInputAction,
  });

  final Function(String) onChanged;
  final TextInputAction textInputAction;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: "Email address",
      onChanged: onChanged,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      errorText: errorText,
    );
  }
}
