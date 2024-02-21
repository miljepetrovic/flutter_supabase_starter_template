import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application/core/extensions/build_context_extensions.dart';
import 'package:flutter_application/dependency_injection.dart';
import 'package:flutter_application/features/user/presentation/bloc/change_email_address/change_email_address_cubit.dart';
import 'package:flutter_application/features/user/presentation/widget/change_email_address_form.dart';
import 'package:formz/formz.dart';

import '../../../../core/constants/spacings.dart';

class ChangeEmailAddressPage extends StatelessWidget {
  const ChangeEmailAddressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangeEmailAddressCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.s16),
            child: BlocListener<ChangeEmailAddressCubit, ChangeEmailAddressState>(
              listener: (context, state) {
                switch (state.status) {
                  case FormzSubmissionStatus.failure:
                    context.showErrorSnackBarMessage(
                      state.errorMessage ?? "An unknown error occurred.",
                    );
                    return;
                  case FormzSubmissionStatus.success:
                    context
                        .showSnackBarMessage("Email with change email address details are sent.");
                    return;
                  default:
                    return;
                }
              },
              child: const ChangeEmailAddressForm(),
            ),
          ),
        ),
      ),
    );
  }
}
