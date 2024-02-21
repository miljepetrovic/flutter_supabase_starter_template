import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/spacings.dart';
import 'package:flutter_application/core/extensions/build_context_extensions.dart';
import 'package:flutter_application/core/widgets/form_wrapper.dart';
import 'package:flutter_application/features/auth/presentation/widget/login_button.dart';
import 'package:flutter_application/features/auth/presentation/widget/login_email_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Let's get started!",
                  style: context.textTheme.displayLarge,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Spacing.s8),
              Center(
                child: Text(
                  "Please enter your email address to continue.",
                  style: context.textTheme.displayMedium,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: Spacing.s48),
              const LoginEmailInput(),
              const SizedBox(height: Spacing.s16),
              const LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
