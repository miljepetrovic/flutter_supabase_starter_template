import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_application/core/use_cases/use_case.dart';
import 'package:flutter_application/features/auth/domain/repository/auth_repository.dart';

@injectable
class LoginWithEmailUseCase extends UseCase<Future<void>, LoginWithEmailParams> {
  LoginWithEmailUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  @override
  Future<void> execute(LoginWithEmailParams params) async {
    await _authRepository.loginWithEmail(params.email);
  }
}

class LoginWithEmailParams extends Equatable {
  const LoginWithEmailParams({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}
