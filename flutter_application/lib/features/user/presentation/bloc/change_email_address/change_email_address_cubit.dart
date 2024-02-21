import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application/core/value_objects/email_value_object.dart';
import 'package:flutter_application/features/user/domain/exception/change_email_address_exception.dart';
import 'package:flutter_application/features/user/domain/use_case/change_email_address_use_case.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part '../change_email_address/change_email_address_state.dart';

@injectable
class ChangeEmailAddressCubit extends Cubit<ChangeEmailAddressState> {
  ChangeEmailAddressCubit(
    this._changeEmailAddressUseCase,
  ) : super(
          const ChangeEmailAddressState(),
        );

  final ChangeEmailAddressUseCase _changeEmailAddressUseCase;

  void emailChanged(String value) {
    final email = EmailValueObject.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
      ]),
    ));
  }

  void submitForm() async {
    if (!state.isValid) return;

    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));

    try {
      await _changeEmailAddressUseCase.execute(
        ChangeEmailAddressUseCaseParams(email: state.email.value),
      );

      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        email: const EmailValueObject.pure(),
      ));
    } on Exception catch (ex) {
      emit(state.copyWith(
        errorMessage: ex is ChangeEmailAddressException ? ex.message : null,
        status: FormzSubmissionStatus.failure,
      ));
    }
  }
}
