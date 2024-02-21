part of '../change_email_address/change_email_address_cubit.dart';

@immutable
class ChangeEmailAddressState extends Equatable {
  const ChangeEmailAddressState({
    this.email = const EmailValueObject.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final EmailValueObject email;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object> get props => [
        email,
        status,
        isValid,
      ];

  ChangeEmailAddressState copyWith({
    EmailValueObject? email,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return ChangeEmailAddressState(
      email: email ?? this.email,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
